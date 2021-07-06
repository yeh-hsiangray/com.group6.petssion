package com.group6.petssion.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Users;

public interface MatchStatusRepository extends JpaRepository<MatchStatus,Integer> {

	
	
	
	 Optional<MatchStatus> findByUserB(Integer id);

	

}
