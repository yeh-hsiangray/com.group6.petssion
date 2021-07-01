package com.group6.petssion.petprofile.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
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
	
	@SuppressWarnings("unchecked")
	public List<String> findPetImgIdByPetId(int petId) {
		String hql = "select p.id from PetImg p where p.pet.id=:id";
		List<String> list = new ArrayList<>();
		try {
			list = (List<String>) entityManager.createQuery(hql).setParameter("id", petId).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
	
//	@SuppressWarnings("unchecked")
//	public List<PetImg> findPetImgByPetId(int petId) {
//		String hql = "from PetImg p where p.pet.id=:id";
//		List<PetImg> list = new ArrayList<>();
//		try {
//			list = (List<PetImg>) entityManager.createQuery(hql).setParameter("id", petId).getResultList();
//			System.out.println(hql);
//		} catch (NoResultException e) {
//			;
//		}
//		return list;
//	}
	
}
