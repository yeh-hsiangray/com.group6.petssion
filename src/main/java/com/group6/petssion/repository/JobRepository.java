package com.group6.petssion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.group6.petssion.bean.Job;

public interface JobRepository extends JpaRepository<Job, Integer> {

}
