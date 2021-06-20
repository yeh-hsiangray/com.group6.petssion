package com.group6.petssion.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Type")
public class Type {
	@Id
	@Column(name="id",unique = true,nullable = false)
	private Integer id;
	private String name;
	
	public Type() {
	}
	
	public Type(Integer id, String name) {
		this.id = id;
		this.name = name;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
