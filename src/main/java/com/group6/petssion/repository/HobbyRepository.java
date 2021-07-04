package com.group6.petssion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.Hobby;

public interface HobbyRepository extends JpaRepository<Hobby, Integer> {

	void save(List<Hobby> hobby);

	

	
	
	
}