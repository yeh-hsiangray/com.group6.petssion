package com.group6.petssion.match.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.match.service.MatchStatusService;
import com.group6.petssion.repository.HobbyRepository;
import com.group6.petssion.repository.MatchStatusRepository;
import com.group6.petssion.repository.UsersRepository;

@Service
public class MatchStatusServiceImpl implements MatchStatusService {

	@Autowired
	private UsersRepository usersRepository;

	@Autowired
	private HobbyRepository hobbyRepository;
	
	@Autowired
	private MatchStatusRepository matchStatusRepository;

	@Override
	public Optional<Hobby> getHobbyById(int id) {
		return hobbyRepository.findById(id);
	}

	@Override
	public List<Hobby> getHobby() {
		return hobbyRepository.findAll();
	}

	@Override
	public MatchStatus save(MatchStatus matchStatus) {
		return matchStatusRepository.save(matchStatus);
	}

	

	
	
	
	
	
	
}
