package com.group6.petssion.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.group6.petssion.member.service.UserService;
import com.infotran.springboot.bean.Users;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;	
	
	@GetMapping("/Members/{userId}")
	public String detail(@PathVariable int userId, Model model) {
		
		List<Users> user = userService.findByUserId(userId);
		model.addAttribute("Member", user);
		return "Member";
	}
}
