package com.group6.petssion.member.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.Job;
import com.group6.petssion.member.service.JobService;
import com.group6.petssion.repository.JobRepository;

@Service
@Transactional
public class JobServiceImpl implements JobService{
	
	@Autowired
	JobRepository jobRepository;
	
	@Override
	public List<Job> getAllJob() {
		return (List<Job>)jobRepository.findAll();
	}
	
	@Override
	public Job getJob(Integer id) {
		Optional<Job> optional = jobRepository.findById(id);
		Job job = null;
		if (optional.isPresent()) {
			job = optional.get();
		} else {
			throw new RuntimeException("Job(id=" + id + ")不存在");
		}
		return job;
	}
	
	@Override
	public void save(Job job) {
		jobRepository.save(job);
	}
}
