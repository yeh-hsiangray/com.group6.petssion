package com.group6.petssion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.Pet;

public interface PetRepository extends JpaRepository<Pet, Integer>{

}
