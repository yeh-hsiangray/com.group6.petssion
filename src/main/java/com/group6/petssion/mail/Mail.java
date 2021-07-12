package com.group6.petssion.mail;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
@Controller
public class Mail {

@Autowired
JavaMailSender javaMail;

public void checkMail(String userMail,String checkUrl) {
	SimpleMailMessage message = new SimpleMailMessage();
	String check="http://localhost:8080/petssion/registered/check?garbled=";
	message.setTo(userMail);
	message.setSubject("帳號驗證信");
	message.setText("請點擊連結: "+check+checkUrl+mail+userMail);
	
	javaMail.send(message);
}
public void forgotMail(String userMail,String checkUrl) {
	SimpleMailMessage message = new SimpleMailMessage();
	String check="http://localhost:8080/petssion/signIn/check?garbled=";
	String mail="&email=";
	message.setTo(userMail);
	message.setSubject("密碼重置驗證信");
	message.setText("請點擊連結: "+check+checkUrl+mail+userMail);

	
	javaMail.send(message);
}

public String garbled() {
	String string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	char[] ch = new char[8]; 
	for (int i = 0; i < 8; i++) {
		Random random = new Random();
		int index = random.nextInt(string.length());
		ch[i] = string.charAt(index);
	}
	
	String result = String.valueOf(ch);
	return result;
}

}
