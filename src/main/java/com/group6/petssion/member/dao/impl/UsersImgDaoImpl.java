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
	public List<UsersImg> findUserImgByUserId(int userId) {
		String hql = "from UsersImg p where p.users.id=:id";
		List<UsersImg> list = new ArrayList<>();
		try {
			list = (List<UsersImg>) entityManager.createQuery(hql).setParameter("id", userId).getResultList();
			System.out.println(hql);
		} catch (NoResultException e) {
			;
		}
		return list;
	}
}
