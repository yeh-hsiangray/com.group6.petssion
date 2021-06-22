package com.group6.petssion.friendlyEnvProfile.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.group6.petssion.bean.FriendlyEnv;

public interface FriendlyEnvRepository extends JpaRepository<FriendlyEnv, Integer> {

	@Query("From FriendlyEnv where city = ?1 and animalTypes like %?2%")
	List<FriendlyEnv> findByCityAndAnimalTypes(String city, String animalTypes);

	@Query("Select distinct city from FriendlyEnv")
	List<String> getCityList();

}
