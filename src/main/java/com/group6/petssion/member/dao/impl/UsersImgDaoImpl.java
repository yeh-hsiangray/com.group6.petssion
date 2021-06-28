package com.group6.petssion.member.dao.impl;

import javax.persistence.EntityManager;
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
}
