package com.group6.petssion.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.MatchStatus;

public interface MatchStatusRepository extends JpaRepository<MatchStatus,Integer> {

	
	
	
	 Optional<MatchStatus> findByUserB(Integer UserBid);

	 List<MatchStatus> findByUserA(Integer UserAId);

}
