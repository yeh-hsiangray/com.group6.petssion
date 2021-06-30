package com.group6.petssion.match.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Users;
import com.group6.petssion.match.service.MatchStatusService;
import com.group6.petssion.repository.HobbyRepository;
import com.group6.petssion.repository.MatchStatusRepository;
import com.group6.petssion.repository.UsersRepository;

@Transactional
@Service
@EnableTransactionManagement
public class MatchStatusServiceImpl implements MatchStatusService {

	@Autowired
	private UsersRepository usersRepository;

	@Autowired
	private HobbyRepository hobbyRepository;

	@Autowired
	private MatchStatusRepository matchStatusRepository;

	
	
	
	@Override
	public Optional<Hobby> getUsersById(int hobbyId) {
		return hobbyRepository.findById(hobbyId);
	}



	@Override
	public List<Hobby> getHobby() {
		
		return hobbyRepository.findAll();
	}



	@Override
	public List<Hobby> getUsers() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public MatchStatus save(MatchStatus status) {		
		return matchStatusRepository.save(status);
	}



	@Override
	public List<Users> getUserB() {
		return null;
	}





}