package com.group6.petssion.petprofile.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.petprofile.dao.PersonalityRepository;
import com.group6.petssion.petprofile.model.Personality;
import com.group6.petssion.petprofile.service.PersonalityService;
@Service
@Transactional
public class PersonalityServiceImpl implements PersonalityService{
	@Autowired
	PersonalityRepository personalityDao;
	
	@Override
	public List<Personality> getAllPersonality() {
		return (List<Personality>)personalityDao.findAll();
	}

	@Override
	public Personality getPersonality(Integer id) {
		Optional<Personality> optional = personalityDao.findById(id);
		Personality personality=null;
		if(optional.isPresent()) {
			personality=optional.get();
		}else {
			throw new RuntimeException("Personality(id=" + id + ")不存在");
		}
		return personality;
	}

	@Override
	public void save(Personality personality) {
		personalityDao.save(personality);
	}

}
