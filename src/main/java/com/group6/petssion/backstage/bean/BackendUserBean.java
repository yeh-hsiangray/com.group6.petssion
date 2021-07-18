package com.group6.petssion.backstage.bean;

import java.sql.Date;

public class BackendUserBean implements BackendUserBeanInterface {
	
	private Integer id;
	private String account;
	private String name;
	private String email;
	private String gender;
	private String jobName;
	private Date birthday;
	private Integer manager;
	private Integer Blockade;
	public BackendUserBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BackendUserBean(Integer id, String account, String name, String email, String gender, String jobName,
			Date birthday, Integer manager, Integer blockade) {
		super();
		this.id = id;
		this.account = account;
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.jobName = jobName;
		this.birthday = birthday;
		this.manager = manager;
		Blockade = blockade;
	}

	@Override
	public String getName() {
		return name;
	}
	@Override
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String getEmail() {
		return email;
	}
	@Override
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String getGender() {
		return gender;
	}
	@Override
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String getJobName() {
		return jobName;
	}
	@Override
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	@Override
	public Date getBirthday() {
		return birthday;
	}
	@Override
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	@Override
	public Integer getManager() {
		return manager;
	}
	@Override
	public void setManager(Integer manager) {
		this.manager = manager;
	}
	@Override
	public Integer getBlockade() {
		return Blockade;
	}
	@Override
	public void setBlockade(Integer blockade) {
		this.Blockade = blockade;
	}

	@Override
	public String getAccount() {
		return account;
	}

	@Override
	public void setAccount(String account) {
		this.account = account;
	}
	@Override
	public Integer getId() {
		return id;
	}
	@Override
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
}
