package com.group6.petssion.registered.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.account_password;
import com.group6.petssion.registered.service.RegisteredService;

@Controller
@RequestMapping("/registered")
public class Registered {
	@Autowired
	private RegisteredService rs;

	@GetMapping
	public String getRegistered() {
		return "registered";
	}

	@PostMapping
	public String postRegistered(account_password aAndP,Users user) {

		rs.regisered(user,aAndP);
		return "index";
	}
}
