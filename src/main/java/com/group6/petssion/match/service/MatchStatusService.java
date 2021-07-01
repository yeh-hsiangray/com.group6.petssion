package com.group6.petssion.match.service;

import java.util.List;
import java.util.Optional;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Users;

public interface MatchStatusService {
	

	Optional<Hobby> getUsersById(int hobbyId);


	List<Hobby> getHobby();
	
	
	List<Hobby> getUsers() ;
	
	
	MatchStatus save(MatchStatus status);
	
	
	
	List<Users> getUserB();
	
}
