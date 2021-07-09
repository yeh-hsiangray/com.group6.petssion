package com.group6.petssion.registered.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.account_password;
import com.group6.petssion.mail.Mail;
import com.group6.petssion.registered.service.RegisteredService;

@Controller
@RequestMapping("/registered")
public class Registered {
	@Autowired
	private RegisteredService rs;
	@Autowired
	private Mail mail;

	@GetMapping
	public String getRegistered() {
		return "registered";
	}

	@PostMapping
	public String postRegistered(account_password aAndP, Users user) {
		rs.regisered(user, aAndP);
		return "index";
	}

	@PostMapping("/act")
	@ResponseBody
	public int selectAct(@RequestBody account_password aAndP) {
		return rs.selectAct(aAndP);
	}

	@PostMapping("/email")
	@ResponseBody
	public int selectEmail(@RequestBody Users user) {
		return rs.selectEmail(user);
	}

	@GetMapping("/check")
	public String emailCheck(Users user, Model model) {
		int status = rs.checkEmail(user);
		if(status==0) {
			model.addAttribute("message", "驗證未成功請聯絡管理人員 10秒後返回首頁");
		}else {
			model.addAttribute("message", "驗證成功10秒後回到首頁");			
		}
		return "checkResult";
	}

}
