package com.group6.petssion.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Hobby")
public class Hobby {
	@Id
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	private String name;
	
	@ManyToMany(mappedBy="hobby" )
	 private List<Users> users =new ArrayList<>();

	public Hobby() {
	}

	public Hobby(Integer id, String name) {
		super();
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
