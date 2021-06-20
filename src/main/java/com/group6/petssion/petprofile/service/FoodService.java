package com.group6.petssion.petprofile.service;

import java.util.List;

import com.group6.petssion.bean.Food;

public interface FoodService {
	public List<Food> getAllFood();
	public Food getFood(Integer id);
	void save(Food food);
}
