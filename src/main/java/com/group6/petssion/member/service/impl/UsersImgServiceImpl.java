package com.group6.petssion.member.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.PetImg;
import com.group6.petssion.bean.UsersImg;
import com.group6.petssion.member.dao.impl.UsersImgDaoImpl;
import com.group6.petssion.member.service.UsersImgService;
import com.group6.petssion.repository.UsersImgRepository;

@Service
@Transactional
public class UsersImgServiceImpl implements UsersImgService {
	
	@Autowired
	UsersImgRepository usersImgDao;
	
	@Autowired
	UsersImgDaoImpl usersImgDao2;
	
	@Override
	public UsersImg saveUsersImg(UsersImg usersImg) {
		return usersImgDao.save(usersImg);
	}

	@Override
	public void delete(Integer id) {
		usersImgDao.deleteById(id);
	}

	@Override
	public UsersImg get(Integer id) {
		Optional<UsersImg> optional = usersImgDao.findById(id);
		UsersImg usersImg = null;
		if (optional.isPresent()) {
			usersImg = optional.get();
		} else {
			throw new RuntimeException("UsersImg(id=" + id + ")不存在");
		}
		return usersImg;
	}
	@Transactional
	@Override
	public void updateUsersImg(UsersImg usersImg) {
		usersImgDao2.updateUsersImg(usersImg);
	}

	@Override
	public List<UsersImg> finAllUsersImg() {
		return usersImgDao.findAll();
	}
	
	
	@Override
	public List<String> findUserImgByUserId(int userId) {
		return usersImgDao2.findUserImgByUserId(userId);
	}
}
