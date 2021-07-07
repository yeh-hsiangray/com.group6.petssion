package com.group6.petssion.registered.service;

import java.time.LocalDate;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.account_password;
import com.group6.petssion.repository.AAndPRepository;
import com.group6.petssion.repository.UsersRepository;

@Service
@Transactional
public class RegisteredService {
	@Autowired
	private UsersRepository ur;
	@Autowired
	private AAndPRepository aAndPR;
	
	public void regisered(Users users,account_password aAndP) {
		users.setManager(0);
		users.setRegdate(LocalDate.now());
		users.setBlockade(0);
		ur.save(users);
		users=ur.findByNameAndEmail(users);
		aAndP.setUsers(users);
		aAndPR.save(aAndP);
	}
}
