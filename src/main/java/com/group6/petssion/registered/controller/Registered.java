package com.group6.petssion.registered.controller;

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
	public String postRegistered(account_password aAndP, Users user,Model model) {
		int status= rs.regisered(user, aAndP);
		model.addAttribute("message", status!=0?status==1?"帳號已被使用":"信箱已被使用 ":"註冊完成 請至信箱接收驗證信 3秒後跳轉首頁");
		return "checkResult";
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
	public String emailCheck(Users user, Model model,HttpSession session,HttpServletResponse response) {
		Users user2 = rs.checkEmail(user);
		if(user2!=null) {
		int date = 60 * 60 * 24 * 7;
		Cookie cookie = new Cookie("youSession", session.getId());
		cookie.setMaxAge(date);
		response.addCookie(cookie);
		session.setMaxInactiveInterval(date);
		session.setAttribute("userId", user2.getId());
		session.setAttribute("userManager", user2.getManager());
		session.setAttribute("userName", user2.getName());
		model.addAttribute("checkOk","1");}
		model.addAttribute("message", user2==null?"驗證未成功請聯絡管理人員 3秒後返回首頁":"驗證成功3秒跳轉至下一步");
		return "checkResult";
	}

}
