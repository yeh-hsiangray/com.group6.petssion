package com.group6.petssion.petprofile.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group6.petssion.petprofile.model.Pet;
@Repository 
public class PetDaoImpl{

	@Autowired
	EntityManager  entityManager;
	
	public void updatePet(Pet pet) {
		entityManager.clear();
		entityManager.merge(pet);
	}

//	@Override
//	public boolean isPetExist(Pet pet) {
//		boolean exist=false;
//		String hql="From Pet p WHERE p.id=:id";
//		try {
//			entityManager.createQuery(hql).setParameter("id", pet.getId()).getSingleResult();
//		exist=true;
//		} catch (NoResultException e) {
//			;
//		}
//		return exist;
//	}
//
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<Pet> findAllPetByUserId(int userId) {
//		String hql="FROM Pet p WHERE p.fk_user_id.id=:id";
//		List<Pet> list=new ArrayList<>();
//		try {
//			list = (List<Pet>) entityManager.createQuery(hql)
//					.setParameter("id", userId)
//					.getResultList();
//		} catch (NoResultException e) {
//			;
//		}
//		return list;
//	}
//
//
//	@Override
	public boolean isUsersExist(Pet pet) {
		boolean exist=false;
		String hql="FROM Pet p WHERE p.fk_user_id.id=:id";
		try {
			entityManager.createQuery(hql).setParameter("id", pet.getUserId()).getSingleResult();
		exist=true;
		} catch (NoResultException e) {
			;
		}
		return exist;
	}


}
