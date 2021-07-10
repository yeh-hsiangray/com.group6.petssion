package com.group6.petssion.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.MatchStatus;

public interface MatchStatusRepository extends JpaRepository<MatchStatus,Integer> {

	
	
	
//	 Optional<MatchStatus> findByUserB(Integer UserBid);

	 List<MatchStatus> findByUserB(Integer UserBId);
	 
	 List<MatchStatus> findByUserA(Integer UserAId);
	 
//	 MatchStatus findByUserA(Integer UserAId);
	 
	 
	 MatchStatus findByUserAAndUserB(Integer UserAId,Integer UserBId);

	 List<MatchStatus> findByStatus(Integer status);

}
