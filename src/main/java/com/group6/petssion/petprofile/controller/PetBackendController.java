package com.group6.petssion.petprofile.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.petssion.bean.Pet;
import com.group6.petssion.bean.Users;
import com.group6.petssion.member.service.UserService;
import com.group6.petssion.petprofile.service.FoodService;
import com.group6.petssion.petprofile.service.KindService;
import com.group6.petssion.petprofile.service.PersonalityService;
import com.group6.petssion.petprofile.service.PetImgService;
import com.group6.petssion.petprofile.service.PetService;
import com.group6.petssion.petprofile.service.TypeService;

@Controller
@RequestMapping("/pet")
public class PetBackendController {
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
	
	
	@GetMapping("/showAllPets")
	public String list(Model model) {
		List<Users> users=userService.findAllUser();
		List<Pet> pets=petService.findAllPet();
		
		model.addAttribute("users", users);
		return "pet/ShowBackend";
		
	}
	
	
	
	
}
