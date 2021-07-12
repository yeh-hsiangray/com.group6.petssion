package com.group6.petssion;

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
	
	@GetMapping("match/Notify")
	public String Notify() {
		return "match/Notify";
	}
	@GetMapping("match/NewFile")
	public String NewFile() {
		return "match/NewFile";
	}
	
	
}
