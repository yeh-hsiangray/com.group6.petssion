package com.group6.petssion.match.service;

import java.util.List;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Users;

public interface MatchStatusService {
	

	List<Users> getUsersByHobbyId(Integer id);


	List<Hobby> getHobby();
	
	
	MatchStatus save(MatchStatus matchstatus);
     
     
     
	
	List<Hobby> getUsers() ;
	
	
		
	
	
	
	
	
}
