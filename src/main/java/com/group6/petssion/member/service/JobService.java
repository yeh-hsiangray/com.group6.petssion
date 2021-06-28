package com.group6.petssion.member.service;

import java.util.List;

import com.group6.petssion.bean.Job;

public interface JobService {

	public List<Job> getAllJob();
	public Job getJob(Integer id);
	void save(Job job);
	
}
