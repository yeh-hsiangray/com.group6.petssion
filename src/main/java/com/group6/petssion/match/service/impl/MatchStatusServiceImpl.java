package com.group6.petssion.match.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.petssion.match.service.MatchStatusService;
import com.group6.petssion.repository.HobbyRepository;
import com.group6.petssion.repository.MatchStatusRepository;
import com.group6.petssion.repository.UsersRepository;

@Transactional
@Service
public class MatchStatusServiceImpl implements MatchStatusService {

	@Autowired
	private UsersRepository usersRepository;

	@Autowired
	private HobbyRepository hobbyRepository;

	@Autowired
	private MatchStatusRepository matchStatusRepository;



}