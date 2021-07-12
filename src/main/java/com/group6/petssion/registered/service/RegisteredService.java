package com.group6.petssion.registered.service;

import java.time.LocalDate;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.account_password;
import com.group6.petssion.mail.Mail;
import com.group6.petssion.repository.AAndPRepository;
import com.group6.petssion.repository.UsersRepository;

@Service
@Transactional
public class RegisteredService {
	@Autowired
	private UsersRepository ur;
	@Autowired
	private AAndPRepository aAndPR;
	@Autowired
	private Mail mail;
	
	public void regisered(Users users,account_password aAndP) {
		users.setManager(0);
		users.setRegdate(LocalDate.now());
		users.setBlockade(0);
		users.setCheckemail(0);
		users.setGarbled(mail.garbled());
		
		ur.save(users);
		users=ur.findByNameAndEmail(users.getName(),users.getEmail());
		aAndP.setUsers(users);
		aAndPR.save(aAndP);
		mail.checkMail(users.getEmail(),users.getGarbled());
		
	}
	
	public int selectAct(account_password aAndP) {
		account_password aAndP2 = aAndPR.findByAccount(aAndP.getAccount());
		if(aAndP2==null) {
			return 0;			
		}
		return 1;
	}
	public int selectEmail(Users user) {
		Users user2 = ur.findByEmail(user.getEmail());
		if(user2==null) {
			return 0;			
		}
		return 1;
	}
	
	public int checkEmail(Users user) {
		Users user2 = ur.findByGarbledAndEmail(user.getGarbled(),user.getEmail());
		if(user2!=null) {
			user2.setCheckemail(1);
			user2.setGarbled("end");
			ur.save(user2);
			return 1;
		}
		return 0;
	}
}
