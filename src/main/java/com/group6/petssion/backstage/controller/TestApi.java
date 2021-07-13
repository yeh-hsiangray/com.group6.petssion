package com.group6.petssion.backstage.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group6.petssion.bean.Users;
import com.group6.petssion.repository.AAndPRepository;
import com.group6.petssion.repository.UsersRepository;

@Controller
@RequestMapping("/BasckSelect")
public class TestApi {

	@Autowired
	UsersRepository user;
	@Autowired
	AAndPRepository aAndP;
//	
//	@GetMapping
//	public List<Users> selectName(@RequestParam String name){
//		return user.findByNameContains(name);
//	}
	@GetMapping
	public String index(){

		return "backend/BasckSelect";
		}
	
	@PostMapping("/1")
	@ResponseBody
	public Page<Users> findTest(@RequestBody Map<String, Object> map){
		
		Pageable pageable= PageRequest.of(Integer.valueOf(map.get("index").toString()) , 5, Sort.by(Sort.Direction.ASC,"id"));

		return user.findTest((String) map.get("name"),pageable);
		}
}
