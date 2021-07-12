package com.group6.petssion.bean;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MatchStatus {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name="user_A")
	private Integer userA;
	@Column(name="user_B")
	private Integer userB;
	
	private Integer status;
	
	public MatchStatus() {
		
	}

	public MatchStatus(Integer id, Integer userA, Integer userB, Integer status) {
		super();
		this.id = id;
		this.userA = userA;
		this.userB = userB;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserA() {
		return userA;
	}

	public void setUserA(Integer userA) {
		this.userA = userA;
	}

	public Integer getUserB() {
		return userB;
	}

	public void setUserB(Integer userB) {
		this.userB = userB;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

		
	}
	
	

