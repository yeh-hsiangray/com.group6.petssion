package com.group6.petssion.backstage.bean;

import java.sql.Date;

public interface BackendUserBeanInterface {

	String getName();

	void setName(String name);

	String getEmail();

	void setEmail(String email);

	String getGender();

	void setGender(String gender);

	String getJobName();

	void setJobName(String jobName);

	Date getBirthday();

	void setBirthday(Date birthday);

	Integer getManager();

	void setManager(Integer manager);

	Integer getBlockade();

	void setBlockade(Integer blockade);

	String getAccount();

	void setAccount(String account);
	
	Integer getId();

	void setId(Integer id);
}