package com.group6.petssion.friendlyEnvProfile.dao.impl;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group6.petssion.bean.FriendlyEnv;

@Repository
public class FriendlyEnvDaoImpl {
	@Autowired
	EntityManager entityManager;

	public void updateFriendlyEnv(FriendlyEnv friendlyEnv) {
		entityManager.clear();
		entityManager.merge(friendlyEnv);
	}
}
