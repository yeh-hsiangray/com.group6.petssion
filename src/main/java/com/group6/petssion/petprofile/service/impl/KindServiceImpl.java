package com.group6.petssion.petprofile.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.petprofile.dao.KindRepository;
import com.group6.petssion.petprofile.model.Kind;
import com.group6.petssion.petprofile.service.KindService;

@Service
@Transactional
public class KindServiceImpl implements KindService{
	
	@Autowired
	KindRepository kindDao;
	
	@Override
	public List<Kind> getAllKind() {
		return (List<Kind>)kindDao.findAll();
	}

	@Override
	public Kind getKind(Integer id) {
		Optional<Kind> optional = kindDao.findById(id);
		Kind kind = null;
		if (optional.isPresent()) {
			kind = optional.get();
		} else {
			throw new RuntimeException("Kind(id=" + id + ")不存在");
		}
		return kind;
	}

	@Override
	public void save(Kind kind) {
		kindDao.save(kind);
	}

}
