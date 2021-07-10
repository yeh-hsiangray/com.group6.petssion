package com.group6.petssion.member.service;

import java.util.List;

import com.group6.petssion.bean.Users;

public interface UserService {
	
//	@Autowired
//	private UsersRepository usersRepository;
//	
//	public List<Users> listUserAll() {
//		return usersRepository.findAll();
//	}
//	
//	public void saveUser(Users users) {
//		usersRepository.save(users);
//	}
//	
//	public Users findUserById(Integer id) {
//		return usersRepository.findById(id).get();
//	}
//
//	public Users findByname(String name) {
//		return usersRepository.findByname(name);
//	}
//	
//	public void deleteById(Integer id) {
//		usersRepository.deleteById(id);
//	}
//	
	
	List<Users> findUserByUserId(int userId);
//	List<Users> findAllUserByUserId(int userId);


	Users saveUser(Users user);

	void updateUser(Users user);
	
	Users get(Integer id);

	void deleteUser(Integer id);

	List<Users> findAllUser();

	boolean isUsersExist(Users user);
	
	List<Users> getAllUserNameByUserId(int userId);
	
	List<Users> searchUserByName(String searchWord);
	List<Users> searchUserByGender(String searchWord);
	List<Users> searchUserByAddress(String searchWord);
	List<Users> searchUserByMobilephone(String searchWord);
	List<Users> searchUserByEmail(String searchWord);
	List<Users> searchUserByBlockade(String searchWord);
	List<Users> searchUserByBirth(String searchWord);
	List<Users> searchUserByJob(String searchWord);
	List<Users> searchUserByHobby(String searchWord);
	List<Users> searchUserByRegdate(String searchWord);
}
