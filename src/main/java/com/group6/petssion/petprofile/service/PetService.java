package com.group6.petssion.petprofile.service;

import java.util.List;

import com.group6.petssion.bean.Pet;

public interface PetService {
//	Pet findById(int id);
	
//	List<Pet> findAllPetByUserId(int userId);

	Pet savePet(Pet pet);

	void updatePet(Pet pet);
	
	Pet get(Integer id);

	void deletePet(Integer id);

	List<Pet> findAllPet();

//	public boolean isPetExist(Pet pet);
//	
	public boolean isUsersExist(Pet pet);
}
