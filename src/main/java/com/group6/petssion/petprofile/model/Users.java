package com.group6.petssion.petprofile.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class Users implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Timestamp admissionTime;
	private String account;
	private String name;
	private String password;
	private String address;
	private Date birthday;
	private String email;
	private String gender;
	private Integer height;
	private Integer weight;
	//對應興趣選項
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_hobby_id")
	private Hobby hobby;
	
	@Column(name = "manager", nullable = false)
	private Integer manager;
	private Integer mobilephone;
	
	// 對應Pet類
	@OneToMany(mappedBy = "user")
	private List<Pet> pet;
	
	// 對應UsersImg類
	@OneToMany(mappedBy = "users")
	private List<UsersImg> usersImg;

	public Users() {

	}

	public Users(Integer id, Timestamp admissionTime, String account, String name, String password, String address,
			Date birthday, String email, String gender, Integer height, Integer weight, Hobby hobby, Integer manager,
			Integer mobilephone, List<Pet> pet, List<UsersImg> usersImg) {
		super();
		this.id = id;
		this.admissionTime = admissionTime;
		this.account = account;
		this.name = name;
		this.password = password;
		this.address = address;
		this.birthday = birthday;
		this.email = email;
		this.gender = gender;
		this.height = height;
		this.weight = weight;
		this.hobby = hobby;
		this.manager = manager;
		this.mobilephone = mobilephone;
		this.pet = pet;
		this.usersImg = usersImg;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Timestamp getAdmissionTime() {
		return admissionTime;
	}

	public void setAdmissionTime(Timestamp admissionTime) {
		this.admissionTime = admissionTime;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public Hobby getHobby() {
		return hobby;
	}

	public void setHobby(Hobby hobby) {
		this.hobby = hobby;
	}

	public Integer getManager() {
		return manager;
	}

	public void setManager(Integer manager) {
		this.manager = manager;
	}

	public Integer getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(Integer mobilephone) {
		this.mobilephone = mobilephone;
	}

	public List<Pet> getPet() {
		return pet;
	}

	public void setPet(List<Pet> pet) {
		this.pet = pet;
	}

	public List<UsersImg> getUsersImg() {
		return usersImg;
	}

	public void setUsersImg(List<UsersImg> usersImg) {
		this.usersImg = usersImg;
	}

}
