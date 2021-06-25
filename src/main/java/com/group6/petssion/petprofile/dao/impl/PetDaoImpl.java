package com.group6.petssion.petprofile.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group6.petssion.bean.Pet;

@Repository
public class PetDaoImpl {

	@Autowired
	EntityManager entityManager;

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
	@SuppressWarnings("unchecked")
//	@Override
	public List<Pet> findAllPetByUserId(int userId) {
		String hql = "from Pet p where p.user.id=:id";
		List<Pet> list = new ArrayList<>();
		try {
			list = (List<Pet>) entityManager.createQuery(hql).setParameter("id", userId).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}

//
//
//	@Override
	public boolean isUsersExist(Pet pet) {
		boolean exist = false;
		String hql = "from Pet p where p.user.id=:id";
		try {
			entityManager.createQuery(hql).setParameter("id", pet.getUserId()).getSingleResult();
			exist = true;
		} catch (NoResultException e) {
			;
		}
		return exist;
	}

	@SuppressWarnings("unchecked")
	public List<Pet> getAllPetNameByUserId(int userId) {
		String hql = "select p.name from Pet p where p.user.id=:id";
		List<Pet> list = new ArrayList<>();
		try {
			list = (List<Pet>) entityManager.createQuery(hql).setParameter("id", userId).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
}
