package com.group6.petssion.member.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.Job;
import com.group6.petssion.bean.Users;
import com.group6.petssion.member.dao.impl.UserDaoImpl;
import com.group6.petssion.member.service.HobbyService;
import com.group6.petssion.member.service.JobService;
import com.group6.petssion.member.service.UserService;
import com.group6.petssion.repository.UsersRepository;

@Service
@Transactional(rollbackFor=Exception.class)
public class UserServiceImpl implements UserService{

	@Autowired
	UsersRepository userDao;

	@Autowired
	UserDaoImpl userDao2;
	
	@Autowired
	JobService jobService;
	
	@Autowired
	HobbyService hobbyService;
	
	@Override
	public Users saveUser(Users user) {
		Job job = jobService.getJob(user.getJob().getId());
		user.setJob(job);
//		List<Hobby> hobby = hobbyService.getHobby(user.getHobby().getId());
//		user.setHobby(hobby);	

		return userDao.save(user);
	}

	@Transactional
	@Override
	public void updateUser(Users user) {
		userDao2.detachJob(user.getJob());
		userDao2.detachHobby(user.getHobby());
		Job job = jobService.getJob(user.getJob().getId());
		user.setJob(job);
//		List <Hobby> hobby = hobbyService.getHobby(user.getId());
//		user.setHobby(hobby);
		userDao2.updateUser(user);
		userDao.save(user);
	}

	@Override
	public Users get(Integer id) {
		Optional<Users> optional = userDao.findById(id);
		Users user = null;
		if (optional.isPresent()) {
			user = optional.get();
		} else {
			throw new RuntimeException("User(id=" + id + ")不存在");
		}
		return user;
	}

	@Override
	public void deleteUser(Integer id) {
		userDao.deleteById(id);
	}

	@Override
	public List<Users> findAllUser() {
		return userDao.findAll();
	}

	@Override
	public boolean isUsersExist(Users user) {
		return userDao2.isUsersExist(user);
	}

//	@Override
//	public List<Users> findAllUserByUserId(int userId) {
//		return userDao2.findAllUserByUserId(userId);
//	}

	@Override
	public List<Users> getAllUserNameByUserId(int userId) {
		return userDao2.getAllUserNameByUserId(userId);
	}

	public List<Users> findUserByUserId(int userId) {
	return userDao2.findUserByUserId(userId);
	}

	@Override
	public List<Users> searchUserByName(String searchWord) {
		return userDao2.searchUserByName(searchWord);
	}

	@Override
	public List<Users> searchUserByGender(String searchWord) {
		return userDao2.searchUserByGender(searchWord);
	}

	@Override
	public List<Users> searchUserByAddress(String searchWord) {
		return userDao2.searchUserByAddress(searchWord);
	}

	@Override
	public List<Users> searchUserByMobilephone(String searchWord) {
		return userDao2.searchUserByMobilephone(searchWord);
	}

	@Override
	public List<Users> searchUserByEmail(String searchWord) {
		return userDao2.searchUserByEmail(searchWord);
	}

	@Override
	public List<Users> searchUserByBlockade(String searchWord) {
		return userDao2.searchUserByBlockade(searchWord);
	}

	@Override
	public List<Users> searchUserByBirth(String searchWord) {
		return userDao2.searchUserByBirth(searchWord);
	}

	@Override
	public List<Users> searchUserByJob(String searchWord) {
		return userDao2.searchUserByJob(searchWord);
	}

	@Override
	public List<Users> searchUserByHobby(String searchWord) {
		return userDao2.searchUserByHobby(searchWord);
	}

	@Override
	public List<Users> searchUserByRegdate(String searchWord) {
		return userDao2.searchUserByRegdate(searchWord);
	}
	
	
}
