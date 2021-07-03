package com.group6.petssion.friendlyEnvProfile.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group6.petssion.bean.FriendlyEnv;
import com.group6.petssion.friendlyEnvProfile.service.FriendlyEnvService;

@Controller
@SessionAttributes({ "userRole"})
public class FriendlyController {

	@Autowired
	FriendlyEnvService service;

	@Autowired
	ServletContext servletContext;

	@GetMapping({ "/FriendlyEnv" })
	public String home() {
		return "friendlyEnv";
	}

	@GetMapping("/FriendlyEnvSearch")
	public ModelAndView friendlyEnvSearchHome() {
		ModelAndView mv = new ModelAndView("FriendlyEnvSearch");
		mv.addObject("userRole", "admin");
		return mv;
	}
	
	@GetMapping("/FriendlyEnvSearchFR")
	public ModelAndView friendlyEnvSearchHomeFR() {
		ModelAndView mv = new ModelAndView("FriendlyEnvSearch");
		mv.addObject("userRole", "general");
		return mv;
	}

	@GetMapping("/GetOrUpdateOneEnv")
	public ModelAndView getOneFriendlyEnv(@RequestParam String envId,
			@ModelAttribute("friendlyEnvU") FriendlyEnv friendlyEnvU) {
		ModelAndView mv = new ModelAndView("envDetail");
		FriendlyEnv friendlyEnv = service.get(Integer.valueOf(envId));
		InputStream is = null;
		if (friendlyEnv.getImage() != null && !friendlyEnv.getFileName().isEmpty() && friendlyEnv.getFileName().trim().length()>0) {
			is = new ByteArrayInputStream(friendlyEnv.getImage());
		} else {
			System.out.println("We are getting the default photo");
			is = getDefaultPhoto();
		}

		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

		int length;
		try {
			length = is.available();
			byte[] bytes = new byte[length];
			while ((length = is.read(bytes)) != -1) {
				outputStream.write(bytes, 0, length);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		byte[] imageBytes = outputStream.toByteArray();
		String base64Image = Base64.getEncoder().encodeToString(imageBytes);

		String[] typesArr = friendlyEnv.getAnimalTypes().split(",");
		for (int i = 0; i < typesArr.length; i++) {
			typesArr[i] = typesArr[i].trim();
		}

		friendlyEnvU.setName(friendlyEnv.getName());
		friendlyEnvU.setAnimalTypesArr(typesArr);

		friendlyEnvU.setEnvTypes(friendlyEnv.getEnvTypes().trim());

		friendlyEnvU.setTelephone(friendlyEnv.getTelephone());
		friendlyEnvU.setAddress(friendlyEnv.getAddress());

		String envTypeL = "";
		String envTypeR = "";
		String envTypeB = "";

		String cityTP = "";
		String cityTC = "";
		String cityHZ = "";

		mv.addObject("envTypeL", envTypeL);
		mv.addObject("envTypeR", envTypeR);
		mv.addObject("envTypeB", envTypeB);
		mv.addObject("cityTP", cityTP);
		mv.addObject("cityTC", cityTC);
		mv.addObject("cityHZ", cityHZ);
		mv.addObject("photo", base64Image);

		return mv;
	}

	@GetMapping("/GetAllEnvs")
	public ModelAndView getAllFriendlyEnv() {
		List<FriendlyEnv> friendlyEnvList = service.getAllFriendlyEnvs();
		ModelAndView mv = new ModelAndView("AllEnvs");
		mv.addObject("allEnvs", friendlyEnvList);
		return mv;
	}

	@GetMapping("/GetFilteredEnvs")
	public ModelAndView getEnvByCityAndATypes(@RequestParam(name = "citySearch") String city,
			@RequestParam(name = "animalTypes") String animalTypes) {
		System.out.println("City====> " + city);
		System.out.println("AnimalTypes====> " + animalTypes);
		List<FriendlyEnv> friendlyEnvList = service.getEnvByCityAndATypes(city, animalTypes);
		System.out.println("Search Length===> " + friendlyEnvList.size());
		ModelAndView mv = new ModelAndView("AllEnvs");
		mv.addObject("allEnvs", friendlyEnvList);
		return mv;
	}

	@GetMapping("/AddNewFriendlyEnv")
	public ModelAndView addNewFriendlyEnvG(Model model) {
		System.out.println("User Role===> " + model.getAttribute("userRole"));
		if (model.getAttribute("userRole").equals("admin")) {
			ModelAndView mv = new ModelAndView("addNewFriendlyEnv");
			FriendlyEnv friendlyEnv = new FriendlyEnv();
			mv.addObject("friendlyEnv", friendlyEnv);
			return mv;
		}
		return getAllFriendlyEnv();
	}

	@PostMapping("/AddNewFriendlyEnv")
	public String addNewFriendlyEnvP(@ModelAttribute("friendlyEnv") FriendlyEnv friendlyEnv, BindingResult result,
			Model model, RedirectAttributes redirectAttributes) {

		System.out.println("User Role===> " + model.getAttribute("userRole"));
		if (model.getAttribute("userRole").equals("admin")) {
			String imageOriginalFilename = friendlyEnv.getFriendlyEnvImage().getOriginalFilename();
			friendlyEnv.setFileName(imageOriginalFilename);

			byte[] coverImage = null;
			try {
				coverImage = friendlyEnv.getFriendlyEnvImage().getBytes();
			} catch (IOException e) {
				e.printStackTrace();
			}
			friendlyEnv.setImage(coverImage);

			service.save(friendlyEnv);

			// TODO need add the feature
			redirectAttributes.addFlashAttribute("SUCCESS", "新增成功!!!");

			return "redirect:/GetAllEnvs";
		}

		return "redirect:/GetAllEnvs";

//		BookValidator  validator = new BookValidator();
//		validator.validate(bean, result);
//		if (result.hasErrors()) {
//			SystemUtils2018.showErrors(result);
//			return "_20_productMaintain/BookInsert";
//		}

	}

	@PostMapping("/GetOrUpdateOneEnv")
	public String updateFriendlyEnvP(@RequestParam String envId,
			@ModelAttribute("friendlyEnvU") FriendlyEnv friendlyEnv, BindingResult result, Model model,
			RedirectAttributes redirectAttributes) {
		System.out.println("ID====> " + envId);
		System.out.println("FriendlyEnv IMAGE====> " + friendlyEnv.getFriendlyEnvImage().isEmpty());
		System.out
				.println("FriendlyEnv  original name====> " + friendlyEnv.getFriendlyEnvImage().getOriginalFilename());
		
		if (model.getAttribute("userRole").equals("admin")) {
			friendlyEnv.setAnimalTypes(String.join(",", friendlyEnv.getAnimalTypesArr()));
			if (!friendlyEnv.getFriendlyEnvImage().getOriginalFilename().isEmpty()) {
				String imageOriginalFilename = friendlyEnv.getFriendlyEnvImage().getOriginalFilename();
				friendlyEnv.setFileName(imageOriginalFilename);
				byte[] coverImage = null;
				try {
					coverImage = friendlyEnv.getFriendlyEnvImage().getBytes();
				} catch (IOException e) {
					e.printStackTrace();
				}
				friendlyEnv.setImage(coverImage);
			} else {
				friendlyEnv.setImage(service.get(Integer.valueOf(envId)).getImage());
				friendlyEnv.setFileName(service.get(Integer.valueOf(envId)).getFileName());
			}

			service.save(friendlyEnv);

			// TODO need add the feature
			redirectAttributes.addFlashAttribute("SUCCESS", "新增成功!!!");
		}

		return "redirect:/GetAllEnvs";

//		BookValidator  validator = new BookValidator();
//		validator.validate(bean, result);
//		if (result.hasErrors()) {
//			SystemUtils2018.showErrors(result);
//			return "_20_productMaintain/BookInsert";
//		}

	}

	@DeleteMapping("/DeleteFriendlyEnv/{id}")
//	@PostMapping("/DeleteFriendlyEnv/{id}")
	public String deleteFriendEnv(@PathVariable("id") Integer envId, RedirectAttributes redirectAttributes, Model model) {
		System.out.println("ID====> " + envId);
		if (model.getAttribute("userRole").equals("admin")) {
			service.delete(Integer.valueOf(envId));
			redirectAttributes.addFlashAttribute("SUCCESS", "刪除成功!!!");
		}
		return "redirect:/GetAllEnvs";
	}

	public InputStream getDefaultPhoto() {
		String fileName = "NoImage.jpg";
		InputStream is = servletContext.getResourceAsStream("/images/" + fileName);
		System.out.println("REALPATH====> "+ servletContext.getRealPath(fileName));
		return is;
	}

	@ModelAttribute()
	public void getDistincCities(Model model) {
		model.addAttribute("citylist", service.getCityList());
	}

}
