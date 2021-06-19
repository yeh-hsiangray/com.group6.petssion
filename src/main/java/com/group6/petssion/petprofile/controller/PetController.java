package com.group6.petssion.petprofile.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.petssion.petprofile.model.Food;
import com.group6.petssion.petprofile.model.Kind;
import com.group6.petssion.petprofile.model.Personality;
import com.group6.petssion.petprofile.model.Pet;
import com.group6.petssion.petprofile.model.Type;
import com.group6.petssion.petprofile.service.FoodService;
import com.group6.petssion.petprofile.service.KindService;
import com.group6.petssion.petprofile.service.PersonalityService;
import com.group6.petssion.petprofile.service.PetService;
import com.group6.petssion.petprofile.service.TypeService;

@Controller
@RequestMapping("/pet")
public class PetController {
	
	@Autowired
	PetService petService;
	@Autowired
	FoodService foodService;
	@Autowired
	KindService kindService;
	@Autowired
	TypeService typeService;
	@Autowired
	PersonalityService personalityService;
	
	@GetMapping(value = "/pet_form")
	public String showEmptyForm(Model model) {
		Pet pet=new Pet();
		model.addAttribute("pet", pet);
		
		
		return "pet/insertPet";
		
	}
	
	
	@PostMapping(value = "/pet_form")
	public String add(
			@ModelAttribute("pet") /* @Valid */ Pet pet, 
			BindingResult result, Model model,
			HttpServletRequest request) {
				return null;
		
	}
	
	@ModelAttribute
	public void commonData(Model model) {
		List<Type> typeList=typeService.getAllType();
		List<Kind> kindList=kindService.getAllKind();
		List<Food> foodList=foodService.getAllFood();
		List<Personality> personalityList=personalityService.getAllPersonality();
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("M", "公");
		genderMap.put("F", "母");
		model.addAttribute("typeList",typeList);
		model.addAttribute("kindList",kindList);
		model.addAttribute("foodList",foodList);
		model.addAttribute("personalityList",personalityList);
		model.addAttribute("genderMap",genderMap);
	}
	
	
}
