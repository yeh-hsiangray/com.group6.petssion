package com.group6.petssion.signIn.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group6.petssion.bean.Users;
import com.group6.petssion.signIn.service.SignInService;

@Controller
@RequestMapping("/signIn")
public class signInController {

	@Autowired
	SignInService signInService;
	@GetMapping
	public String sign(Model model) {
		return "/signIn";
	}

	@PostMapping
	@ResponseBody
	public int signIn(@RequestParam String account, @RequestParam String password,HttpSession session,HttpServletResponse response) {
		Users user = signInService.signIn(account, password);
		if(user!=null) {
			if(user.getBlockade()!=1) {
				int date = 60 * 60 * 24 * 7;
				Cookie cookie = new Cookie("youSession", session.getId());
				cookie.setMaxAge(date);
				response.addCookie(cookie);
				session.setMaxInactiveInterval(date);
				session.setAttribute("userId", user.getId());
				session.setAttribute("userManager", user.getManager());
				session.setAttribute("userName", user.getName());
				return 1;
			}else {
				return 2;
			}
		}
		return 0;
	}
}
