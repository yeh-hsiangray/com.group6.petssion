package com.group6.petssion.petprofile.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.petprofile.model.Pet;

public interface PetRepository extends JpaRepository<Pet, Integer>{

}
