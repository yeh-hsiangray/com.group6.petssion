package com.group6.petssion.petprofile.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.group6.petssion.bean.Food;
import com.group6.petssion.bean.Kind;
import com.group6.petssion.bean.Personality;
import com.group6.petssion.bean.Pet;
import com.group6.petssion.bean.PetImg;
import com.group6.petssion.bean.Type;
import com.group6.petssion.bean.Users;
import com.group6.petssion.member.controller.UsersController;
import com.group6.petssion.member.service.UserService;
import com.group6.petssion.petprofile.service.FoodService;
import com.group6.petssion.petprofile.service.KindService;
import com.group6.petssion.petprofile.service.PersonalityService;
import com.group6.petssion.petprofile.service.PetImgService;
import com.group6.petssion.petprofile.service.PetService;
import com.group6.petssion.petprofile.service.TypeService;
import com.group6.petssion.petprofile.validate.MyException;
import com.group6.petssion.petprofile.validate.PetDto;

@Controller
@RequestMapping("/pet")
public class PetController {
	private final Logger logger = LoggerFactory.getLogger(UsersController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private PetService petService;
	@Autowired
	private PetImgService petImgService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private KindService kindService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private PersonalityService personalityService;
	@Autowired
	private ServletContext context;

	@GetMapping("/showUserPets")
	public String list(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		int SessionUserId = (int) session.getAttribute("userId");// 抓取userId
		System.out.println(SessionUserId);

		List<Pet> pets = petService.findAllPetByUserId(SessionUserId);
//		使用者未輸入任何寵物時跳轉輸入頁
		if (pets.isEmpty()) {
			return "redirect:/pet/pet_form";
		}
//		將圖片放入map讓前端以key=id區分
		Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
		for (Pet pet : pets) {
			Integer petId = pet.getId();
			List<Integer> petImgIdList = petImgService.findPetImgIdByPetId(petId);
			map.put(petId, petImgIdList);
		}

		model.addAttribute("petImgIdMap", map);
		model.addAttribute("pet", pets);

		return "pet/ShowPet";
	}

	@GetMapping(value = "/pet_form")
	public String showEmptyForm(Model model) {

		Pet pet = new Pet();
		model.addAttribute("pet", pet);

		return "pet/InsertPet";
	}

	
	@PostMapping(value = "/pet_form")
	public String add(@ModelAttribute("pet") @Valid PetDto petDto, BindingResult result, Model model,
			HttpServletRequest request) {
//---------------------------驗證內容-------------------------------
		if (petDto.getType().getId() == -1) {
			result.rejectValue("type", "", "必須挑選品種欄的選項");
		}
		if (petDto.getType().getId() == -1) {
			result.rejectValue("type", "", "必須挑選種類欄的選項");
		}
		if (petDto.getType().getId() == 1) {
			for (int i = 6; i < 9; i++) {
				if (petDto.getKind().getId() == i) {
					result.rejectValue("kind", "", "必須挑選狗的種類");
				}
			}
		}
		if (petDto.getType().getId() == 2) {
			for (int i = 1; i < 6; i++) {
				if (petDto.getKind().getId() == i) {
					result.rejectValue("kind", "", "必須挑選貓的種類");
				}
			}
		}

		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}

			return "pet/InsertPet";
		}

		HttpSession session = request.getSession();
		int SessionUserId = (int) session.getAttribute("userId");// 抓取userId
		System.out.println(SessionUserId);
//		將驗證內容複製至bean
		Pet pet = new Pet();
		BeanUtils.copyProperties(petDto, pet);
//--------------------------儲存外鍵---------------------------------------------
		List<Users> list = userService.findUserByUserId(SessionUserId);
		System.out.println(list);
		for (Users user : list) {
			pet.setUser(user);
			pet.setUserId(user.getId());
		}
//----------------------------圖片處理-----------------------------------------
		List<MultipartFile> pictures = pet.getImg();

		if (pictures != null && pictures.size() > 0) {
			for (MultipartFile picture : pictures) {
				PetImg petImg = new PetImg();
				String fileName = picture.getOriginalFilename();
				if (picture != null && !picture.isEmpty()) {
					try {
						byte[] b = picture.getBytes();

						Blob blob = new SerialBlob(b);
						petImg.setFileName(fileName);
						petImg.setPetImage(blob);
						petImg.setPet(pet);
						System.out.println(blob);

						List<PetImg> petImgSet = new ArrayList<PetImg>();
						petImgSet.add(petImg);
						pet.setPetImg(petImgSet);

						try {
							petService.savePet(pet);
							petImgService.savePetImg(petImg);
						} catch (Exception e) {
							e.printStackTrace();
							return "pet/InsertPet";
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
				}
			}
		}
//		-------------------------------------------------
		return "redirect:/pet/showUserPets";
	}

	
	@GetMapping(value = "/update/{id}")
	public String showDataForm(@PathVariable("id") Integer id, Model model, HttpServletRequest request)
			throws MyException {
		HttpSession session = request.getSession();
		int SessionUserId = (int) session.getAttribute("userId");// 抓取userId
		System.out.println(SessionUserId);

//		放入map讓前端以key->id區分
		Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
		Pet pet = petService.get(id);
//      如果使用者想訪問別的寵物id將被禁止
		if (pet.getUser().getId() != SessionUserId) {
			throw new MyException("無訪問權限");
		}
		Integer petId = pet.getId();
		System.out.println(petId);
		List<Integer> petImgIdList = petImgService.findPetImgIdByPetId(petId);
//		因前端有8格 當原有使用者圖不足8張 塞null補足8張
		while (petImgIdList.size() < 8) {
			petImgIdList.add(null);
		}
		map.put(petId, petImgIdList);

		model.addAttribute("petImgIdMap", map);
		model.addAttribute("pet", pet);
		return "pet/UpdatePet";
	}

	
	@PostMapping("/update/{id}")
	public String modify(@ModelAttribute("pet") @Valid PetDto petDto, BindingResult result, Model model,
			@PathVariable Integer id, @RequestParam(value = "delImgId", required = false) List<String> delId,
			HttpServletRequest request) {
//--------------------驗證有錯時返回頁面圖片------------------------------------------------	
		Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
		Pet pets = petService.get(id);
		Integer petId = pets.getId();
		System.out.println(petId);
		List<Integer> petImgIdList = petImgService.findPetImgIdByPetId(petId);
//		因前端有8格 當原有使用者圖不足8張 塞null補足8張
		while (petImgIdList.size() < 8) {
			petImgIdList.add(null);
		}
		map.put(petId, petImgIdList);

		model.addAttribute("petImgIdMap", map);
//------------------------驗證內容--------------------------------------------	

		if (petDto.getType().getId() == -1) {
			result.rejectValue("type", "", "必須挑選品種欄的選項");
		}
		if (petDto.getType().getId() == -1) {
			result.rejectValue("type", "", "必須挑選種類欄的選項");
		}
		if (petDto.getType().getId() == 1) {
			for (int i = 6; i < 9; i++) {
				if (petDto.getKind().getId() == i) {
					result.rejectValue("kind", "", "必須挑選狗的種類");
				}
			}
		}
		if (petDto.getType().getId() == 2) {
			for (int i = 1; i < 6; i++) {
				if (petDto.getKind().getId() == i) {
					result.rejectValue("kind", "", "必須挑選貓的種類");
				}
			}
		}

		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}

			return "pet/UpdatePet";
		}
//		將驗證內容複製至bean
		Pet pet = new Pet();
		BeanUtils.copyProperties(petDto, pet);
//-----------------------儲存外鍵----------------------------------------------
		HttpSession session = request.getSession();
		int SessionUserId = (int) session.getAttribute("userId");// 抓取userId
		System.out.println(SessionUserId);
		List<Users> list = userService.findUserByUserId(SessionUserId);
		System.out.println(list);
		for (Users user : list) {
			pet.setUser(user);
			pet.setUserId(user.getId());
		}
//------------------------------原有圖片處理--------------------------
//		當使用者更新原有圖片時 回傳原有圖id刪除 才不會重複
		if (delId != null) {
			for (String dId : delId) {
				if (dId.startsWith("d")) {
					String s = dId.replace("d", "");
					Integer i = Integer.parseInt(s);
					if (petImgService.isPetImgExist(i)) {
						petImgService.delete(i);
						System.out.println("更新原有圖del#" + i);
					}
				} else {
					System.out.println("無更新原有圖片");
				}
			}
		} else if (delId == null) {
			System.out.println("無圖片");
		}
//-----------------------先儲存內容防止無更新圖片時 內容無儲存-----------------------------------------
		petService.updatePet(pet);
//-----------------------------新增圖片處理-----------------------------------
		List<MultipartFile> pictures = pet.getImg();

		if (pictures != null && pictures.size() > 0) {
			for (MultipartFile picture : pictures) {
				PetImg petImg = new PetImg();
				String fileName = picture.getOriginalFilename();
				if (picture != null && !picture.isEmpty()) {
					try {
						byte[] b = picture.getBytes();

						Blob blob = new SerialBlob(b);
						petImg.setFileName(fileName);
						petImg.setPetImage(blob);
						petImg.setPet(pet);
						System.out.println(blob);
						List<PetImg> petImgSet = new ArrayList<PetImg>();
						petImgSet.add(petImg);
						pet.setPetImg(petImgSet);

						try {
//						petService.updatePet(pet);
							petImgService.updatePetImg(petImg);
						} catch (Exception e) {
							e.printStackTrace();
							return "pet/UpdatePet";
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
				}
			}
		}
//------------------------------------------------------------------------
		return "redirect:/pet/showUserPets";
	}

	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
//		先將petImg刪除 因pet有外鍵關聯
		List<Integer> list = petImgService.findPetImgIdByPetId(id);
		for (Integer petImgId : list) {
			petImgService.delete(petImgId);
		}
		petService.deletePet(id);
		return "redirect:/pet/showUserPets";
	}

	
	@ModelAttribute
	public void commonData(Model model) {
		List<Type> typeList = typeService.getAllType();
		List<Kind> kindList = kindService.getAllKind();
		List<Food> foodList = foodService.getAllFood();
		List<Personality> personalityList = personalityService.getAllPersonality();
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("公", "公");
		genderMap.put("母", "母");
		model.addAttribute("typeList", typeList);
		model.addAttribute("kindList", kindList);
		model.addAttribute("foodList", foodList);
		model.addAttribute("personalityList", personalityList);
		model.addAttribute("genderMap", genderMap);
	}

	
	@GetMapping("/picture/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;

		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		PetImg petImg = petImgService.get(id);

		if (petImg == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = petImg.getFileName();
		if (filename != null) {
			mediaType = MediaType.valueOf(context.getMimeType(filename));
			headers.setContentType(mediaType);
		}
		Blob blob = petImg.getPetImage();
		if (blob != null) {
			body = blobToByteArray(blob);
		}

		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		System.out.println(re);
		return re;
	}

	
	@GetMapping("/delPicture/{id}-{petId}")
	public String delPicture(@PathVariable("id") Integer id, @PathVariable("petId") Integer petId) {
//		更新頁點選X時刪除原有圖片
		petImgService.delete(id);

		Pet pet = petService.get(petId);
		Integer pId = pet.getId();
		System.out.println(pId);

		return "redirect:/pet/update/" + pId;
	}

	
	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	@ExceptionHandler({ Exception.class })
	public ModelAndView handleException(HttpServletRequest request, Exception e) {
		logger.error("Request URL: {}, Exception : {}", request.getRequestURL(), e.getMessage());

		ModelAndView mav = new ModelAndView();
		mav.addObject("url", request.getRequestURL());
		mav.addObject("exception", e);
		mav.setViewName("error/error");

		return mav;
	}
}
