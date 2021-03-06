package com.group6.petssion.signIn.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public int signIn(@RequestBody account_password aAndP,HttpSession session,HttpServletResponse response) {
		Users user = signInService.signIn(aAndP.getAccount(), aAndP.getPassword());
		if(user!=null) {
			if(user.getBlockade()!=1) {
				if(user.getCheckemail()==0) {return 3;}
				if(aAndP.getRemember()) {
				int date = 60 * 60 * 24 * 7;
				Cookie cookie = new Cookie("youSession", session.getId());
				cookie.setMaxAge(date);
				response.addCookie(cookie);
				session.setMaxInactiveInterval(date);}
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
	@GetMapping("/forgotPassword")
	public String forgotPassword(Model model) {
		return "/forgotPassword";
	}
	@PostMapping("/forgotPassword")
	@ResponseBody
	public int postForgotPassword(@RequestBody account_password aAndP) {
		return signInService.forgotPassword(aAndP);
	}
	@GetMapping("/check")
	public String emailCheck(Users user, Model model) {
		account_password aAndP = signInService.checkEmail(user);
		if(aAndP ==null) {
			model.addAttribute("message", "???????????????????????????????????? 3??????????????????");
			return "checkResult";
		}else {
			model.addAttribute("account", aAndP.getAccount());
			return "/forgotPassword";			
		}
	}
	@PostMapping("/password")
	public String password(account_password aAndP) {
		signInService.updatePassword(aAndP);
		return "redirect:/";
	}
	@GetMapping("/noManager")
	public String naManager(Model model) {
		model.addAttribute("message", "??????????????? 3??????????????????");
		return "checkResult";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userManager");
		session.removeAttribute("userName");
		
		return "redirect:/signIn";
	}
}
