package com.group6.petssion.petprofile.service;

import java.util.List;

import com.group6.petssion.bean.Personality;

public interface PersonalityService {
	public List<Personality> getAllPersonality();
	public Personality getPersonality(Integer id);
	void save(Personality personality);
}
