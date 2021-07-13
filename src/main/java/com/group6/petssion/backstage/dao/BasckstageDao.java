package com.group6.petssion.backstage.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
@Repository
public class BasckstageDao {
	@PersistenceContext
	EntityManager entityManager;
	
	public void findByName(){
		
	}
}
