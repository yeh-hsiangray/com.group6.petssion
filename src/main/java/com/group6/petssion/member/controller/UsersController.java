package com.group6.petssion.member.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.Job;
import com.group6.petssion.bean.Pet;
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
	
	@Autowired
	UsersImgService usersImgService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	HobbyService hobbyService;
	
	@Autowired
	JobService jobService;
	
	@Autowired
	ServletContext context;

	
	@GetMapping("/memberCenter")
	public String list(Model model, HttpServletRequest request) {

//		HttpSession session=request.getSession();
//		int SessionUserId =(int)session.getAttribute("userId");//抓取userId
//		System.out.println(SessionUserId);
		model.addAttribute("user", userService.findUserById(1));
		return "/memberCenter";
		
	}
	
	
	
	
	
	/**
	 * 進入編輯個人資料
	 * @param model
	 * @return
	 */
	
	@GetMapping("/updateMember")
	public String updateMember(Model model) {
		Users user = new Users();
		model.addAttribute("user", user);
		System.out.println(user);
		return "/updateMember";
	}
	
	/**
	 * 進入個人資訊
	 * @return
	 */
//	@GetMapping("/memberCenter")
//	public String memberCenter() {
//		return "memberCenter";
//	}
	
	/**
	 * 更新個人資訊
	 * @param usersDto
	 * @param result
	 * @param model
	 * @param request
	 * @return
	 */
	@PostMapping(value = "/updateMember")
	public String add(@ModelAttribute("user") @Valid UsersDto usersDto, BindingResult result, Model model,
			HttpServletRequest request) {
		if (usersDto.getJob().getId() == -1) {
			result.rejectValue("job", "", "必須挑選工作的選項");
		}
		if (usersDto.getHobby().getId() == -1) {
			result.rejectValue("hobby", "", "必須挑選興趣的選項");
		}

		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}

			return "updateMember";
		}

//		HttpSession session=request.getSession();
//		int SessionUserId =(int)session.getAttribute("userId");//抓取userId
//		System.out.println(SessionUserId);

		Users user = new Users();
		Pet pet = new Pet();
		BeanUtils.copyProperties(usersDto, user);
		
		user.setManager(2);
		user.setRegdate(LocalDate.now());
		user.setBlockade(0);
//		----------------------------------
		List<MultipartFile> pictures = user.getImg();
		
		if (null != pictures && pictures.size() > 0) {
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
						List<UsersImg> usersImgSet = new ArrayList<UsersImg>();
						usersImgSet.add(usersImg);
						user.setUsersImg(usersImgSet);
						List<Pet> petSet = new ArrayList<Pet>();
						petSet.add(pet);
						user.setPet(petSet);
						
						try {
							userService.saveUser(user);
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

		return "redirect:/user/memberCenter";
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
		System.out.println(hobbyList);
		System.out.println(jobList);
	}
	
	
	@GetMapping("/picture/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		List<UsersImg> usersImgs = usersImgService.findUserImgByUserId(id);

		for (UsersImg userImg : usersImgs) {
			if (usersImgs == null) {
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
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		System.out.println(re);
		return re;
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
	 * 新增資料
	 * 
	 * @param user
	 */
	@PostMapping("/create")
	public void add(@RequestBody Users user) {
		userService.saveUser(user);
	}
	
	
	/**
	 * 根據id刪除User資料
	 * 
	 * @param id
	 */
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id") Integer id) {
		userService.deleteById(id);
	}
	
	
	/**
	 * Updated
	 * @param putuser
	 * @param id
	 * @return
	 */
	@PutMapping("/update/{id}")
	public ResponseEntity<?> update(@RequestBody Users putuser, @PathVariable Integer id) {
		try {
			Users users = userService.findUserById(id);
			users.setName(putuser.getName());
			users.setGender(putuser.getGender());
			users.setBirthday(putuser.getBirthday());
			users.setAddress(putuser.getAddress());
			
			
			userService.saveUser(users);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (NoSuchElementException e) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	/**
	 * 特定id
	 * @param id
	 * @return
	 */
	@GetMapping("/find/{id}")
	public ResponseEntity<Users> get(@PathVariable(required = false) Integer id) {
		try {
			Users product = userService.findUserById(id);
			return new ResponseEntity<Users>(product, HttpStatus.OK);
		} catch(NoSuchElementException e) {
			return new ResponseEntity<Users>(HttpStatus.NOT_FOUND);
		}
	}
	
	@GetMapping("/all")
	public List<Users> listUserAll() {
		return userService.listUserAll();
	}

}
