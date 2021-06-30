package com.group6.petssion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.Users;

public interface UsersRepository extends JpaRepository<Users, Integer> {

	Users findByname(String name);

}
