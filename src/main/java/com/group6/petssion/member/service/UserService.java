package com.group6.petssion.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.Users;
import com.group6.petssion.repository.UsersRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	private UsersRepository usersRepository;
	
	public List<Users> listUserAll() {
		return usersRepository.findAll();
	}
	
	public void saveUser(Users users) {
		usersRepository.save(users);
	}
	
	public Users findUserById(Integer id) {
		return usersRepository.findById(id).get();
	}

	public Users findByname(String name) {
		return usersRepository.findByname(name);
	}
	
	public void deleteById(Integer id) {
		usersRepository.deleteById(id);
	}
	
}
