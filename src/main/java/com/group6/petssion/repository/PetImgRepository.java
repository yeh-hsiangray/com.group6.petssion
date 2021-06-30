package com.group6.petssion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.group6.petssion.bean.PetImg;

@Repository
public interface PetImgRepository extends JpaRepository<PetImg, Integer>{
	
}
