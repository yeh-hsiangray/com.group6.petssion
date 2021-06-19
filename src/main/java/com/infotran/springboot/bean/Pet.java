package com.infotran.springboot.bean;

import java.io.Serializable;
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
import javax.persistence.Transient;

@Entity
@Table(name="Pet")
public class Pet implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "name", nullable = false)
	private String name;
	private Timestamp admissionTime;
	private String gender;
	private Integer age;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_food_id")
	private Food food;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_kind_id")
	private Kind kind;
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_personality_id")
	private Personality personality;
	
	
	
	//對應petImg類
	@OneToMany(mappedBy = "pet")
	private List<PetImg> petImg;
	//對應User類
	@Column(name="fk_user_id")
	@Transient
	private Integer userId;
	@ManyToOne
	@JoinColumn(name="fk_user_id")
	private Users user;
	
	
	public Pet() {
	}


	public Pet(Integer id, String name, Timestamp admissionTime, String gender, Integer age, Food food, Kind kind,
			Personality personality, List<PetImg> petImg, Integer userId, Users user) {
		super();
		this.id = id;
		this.name = name;
		this.admissionTime = admissionTime;
		this.gender = gender;
		this.age = age;
		this.food = food;
		this.kind = kind;
		this.personality = personality;
		this.petImg = petImg;
		this.userId = userId;
		this.user = user;
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


	public Timestamp getAdmissionTime() {
		return admissionTime;
	}


	public void setAdmissionTime(Timestamp admissionTime) {
		this.admissionTime = admissionTime;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public Integer getAge() {
		return age;
	}


	public void setAge(Integer age) {
		this.age = age;
	}


	public Food getFood() {
		return food;
	}


	public void setFood(Food food) {
		this.food = food;
	}


	public Kind getKind() {
		return kind;
	}


	public void setKind(Kind kind) {
		this.kind = kind;
	}


	public Personality getPersonality() {
		return personality;
	}


	public void setPersonality(Personality personality) {
		this.personality = personality;
	}


	public List<PetImg> getPetImg() {
		return petImg;
	}


	public void setPetImg(List<PetImg> petImg) {
		this.petImg = petImg;
	}


	public Integer getUserId() {
		return userId;
	}


	public void setUserId(Integer userId) {
		this.userId = userId;
	}


	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}
	
	
	
}
