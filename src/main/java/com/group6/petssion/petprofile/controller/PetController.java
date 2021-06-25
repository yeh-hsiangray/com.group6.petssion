package com.group6.petssion.petprofile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.petssion.bean.Food;
import com.group6.petssion.bean.Kind;
import com.group6.petssion.bean.Personality;
import com.group6.petssion.bean.Pet;
import com.group6.petssion.bean.PetImg;
import com.group6.petssion.bean.Type;
import com.group6.petssion.petprofile.service.FoodService;
import com.group6.petssion.petprofile.service.KindService;
import com.group6.petssion.petprofile.service.PersonalityService;
import com.group6.petssion.petprofile.service.PetService;
import com.group6.petssion.petprofile.service.TypeService;
import com.group6.petssion.petprofile.validate.PetDto;

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

	@GetMapping("/showUserPets")
	public String list(Model model,HttpServletRequest request) {
//		HttpSession session=request.getSession();
//		int SessionUserId =(int)session.getAttribute("userId");//抓取userId
//		System.out.println(SessionUserId);
		model.addAttribute("pet", petService.findAllPetByUserId(1));
		return "pet/pets";

	}

	@GetMapping(value = "/pet_form")
	public String showEmptyForm(Model model) {
		Pet pet = new Pet();
		model.addAttribute("pet", pet);

		return "pet/insertPet";

	}

	@PostMapping(value = "/pet_form")
	public String add(@ModelAttribute("pet") @Valid PetDto petDto, BindingResult result, Model model,
			HttpServletRequest request) {
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
			return "pet/insertPet";
		}

//		HttpSession session=request.getSession();
//		int SessionUserId =(int)session.getAttribute("userId");//抓取userId
//		System.out.println(SessionUserId);

		Pet pet = new Pet();
		BeanUtils.copyProperties(petDto, pet);

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
		
//		pet.setUserId(SessionUserId);

		Type type = typeService.getType(pet.getType().getId());
		pet.setType(type);

		Kind kind = kindService.getKind(pet.getKind().getId());
		pet.setKind(kind);

		Food food = foodService.getFood(pet.getFood().getId());
		pet.setFood(food);

		Personality personality = personalityService.getPersonality(pet.getPersonality().getId());
		pet.setPersonality(personality);

		try {
			petService.savePet(pet);
		} catch (Exception e) {
			e.printStackTrace();
			return "pet/insertPet";
		}

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

}
