package com.group6.petssion.petprofile.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.Food;
import com.group6.petssion.bean.Kind;
import com.group6.petssion.bean.Personality;
import com.group6.petssion.bean.Pet;
import com.group6.petssion.bean.Type;
import com.group6.petssion.petprofile.dao.impl.PetDaoImpl;
import com.group6.petssion.petprofile.service.FoodService;
import com.group6.petssion.petprofile.service.KindService;
import com.group6.petssion.petprofile.service.PersonalityService;
import com.group6.petssion.petprofile.service.PetService;
import com.group6.petssion.petprofile.service.TypeService;
import com.group6.petssion.repository.PetRepository;

@Service
@Transactional
public class PetServiceImpl implements PetService {

	@Autowired
	PetRepository petDao;

	@Autowired
	PetDaoImpl petDao2;
	@Autowired
	FoodService foodService;
	@Autowired
	TypeService typeService;
	@Autowired
	KindService kindService;
	@Autowired
	PersonalityService personalityService;

	@Override
	public Pet savePet(Pet pet) {
		Type type = typeService.getType(pet.getType().getId());
		pet.setType(type);

		Kind kind = kindService.getKind(pet.getKind().getId());
		pet.setKind(kind);

		Food food = foodService.getFood(pet.getFood().getId());
		pet.setFood(food);

		Personality personality = personalityService.getPersonality(pet.getPersonality().getId());
		pet.setPersonality(personality);
		
		return petDao.save(pet);
	}

	@Transactional
	@Override
	public void updatePet(Pet pet) {
		petDao2.updatePet(pet);
	}

	@Override
	public Pet get(Integer id) {
		Optional<Pet> optional = petDao.findById(id);
		Pet pet = null;
		if (optional.isPresent()) {
			pet = optional.get();
		} else {
			throw new RuntimeException("Pet(id=" + id + ")不存在");
		}
		return pet;
	}

	@Override
	public void deletePet(Integer id) {
		petDao.deleteById(id);
	}

	@Override
	public List<Pet> findAllPet() {
		return petDao.findAll();
	}

	@Override
	public boolean isUsersExist(Pet pet) {
		return petDao2.isUsersExist(pet);
	}

	@Override
	public List<Pet> findAllPetByUserId(int userId) {
		return petDao2.findAllPetByUserId(userId);
	}

	@Override
	public List<Pet> getAllPetNameByUserId(int userId) {
		return petDao2.getAllPetNameByUserId(userId);
	}



}
