package com.group6.petssion.petprofile.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.Type;
import com.group6.petssion.petprofile.service.TypeService;
import com.group6.petssion.repository.TypeRepository;

@Service
@Transactional
public class TypeServiceImpl implements TypeService {
	@Autowired
	TypeRepository typeDao;

	@Override
	public List<Type> getAllType() {
		return (List<Type>)typeDao.findAll();
	}

	@Override
	public Type getType(Integer id) {
		Optional<Type> optional = typeDao.findById(id);
		Type kind = null;
		if (optional.isPresent()) {
			kind = optional.get();
		} else {
			throw new RuntimeException("Food(id=" + id + ")不存在");
		}
		return kind;
	}

	@Override
	public void save(Type kind) {
		typeDao.save(kind);
	}
}
