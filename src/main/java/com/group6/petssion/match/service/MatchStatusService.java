package com.group6.petssion.match.service;

import java.util.List;
import java.util.Optional;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;

public interface MatchStatusService {

	Optional<Hobby> getHobbyById(int id);
	
	
	List<Hobby> getHobby();
	
	//將配對狀態寫進資料庫
	MatchStatus save(MatchStatus matchStatus);
	
   
	
	
}
