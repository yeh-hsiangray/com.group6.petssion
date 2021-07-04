package com.group6.petssion.match.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;

public interface MatchStatusService {
	

	Optional<Hobby> getUsersById(Integer id);


	List<Hobby> getHobby();
	
	
	MatchStatus save(MatchStatus matchstatus);
     
     
     
	
	List<Hobby> getUsers() ;
	
	
		
	
	
	
	
	
}
