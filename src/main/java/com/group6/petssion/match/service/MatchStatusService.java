package com.group6.petssion.match.service;

import java.util.List;
import java.util.Optional;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.UsersImg;

public interface MatchStatusService {
	

	Optional<Hobby> getUsersById(int id);


	List<Hobby> getHobby();
	
	
	List<Hobby> getUsers() ;
	
	
	MatchStatus save(MatchStatus status);
		
	
	List<Users> getUsersImg();
	
	List<Users> getUserB();
	
}
