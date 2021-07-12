package com.group6.petssion.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group6.petssion.bean.account_password;

public interface AAndPRepository extends JpaRepository<account_password, Integer>{

	account_password findByAccountAndPassword(String account,String password);
	
	account_password findByAccount(String account);
	
	Page<account_password> findAll(Pageable pageable);
	@Query(value="select  a.id,a.account,name,Blockade,gender,email,manager,regdate from [dbo].[account_password] a join [dbo].[Users] b on a.fk_users_id=b.id and b.name like '%王%'", 
				countQuery ="select count( a.id,a.account,name,Blockade,gender,email,manager,regdate) from [dbo].[account_password] a join [dbo].[Users] b on a.fk_users_id=b.id and b.name like %王% " ,nativeQuery = true)
	Page<account_password> findTest(Pageable pageable);
	
}
