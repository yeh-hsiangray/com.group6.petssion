package com.group6.petssion.petprofile.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.petprofile.dao.PetRepository;
import com.group6.petssion.petprofile.dao.impl.PetDaoImpl;
import com.group6.petssion.petprofile.model.Pet;
import com.group6.petssion.petprofile.service.PetService;

@Service
@Transactional
public class PetServiceImpl implements PetService {

	@Autowired
	PetRepository petDao;

	@Autowired
	PetDaoImpl petDao2;

	@Override
	public Pet savePet(Pet pet) {
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

}
