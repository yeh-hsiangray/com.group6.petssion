package com.group6.petssion.petprofile.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group6.petssion.bean.Pet;
import com.group6.petssion.bean.Users;
import com.group6.petssion.member.service.UserService;
import com.group6.petssion.member.service.UsersImgService;
import com.group6.petssion.petprofile.service.PetImgService;
import com.group6.petssion.petprofile.service.PetService;

@Controller
@RequestMapping("/pet")
public class PetBackendController {
	@Autowired
	private UserService userService;
	@Autowired
	private UsersImgService usersImgService;
	@Autowired
	private PetService petService;
	@Autowired
	private PetImgService petImgService;

	@GetMapping("/showAll")
	public String list(Model model) {
		List<Users> users = userService.findAllUser();

		model.addAttribute("users", users);
		return "pet/ProfileBackend";

	}

	@RequestMapping(value = "/searchUsers")
	public String searchUsers(Model model, @RequestParam(value = "searchType", required = false) String searchType,
			@RequestParam(value = "searchWord", required = false) String searchWord) {
		System.out.println(searchType);
		System.out.println(searchWord);

		if (searchWord != null) {
			if ("姓名".equals(searchType)) {
				List<Users> users = userService.searchUserByName(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("性別".equals(searchType)) {
				List<Users> users = userService.searchUserByGender(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("住址".equals(searchType)) {
				List<Users> users = userService.searchUserByAddress(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("行動電話".equals(searchType)) {
				List<Users> users = userService.searchUserByMobilephone(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("email".equals(searchType)) {
				List<Users> users = userService.searchUserByEmail(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("封鎖狀態".equals(searchType)) {
				List<Users> users = userService.searchUserByBlockade(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("生日".equals(searchType)) {// 問題
				List<Users> users = userService.searchUserByBirth(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("工作".equals(searchType)) {
				List<Users> users = userService.searchUserByJob(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("興趣".equals(searchType)) {
				List<Users> users = userService.searchUserByHobby(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			} else if ("加入日期".equals(searchType)) {
				List<Users> users = userService.searchUserByRegdate(searchWord);
				model.addAttribute("users", users);
				return "pet/ProfileBackend";
			}
		} else if ("請選擇".equals(searchType) && searchWord == null) {
			return "redirect:/pet/showAll";
		}
		return "redirect:/pet/showAll";
	}

	@GetMapping("/PetProfile/{id}")
	public String petlist(Model model,@PathVariable("id") Integer id) {

		List<Pet> pets = petService.findAllPetByUserId(id);
		Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
//		放入map讓前端以key->id區分
		for (Pet pet : pets) {
			Integer petId = pet.getId();
			List<Integer> petImgIdList = petImgService.findPetImgIdByPetId(petId);
			map.put(petId, petImgIdList);
		}

		model.addAttribute("petImgIdMap", map);
		model.addAttribute("pet", pets);

		return "pet/ShowPet";
	}
	
	@GetMapping("/memberProfile/{id}")
	public String memberlist(Model model,@PathVariable("id") Integer id) {

		List<Users> users = userService.findUserByUserId(id);
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
	
}
