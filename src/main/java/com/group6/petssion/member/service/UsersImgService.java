package com.group6.petssion.member.service;

import java.util.List;

import com.group6.petssion.bean.UsersImg;

public interface UsersImgService {
	UsersImg saveUsersImg(UsersImg usersImg);
	void delete(Integer id);
	UsersImg get(Integer id);
	void updateUsersImg(UsersImg usersImg);
	List<UsersImg> finAllUsersImg();
}
