package com.group6.petssion.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.account_password;

public interface AAndPRepository extends JpaRepository<account_password, Integer>{

	account_password findByAccountAndPassword(String account,String password);
	
	account_password findByAccount(String account);
	
	Page<account_password> findAll(Pageable pageable);
	
	
}
