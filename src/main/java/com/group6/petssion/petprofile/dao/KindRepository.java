package com.group6.petssion.petprofile.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.petprofile.model.Kind;

public interface KindRepository extends JpaRepository<Kind, Integer>{

}
