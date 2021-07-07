package com.group6.petssion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.Users;

public interface UsersRepository extends JpaRepository<Users, Integer> {

	Users findByname(String name);
	
	/*
	 * 模糊搜尋名子
	 */
	List<Users> findByNameContains(String name);
	
	Users findByNameAndEmail(Users user);
	
}
