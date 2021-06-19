package com.group6.petssion.member.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.member.repository.UserRepository;
import com.infotran.springboot.bean.Users;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	
	public List<Users> findByUserId(int userId) {
		return userRepository.findByUserId(userId);
	}
	
	@Transactional
	public int updateById(int id) {
		return userRepository.updateById(id);
	}
	
	public Optional<Users> findOne(int userId) {
		return userRepository.findById(userId);
	}
}
