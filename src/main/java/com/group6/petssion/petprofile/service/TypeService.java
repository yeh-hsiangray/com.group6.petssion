package com.group6.petssion.petprofile.service;

import java.util.List;

import com.group6.petssion.petprofile.model.Type;

public interface TypeService {
	public List<Type> getAllType();
	public Type getType(Integer id);
	void save(Type type);
}
