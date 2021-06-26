package com.group6.petssion.petprofile.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.group6.petssion.bean.PetImg;
@Repository
public class PetImgDaoImpl {
	
	@PersistenceContext
	EntityManager entityManager;

	public void updatePetImg(PetImg petImg) {
		entityManager.clear();
		entityManager.merge(petImg);
	}
	

}
