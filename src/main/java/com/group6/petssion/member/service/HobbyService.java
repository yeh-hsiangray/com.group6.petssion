package com.group6.petssion.member.service;

import java.util.List;

import com.group6.petssion.bean.Hobby;

public interface HobbyService {

	public List<Hobby> getAllHobby();
	public Hobby getHobby(Integer id);
	void save(Hobby hobby);
}
