package com.group6.petssion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.Food;

public interface FoodRepository extends JpaRepository<Food, Integer> {
	
}
