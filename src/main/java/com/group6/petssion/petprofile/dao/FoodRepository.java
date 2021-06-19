package com.group6.petssion.petprofile.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.petprofile.model.Food;

public interface FoodRepository extends JpaRepository<Food, Integer> {
	
}
