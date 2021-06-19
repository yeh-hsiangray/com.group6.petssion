package com.group6.petssion.member.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.infotran.springboot.bean.Users;

public interface UserRepository extends JpaRepository<Users,Integer>{

	List<Users> findByUserId(int userId);
	
	@Modifying
	@Query("update USERS b where id = ?1")
	int updateById(int id);
}

