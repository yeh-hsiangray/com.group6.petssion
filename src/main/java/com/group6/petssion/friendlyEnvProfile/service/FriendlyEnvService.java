package com.group6.petssion.friendlyEnvProfile.service;

import java.util.List;

import com.group6.petssion.bean.FriendlyEnv;


public interface FriendlyEnvService {
	FriendlyEnv save(FriendlyEnv friendlyEnv);
	void delete(Integer id);
	FriendlyEnv get(Integer id);
	void update(FriendlyEnv friendlyEnv);
	List<FriendlyEnv> getAllFriendlyEnvs();
	List<FriendlyEnv> getEnvByCityAndATypes(String city, String animalTypes);
	List<String> getCityList();
}
