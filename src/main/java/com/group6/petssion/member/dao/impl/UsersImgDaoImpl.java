package com.group6.petssion.member.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.group6.petssion.bean.UsersImg;

@Repository
public class UsersImgDaoImpl {

	@PersistenceContext
	EntityManager entityManager;

	public void updateUsersImg(UsersImg usersImg) {
		entityManager.clear();
		entityManager.merge(usersImg);
	}
	
	@SuppressWarnings("unchecked")
	public List<Integer> findUserImgByUserId(int userId) {
		String hql = "select u.id from UsersImg u where u.users.id=:id";
		List<Integer> list = new ArrayList<>();
		try {
			list = (List<Integer>) entityManager.createQuery(hql).setParameter("id", userId).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
}
