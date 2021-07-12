package com.group6.petssion.main.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/backend/main")
public class MainBackController {

	//-----------------------------------Direct------------------------------------
	@RequestMapping(value = "/contact", method = { RequestMethod.GET })
	public String directPage1() {
		return "/backend/main/contact";
	}

	@RequestMapping(value = "/index", method = { RequestMethod.GET })
	public String directPage2() {
		return "/backend/main/index";
	}

	@RequestMapping(value = "/support")
	public String directPage3() {
		return "/backend/main/support";
	}
}