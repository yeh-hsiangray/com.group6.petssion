package com.group6.petssion.member.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.group6.petssion.member.service.UserService;
import com.infotran.springboot.bean.Users;

@RestController
@RequestMapping("/User")
public class UserApp {

	private UserService userService;
	
	@PostMapping("/update")
	public int findBy(@RequestParam int id) {
		return userService.updateById(id);
	}
	
	@GetMapping("/Member/{userId}")
	public List<Users> findByUserId(@PathVariable int userId) {
		return userService.findByUserId(userId);
	}
}
