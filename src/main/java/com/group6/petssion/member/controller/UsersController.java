package com.group6.petssion.member.controller;

import java.sql.Blob;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.UsersImg;
import com.group6.petssion.member.service.HobbyService;
import com.group6.petssion.member.service.JobService;
import com.group6.petssion.member.service.UserService;
import com.group6.petssion.member.service.UsersImgService;
import com.group6.petssion.member.validate.UsersDto;
import com.group6.petssion.repository.UsersRepository;

@Controller
@RequestMapping("/user")
public class UsersController {

	@Autowired
	private UsersRepository userRepository;
	
	@Autowired
	UsersImgService usersImgService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	HobbyService hobbyService;
	
	@Autowired
	JobService jobService;
	
	@GetMapping("/updateMember")
	public String updateMember(Model model) {
		Users user = new Users();
		model.addAttribute("user", user);
		
		return "/updateMember";
	}
	
	@GetMapping("/memberCenter")
	public String memberCenter() {
		return "memberCenter";
	}
	
	
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
		BeanUtils.copyProperties(usersDto, user);

//		if (petService.isUsersExist(pet)) {
//			List<Pet> list=petService.getAllPetNameByUserId(SessionUserId);
//			for(Pet petName:list) {
//				String name=String.valueOf(petName);
//				if(name==pet.getName()) {
//					result.rejectValue("name", "", "名字重複");
//					return "pet/insertPet";
//				}
//			}
//		}


//		----------------------------------
		List<MultipartFile> pictures = user.getImg();
		UsersImg usersImg = new UsersImg();
//		StringBuilder builder = new StringBuilder();
//		StringBuilder builder1 = new StringBuilder();

		if (null != pictures && pictures.size() > 0) {
			for (MultipartFile picture : pictures) {
				String fileName = picture.getOriginalFilename();
				if (picture != null && !picture.isEmpty()) {
					try {
						byte[] b = picture.getBytes();
//						Base64.Encoder encoder=Base64.getEncoder();
//						String encodedPic = encoder.encodeToString(b);
//						builder.append(encodedPic+",");
//						builder1.append(fileName+",");
						
						Blob blob = new SerialBlob(b);
						usersImg.setFileName(fileName);
						usersImg.setUsersImage(blob);
//					petImg.setFileName(builder1.toString());
//					petImg.setPetImage(builder.toString());
						usersImg.setUsers(user);
						Set<UsersImg> usersImgSet = new LinkedHashSet<UsersImg>();
						usersImgSet.add(usersImg);
						user.setUsersImg(usersImgSet);
						
						
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
				}
			}
			System.out.println(user.getImg());
		}
//		-------------------------------------------------
		try {
			userService.saveUser(user);
			usersImgService.saveUsersImg(usersImg);

		} catch (Exception e) {
			e.printStackTrace();
			return "updateMember";
		}

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
