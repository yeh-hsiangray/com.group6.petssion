package com.group6.petssion.member.service;

import java.util.List;

import com.group6.petssion.bean.Users;

public interface UserService {
	
	List<Users> findAllUserByUserId(int userId);

	Users saveUser(Users user);

	void updateUser(Users user);
	
	Users get(Integer id);

	void deleteUser(Integer id);

	List<Users> findAllUser();

	public boolean isUsersExist(Users user);
	
	public List<Users> getAllUserNameByUserId(int userId);
}
