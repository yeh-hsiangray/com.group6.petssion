package com.group6.petssion.petprofile.model;

import java.io.Serializable;
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

import com.group6.petssion.member.model.Users;

@Entity
@Table(name = "Pet")
public class Pet implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "name", nullable = false)
	private String name;
	private String gender;
	private Integer age;

	// 對應喜愛食物選項
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_food_id")
	private Food food;

	// 對應種類類型選項
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_type_id")
	private Type type;

	// 對應種類選項
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_kind_id")
	private Kind kind;

	// 對應個性選項
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_personality_id")
	private Personality personality;

	// 對應petImg類
	@OneToMany(mappedBy = "pet")
	private List<PetImg> petImg;

	// 對應User類
	@Column(name = "fk_user_id")
	@Transient
	private Integer userId;
	@ManyToOne
	@JoinColumn(name = "fk_user_id")
	private Users user;

	public Pet() {
	}

	public Pet(Integer id, String name, String gender, Integer age, Food food, Type type, Kind kind,
			Personality personality, List<PetImg> petImg, Integer userId, Users user) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.food = food;
		this.type = type;
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

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
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
