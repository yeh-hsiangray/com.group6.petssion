package com.group6.petssion.bean;

import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	
//	@DateTimeFormat
	private Date birthday;
	private String address;
	private String constellation;
	private Integer height;
	private Integer weight;
	private String mobilephone;
	private String selfintroduction;
	private String email;
	private String garbled;
	private Integer checkemail;
	
	//@Column(name = "manager", nullable = false)
	private Integer manager;
	private LocalDate regdate;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_job_id", referencedColumnName = "id")
	private Job job;
	
	private Integer Blockade;
	

	@ManyToMany(targetEntity = Hobby.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JsonIgnore
	 private List<Hobby> hobby;

	
	//對應account類
	@OneToOne(mappedBy = "users",fetch =  FetchType.LAZY)
	@JsonIgnore
	private account_password account_password;
	
	// 對應Pet類
	@OneToMany(mappedBy = "user")
	private List<Pet> pet;
	
	// 對應UsersImg類
	@OneToMany(mappedBy = "users")
	private List<UsersImg> usersImg;
	
	@Transient
	List<MultipartFile> img;

	@Transient
	String base64UserImg;
	
	public String getbase64UserImg() {
		return base64UserImg;
	}

	public void setbase64UserImg(String base64UserImg) {
		this.base64UserImg = base64UserImg;
	}

	public Users() {

	}


	public Users(Integer id, String name, String gender, Date birthday, String address, String constellation,
			Integer height, Integer weight, String mobilephone, String selfintroduction, String email, String garbled,
			Integer checkemail, Integer manager, LocalDate regdate, Job job, Integer blockade, List<Hobby> hobby,
			account_password account_password, List<Pet> pet, List<UsersImg> usersImg,
			List<MultipartFile> img, String base64Img) {
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
		this.garbled = garbled;
		this.checkemail = checkemail;
		this.manager = manager;
		this.regdate = regdate;
		this.job = job;
		Blockade = blockade;
		this.hobby = hobby;
		this.account_password = account_password;
		this.pet = pet;
		this.usersImg = usersImg;
		this.img = img;
		this.base64UserImg = base64Img;
	}


	public Users(Integer id, String name, String gender, Date birthday, String address, String constellation,
			Integer height, Integer weight, String mobilephone, String selfintroduction, String email, Integer manager,
			LocalDate regdate, Job job, Integer blockade, List<Hobby> hobby,
			com.group6.petssion.bean.account_password account_password, List<Pet> pet, List<UsersImg> usersImg,
			List<MultipartFile> img, String base64UserImg) {
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
		this.img = img;
		this.base64UserImg = base64UserImg;
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

	public LocalDate getRegdate() {
		return regdate;
	}

	public void setRegdate(LocalDate localDate) {
		this.regdate = localDate;
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

	public List<MultipartFile> getImg() {
		return img;
	}

	public void setImg(List<MultipartFile> img) {
		this.img = img;
	}



	public String getGarbled() {
		return garbled;
	}

	public void setGarbled(String garbled) {
		this.garbled = garbled;
	}

	public Integer getCheckemail() {
		return checkemail;
	}

	public void setCheckemail(Integer checkemail) {
		this.checkemail = checkemail;
	}
	
}
