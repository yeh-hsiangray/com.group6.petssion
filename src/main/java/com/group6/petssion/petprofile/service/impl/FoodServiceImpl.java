package com.group6.petssion.petprofile.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.petprofile.dao.FoodRepository;
import com.group6.petssion.petprofile.model.Food;
import com.group6.petssion.petprofile.service.FoodService;

@Service
@Transactional
public class FoodServiceImpl implements FoodService {
	@Autowired
	FoodRepository foodDao;

	@Override
	public List<Food> getAllFood() {
		return (List<Food>)foodDao.findAll();
	}

	@Override
	public Food getFood(Integer id) {
		Optional<Food> optional = foodDao.findById(id);
		Food food = null;
		if (optional.isPresent()) {
			food = optional.get();
		} else {
			throw new RuntimeException("Food(id=" + id + ")不存在");
		}
		return food;
	}

	@Override
	public void save(Food food) {
		foodDao.save(food);
	}
}
