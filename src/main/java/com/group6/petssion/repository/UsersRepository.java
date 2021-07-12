package com.group6.petssion.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.Users;

public interface UsersRepository extends JpaRepository<Users, Integer> {

	Users findByname(String name);
	
	/*
	 * 模糊搜尋名子
	 */
	List<Users> findByNameContains(String name);
	
	Users findByNameAndEmail(String name,String email);
	
	Users findByEmail(String email);
	
	Users findByGarbledAndEmail(String garbled,String email);
	
	Page<Users> findAll(Pageable pageable);

}
