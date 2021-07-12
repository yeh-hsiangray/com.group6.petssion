package com.group6.petssion.member.controller;


import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.time.LocalDate;
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

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.Job;
import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.UsersImg;
import com.group6.petssion.member.service.HobbyService;
import com.group6.petssion.member.service.JobService;
import com.group6.petssion.member.service.UserService;
import com.group6.petssion.member.service.UsersImgService;
import com.group6.petssion.member.validate.UsersDto;

@Controller
@RequestMapping("/user")
public class UsersController {
	
	private final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Autowired
	private UsersImgService usersImgService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HobbyService hobbyService;
	
	@Autowired
	private JobService jobService;
	
	@Autowired
	private ServletContext context;

	
	@GetMapping("/memberCenter")
	public String list(Model model, HttpServletRequest request) {

		HttpSession session=request.getSession();
		int SessionUserId =(int)session.getAttribute("userId");//抓取userId
		List<Users> users = userService.findUserByUserId(SessionUserId);
		Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
		
		for(Users user: users) {
			Integer userId = user.getId();
			List<Integer> userImgIdList = usersImgService.findUserImgByUserId(userId);
			map.put(userId, userImgIdList);
		}
		
		model.addAttribute("userImgIdMap",map);
		model.addAttribute("user", users);
		
		return "/memberCenter";
	}
	
	/**
	 * 進入編輯個人資料
	 * @param model
	 * @return
	 */
	
	@GetMapping("/updateMember")
	public String updateMember(Model model,HttpServletRequest request) {
		Users user = new Users();
		model.addAttribute("user", user);
		
		return "/updateMember";
	}
	
	/**
	 * 更新個人資訊
	 * @param usersDto
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/updateMember")
	public String add(@ModelAttribute("user") Users usersDto, BindingResult result, Model model,
			HttpServletRequest request) {
//		if (usersDto.getJob().getId() == -1) {
//			result.rejectValue("job", "", "必須挑選工作的選項");
//		}
//		if (usersDto.getHobby().getId() == -1) {
//			result.rejectValue("hobby", "", "必須挑選興趣的選項");
//		}
//
//		if (result.hasErrors()) {
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println("有錯誤：" + error);
//			}
//
//			return "updateMember";
//		}

//		HttpSession session=request.getSession();
//		int SessionUserId =(int)session.getAttribute("userId");//抓取userId
//		System.out.println(SessionUserId);
		System.out.println(usersDto.getName());
		System.out.println(new Users().getId());
		Users user = usersDto;
//		BeanUtils.copyProperties(usersDto, user);
		
		user.setManager(2);
		user.setRegdate(LocalDate.now());
		user.setBlockade(0);
//		----------------------------------
		List<MultipartFile> pictures = user.getImg();
		
		if (pictures != null && pictures.size() > 0) {
			for (MultipartFile picture : pictures) {
				UsersImg usersImg = new UsersImg();
				String fileName = picture.getOriginalFilename();
				if (picture != null && !picture.isEmpty()) {
					try {
						byte[] b = picture.getBytes();
						
						Blob blob = new SerialBlob(b);
						usersImg.setFileName(fileName);
						usersImg.setUsersImage(blob);
						usersImg.setUsers(user);
						System.out.println(blob);
						
						List<UsersImg> usersImgSet = new ArrayList<UsersImg>();
						usersImgSet.add(usersImg);
						user.setUsersImg(usersImgSet);
						
						try {
							System.out.println(1);
							userService.saveUser(user);
							System.out.println(2);
							usersImgService.saveUsersImg(usersImg);
							
						} catch (Exception e) {
							e.printStackTrace();
							return "updateMember";
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
				}
			}
		}

		return "redirect:/pet/pet_form";
	}
	
	@GetMapping(value = "/update/{id}")
	public String showDataForm(@PathVariable("id") Integer id, Model model) {
		
		Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
		Users users = userService.get(id);
			Integer userId = users.getId();
			System.out.println(userId);
			
			
			List<Integer> userImgIdList = usersImgService.findUserImgByUserId(userId);
			while (userImgIdList.size() < 8) {
				userImgIdList.add(null);
			}
			map.put(userId, userImgIdList);
		
			model.addAttribute("userImgIdMap",map);
			model.addAttribute("user", users);
		return "/ModifyUser";
	}
	
	/**
	 * 更新使用者資料
	 * @param usersDto
	 * @param result
	 * @param model
	 * @param id
	 * @param delId
	 * @return
	 */
	
	@PostMapping("/update/{id}")
	public String modify(@ModelAttribute("user") @Valid UsersDto usersDto, BindingResult result, Model model,
			@PathVariable Integer id, @RequestParam(value = "delImgId", required = false) List<String> delId)
	{
		Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
		Users users = userService.get(id);
			Integer userId = users.getId();
			System.out.println(userId);
			List<Integer> userImgIdList = usersImgService.findUserImgByUserId(userId);
			while (userImgIdList.size() < 8) {
				userImgIdList.add(null);
			}
			map.put(userId, userImgIdList);
		
			model.addAttribute("userImgIdMap",map);
			
		if (usersDto.getJob().getId() == -1) {
			System.out.println(usersDto.getJob().getId());
			result.rejectValue("job", "", "必須挑選工作的選項");
		}
	if (usersDto.getHobby() == null) {
			result.rejectValue("hobby", "", "必須挑選興趣的選項");
		}

		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
//			Integer uid = usersDto.getId();
			
			return "ModifyUser";
		}
		
		Users user = new Users();
		
		user.setManager(2);
		user.setRegdate(LocalDate.now());
		user.setBlockade(0);
		user.setCheckemail(1);
		
		BeanUtils.copyProperties(usersDto, user);

		if (delId != null) {
			for (String dId : delId) {
				if (dId.startsWith("d")) {
					String s = dId.replace("d", "");
					Integer i = Integer.parseInt(s);
					if (usersImgService.isUserImgExist(i)) {
						usersImgService.delete(i);
						System.out.println("更新原有圖del#" + i);
					}
				}else {
					System.out.println("無更新原有圖片");
				}
			}
		}
		userService.updateUser(user);
		
		List<MultipartFile> pictures = user.getImg();

		if (pictures != null && pictures.size() > 0) {
			for (MultipartFile picture : pictures) {
				UsersImg usersImg = new UsersImg();
				String fileName = picture.getOriginalFilename();
				if (picture != null && !picture.isEmpty()) {
					try {
						byte[] b = picture.getBytes();
						
						Blob blob = new SerialBlob(b);
						usersImg.setFileName(fileName);
						usersImg.setUsersImage(blob);
						usersImg.setUsers(user);
						System.out.println(blob);
						List<UsersImg> usersImgSet = new ArrayList<UsersImg>();
						usersImgSet.add(usersImg);
						user.setUsersImg(usersImgSet);

						try {
//						userService.updateUser(user);
							usersImgService.updateUsersImg(usersImg);
						} catch (Exception e) {
							e.printStackTrace();
							return "/ModifyUser";
						}
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
				}
			}
		}
		return "redirect:/user/memberCenter";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		
		List <Integer> list = usersImgService.findUserImgByUserId(id);
				for(Integer userImgId:list) {
					usersImgService.delete(userImgId);
				}
				userService.deleteUser(id);
				return "redirect:/memberCenter";
	}
	
	
	/**
	 * 興趣、工作欄
	 * @param model
	 */
	
	@ModelAttribute
	public void commonData(Model model) {
		List<Hobby> hobbyList = hobbyService.getAllHobby();
		List<Job> jobList = jobService.getAllJob();
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("男", "男");
		genderMap.put("女", "女");
		model.addAttribute("hobbyList", hobbyList);
		model.addAttribute("jobList", jobList);
		model.addAttribute("genderMap", genderMap);
	}
	
	@GetMapping("/picture/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		UsersImg userImg=usersImgService.get(id);
		
			if (userImg == null) {
				return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
			}
			String filename = userImg.getFileName();
			if (filename != null) {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
			Blob blob = userImg.getUsersImage();
			if (blob != null) {
				body = blobToByteArray(blob);
			}
			
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		System.out.println(re);
		return re;
	}
	
	@GetMapping("/delPicture/{id}-{userId}")
	public String delPicture(@PathVariable("id") Integer id,@PathVariable("userId") Integer userId) {
		usersImgService.delete(id);
		
		Users user = userService.get(userId);
		Integer uId = user.getId();
		System.out.println(uId);
		
		return "redirect:/user/update/"+uId;
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
	
	/**
	 * 異常處理
	 * @param request
	 * @param e
	 * @return
	 */
	@ExceptionHandler({Exception.class})
	public ModelAndView handleException(HttpServletRequest request, Exception e) {
		logger.error("Request URL: {}, Exception : {}", request.getRequestURL(), e.getMessage());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("url", request.getRequestURL());
		mav.addObject("exception", e);
		mav.setViewName("error/error");
		
		return mav;
	}
	
}
	
	
//	/**
//	 * 根據id刪除User資料
//	 * 
//	 * @param id
//	 */
//	@DeleteMapping("/delete/{id}")
//	public void delete(@PathVariable("id") Integer id) {
//		userService.deleteById(id);
//	}
//	
//	/**
//	 * 特定id
//	 * @param id
//	 * @return
//	 */
//	@GetMapping("/find/{id}")
//	public ResponseEntity<Users> get(@PathVariable(required = false) Integer id) {
//		try {
//			Users product = userService.findUserById(id);
//			return new ResponseEntity<Users>(product, HttpStatus.OK);
//		} catch(NoSuchElementException e) {
//			return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
//		}
//	}
//	
//	@GetMapping("/all")
//	public List<Users> listUserAll() {
//		return userService.listUserAll();
//	}
