package com.group6.petssion.match.service;

import java.util.List;
import java.util.Optional;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Users;

public interface MatchStatusService {
	

	List<Users> getUsersByHobbyId(Integer id);


	List<Hobby> getHobby();
	
	
	MatchStatus save(MatchStatus matchstatus);     
     
   
	List<Users> getlikeNotify(Integer id);
		
//	Integer getlikeNotifyStatusId(Integer userBid);
	
	List<Users> oneSideLove(Integer UserAid);
	
	 void saveReplyStatus(MatchStatus matchStatus) ;
	 
	 List<Users> eachLike(Integer UserAid);
	
	
}
