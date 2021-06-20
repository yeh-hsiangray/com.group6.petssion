package com.group6.petssion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.Personality;

public interface PersonalityRepository extends JpaRepository<Personality, Integer>{
}
