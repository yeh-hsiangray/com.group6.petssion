package com.group6.petssion.bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Hobby")
public class Hobby {
	@Id
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	private String name;

	/*
	 * @JoinTable(name = "users_hobby", joinColumns= {@JoinColumn(name="users_id",
	 * referencedColumnName="id")}, inverseJoinColumns=
	 * {@JoinColumn(name="hobby_id", referencedColumnName="id")})
	 */

	@ManyToMany(targetEntity = Users.class, mappedBy = "hobby", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JsonIgnore
	private List<Users> users;


	public Hobby() {
	}

	

	public Hobby(Integer id, String name, List<Users> users) {
		super();
		this.id = id;
		this.name = name;
		this.users = users;
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



	public List<Users> getUsers() {
		return users;
	}



	public void setUsers(List<Users> users) {
		this.users = users;
	}



	


	
}
