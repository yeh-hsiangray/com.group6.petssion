package com.group6.petssion.bean;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MatchStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	
	private int user_A;
	
	private int user_B;
	
	private int status;
	
	public MatchStatus() {
		
	}

	public MatchStatus(int id, int user_A, int user_B, int status) {
		super();
		this.id = id;
		this.user_A = user_A;
		this.user_B = user_B;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_A() {
		return user_A;
	}

	public void setUser_A(int user_A) {
		this.user_A = user_A;
	}

	public int getUser_B() {
		return user_B;
	}

	public void setUser_B(int user_B) {
		this.user_B = user_B;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

		
	}
	
	

