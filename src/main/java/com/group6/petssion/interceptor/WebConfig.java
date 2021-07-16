package com.group6.petssion.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/backend/**")
		.addPathPatterns("/pet/**")
		.addPathPatterns("/match/**")
		.addPathPatterns("/user/**").addPathPatterns("/FriendlyEnvSearch");
		registry.addInterceptor(new ManagerInterceptor())
		.addPathPatterns("/backend/**")
		.addPathPatterns("/pet/showAll")
		.addPathPatterns("/FriendlyEnvSearch");
	}
}
