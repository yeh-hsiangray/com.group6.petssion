package com.group6.petssion.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class ManagerInterceptor implements HandlerInterceptor{
 @Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	// TODO Auto-generated method stub
		 if((int) request.getSession().getAttribute("userManager")<3) {
			response.sendRedirect("/petssion/signIn/noManager");
			 return false;
		 }
	return HandlerInterceptor.super.preHandle(request, response, handler);
}
}
