package com.infotran.springboot.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class Users implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String gender;
	private Date birthday;
	private String address;
	private String constellation;
	private Integer height;
	private Integer weight;
	private String mobilephone;
	private String selfintroduction;
	private String email;
	
	//@Column(name = "manager", nullable = false)
	private Integer manager;
	private Date regdate;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_job_id", referencedColumnName = "id")
	private Job job;
	
	private Integer Blockade;
	
	@ManyToMany(cascade = {CascadeType.ALL})
	 @JoinTable(name = "hobby_users",
	 joinColumns= {@JoinColumn(name="hobby_id", referencedColumnName="id")},
	    inverseJoinColumns= {@JoinColumn(name="users_id", referencedColumnName="id")})
	 private List<Hobby> hobby=new ArrayList<>();
	
	//對應account類
	@OneToOne(mappedBy = "users")
	private account_password account_password;
	
	// 對應Pet類
	@OneToMany(mappedBy = "user")
	private List<Pet> pet;
	// 對應UsersImg類
	@OneToMany(mappedBy = "users")
	private List<UsersImg> usersImg;

	public Users() {

	}

	public Users(Integer id, String name, String gender, Date birthday, String address, String constellation,
			Integer height, Integer weight, String mobilephone, String selfintroduction, String email, Integer manager,
			Date regdate, Job job, Integer blockade, List<Hobby> hobby,
			com.infotran.springboot.bean.account_password account_password, List<Pet> pet, List<UsersImg> usersImg) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.constellation = constellation;
		this.height = height;
		this.weight = weight;
		this.mobilephone = mobilephone;
		this.selfintroduction = selfintroduction;
		this.email = email;
		this.manager = manager;
		this.regdate = regdate;
		this.job = job;
		Blockade = blockade;
		this.hobby = hobby;
		this.account_password = account_password;
		this.pet = pet;
		this.usersImg = usersImg;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getConstellation() {
		return constellation;
	}

	public void setConstellation(String constellation) {
		this.constellation = constellation;
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

	public String getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getSelfintroduction() {
		return selfintroduction;
	}

	public void setSelfintroduction(String selfintroduction) {
		this.selfintroduction = selfintroduction;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getManager() {
		return manager;
	}

	public void setManager(Integer manager) {
		this.manager = manager;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Integer getBlockade() {
		return Blockade;
	}

	public void setBlockade(Integer blockade) {
		Blockade = blockade;
	}

	public List<Hobby> getHobby() {
		return hobby;
	}

	public void setHobby(List<Hobby> hobby) {
		this.hobby = hobby;
	}

	public account_password getAccount_password() {
		return account_password;
	}

	public void setAccount_password(account_password account_password) {
		this.account_password = account_password;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



}
