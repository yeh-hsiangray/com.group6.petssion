package com.group6.petssion.petprofile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {
	
	@GetMapping("/")
	public String index() {
		return "index";
	}


	@GetMapping("/members")
	public String Users() {
		return "members";
	}

}
