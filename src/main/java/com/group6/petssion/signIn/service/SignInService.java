package com.group6.petssion.signIn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.account_password;
import com.group6.petssion.mail.Mail;
import com.group6.petssion.repository.AAndPRepository;
import com.group6.petssion.repository.UsersRepository;

@Service
public class SignInService {
	@Autowired
	private AAndPRepository aAndPRepository;
	@Autowired
	private UsersRepository ur;
	@Autowired
	private Mail mail;

	public Users signIn(String account, String password) {
		account_password aAndP = aAndPRepository.findByAccountAndPassword(account, password);
		if (aAndP == null) {
			return null;
		} else {
			return aAndP.getUsers();
		}
	}
	public int forgotPassword(account_password aAndP) {
		Users user = ur.findByEmail(aAndP.getForgoteEmail());
		account_password aAndP2 = aAndPRepository.findByAccount(aAndP.getAccount());
		if(user!=null&&aAndP2!=null) {
		if (user.getId() == aAndP2.getUsers().getId()) {
			String garbled = mail.garbled();
			user.setGarbled(garbled);
			ur.save(user);
			mail.forgotMail(user.getEmail(), garbled);
			return 0;
		} 
		}
		return 1;
	}
	public account_password checkEmail(Users user) {
		Users user2 = ur.findByGarbledAndEmail(user.getGarbled(),user.getEmail());
		if(user2!=null) {
			user2.setCheckemail(1);
			user2.setGarbled("end");
			ur.save(user2);
			return user2.getAccount_password();
		}
		return null;
	}
	public void updatePassword(account_password aAndP) {
		account_password aAndP2 = aAndPRepository.findByAccount(aAndP.getAccount());
		aAndP2.setPassword(aAndP.getPassword());
		aAndPRepository.save(aAndP2);
	}
	
}
