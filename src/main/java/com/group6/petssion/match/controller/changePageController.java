package com.group6.petssion.match.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/match")
public class changePageController {

	
	@GetMapping("/showMatch")
	public String Match() {
		return "match/showMatch";
	}

	@GetMapping("/_02_login")
	public String login() {
		return "_02_login/loginForm";
	}

	
	
}
