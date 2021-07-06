package com.group6.petssion.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.sql.Blob;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "UsersImg")
//@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class UsersImg implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String fileName;
	
	@Lob
	private Blob usersImage;
	
	@Column(name = "fk_Users_id")
	@Transient
	private Integer usersId;
	@ManyToOne
	@JoinColumn(name = "fk_Users_id")
	@JsonIgnore
	private Users users;
	
	@Transient
	List<String> imgIdList;

	public UsersImg() {
	}

	
	public UsersImg(Integer id, String fileName, Blob usersImage, Integer usersId, Users users,
			List<String> imgIdList) {
		super();
		this.id = id;
		this.fileName = fileName;
		this.usersImage = usersImage;
		this.usersId = usersId;
		this.users = users;
		this.imgIdList = imgIdList;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Blob getUsersImage() {
		return usersImage ;
	}

	public void setUsersImage(Blob usersImage) {
		this.usersImage = usersImage;
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

	public List<String> getImgIdList() {
		return imgIdList;
	}

	public void setImgIdList(List<String> imgIdList) {
		this.imgIdList = imgIdList;
	}

	

	
}
