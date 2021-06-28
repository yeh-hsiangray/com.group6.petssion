package com.group6.petssion.member.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.member.service.HobbyService;
import com.group6.petssion.repository.HobbyRepository;

@Service
@Transactional
public class HobbyServiceImpl implements HobbyService{

	@Autowired
	HobbyRepository hobbyRepository;
	
	@Override
	public List<Hobby> getAllHobby() {
		return (List<Hobby>)hobbyRepository.findAll();
	}
	
	@Override
	public Hobby getHobby(Integer id) {
		Optional<Hobby> optional = hobbyRepository.findById(id);
		Hobby hobby = null;
		if (optional.isPresent()) {
			hobby = optional.get();
		} else {
			throw new RuntimeException("Hobby(id=" + id + ")不存在");
		}
		return hobby;
	}

	@Override
	public void save(Hobby hobby) {
		hobbyRepository.save(hobby);
	}
}
