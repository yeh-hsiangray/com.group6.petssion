package com.group6.petssion.backstage.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.group6.petssion.bean.account_password;
import com.group6.petssion.repository.AAndPRepository;
import com.group6.petssion.repository.UsersRepository;

@RestController
@RequestMapping("/test")
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
	public Map<String, Object> findAll(){
		Pageable pageable= PageRequest.of(0, 5, Sort.by(Sort.Direction.ASC,"id"));
		Map<String,Object> pageMap=new HashMap<String, Object>();
		
//		pageMap.put("user",user.findAll(pageable));
		pageMap.put("Account", aAndP.findAll(pageable));
		return pageMap;
		}
	
	@GetMapping("/1")
	public Page<account_password> findTest(){
		Pageable pageable= PageRequest.of(0, 5, Sort.by(Sort.Direction.ASC,"id"));

		
		return aAndP.findTest(pageable);
		}
}
