package com.group6.petssion.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "account_password")
public class account_password {
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String account;
	private String password;
	
	@Column(name = "fk_users_id")
	@Transient
	private Integer usersId;
	@OneToOne
	@JoinColumn(name="fk_users_id")
	private Users users;
	
	
	public account_password () {
		
	}

	

	public account_password(Integer id, String account, String password, Integer usersId, Users users) {
		super();
		this.id = id;
		this.account = account;
		this.password = password;
		this.usersId = usersId;
		this.users = users;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getUsersId() {
		return usersId;
	}

	public void setUsersId(Integer usersId) {
		this.usersId = usersId;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}
	
	
}
