package com.group6.petssion.petprofile.service;

import java.util.List;

import com.group6.petssion.bean.Kind;

public interface KindService {
	public List<Kind> getAllKind();
	public Kind getKind(Integer id);
	void save(Kind kind);
}
