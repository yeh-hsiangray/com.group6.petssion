package com.group6.petssion.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.account_password;

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
	
	@Query(value="select  * from [dbo].[Users] b where  b.name like %?1%", nativeQuery = true)
	Page<Users> findTest(String name,Pageable pageable);

}
