package com.group6.petssion.signIn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.account_password;
import com.group6.petssion.repository.AAndPRepository;

@Service
public class SignInService {
	@Autowired
	AAndPRepository aAndPRepository;

	public Users signIn(String account, String password) {
		account_password aAndP = aAndPRepository.findByAccountAndPassword(account, password);
		if (aAndP == null) {
			return null;
		} else {
			return aAndP.getUsers();
		}
	}
}
