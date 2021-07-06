package com.group6.petssion.member.service;

import java.util.List;

import com.group6.petssion.bean.Users;

//@Service
//@Transactional


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
	
	public List<Users> findUserByUserId(int userId);
//	List<Users> findAllUserByUserId(int userId);

	Users saveUser(Users user);

	void updateUser(Users user);
	
	Users get(Integer id);

	void deleteUser(Integer id);

	List<Users> findAllUser();

	public boolean isUsersExist(Users user);
	
	public List<Users> getAllUserNameByUserId(int userId);
}
