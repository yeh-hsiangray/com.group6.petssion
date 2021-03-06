package com.group6.petssion.bean;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "fk_food_id")
	private Food food;

	// 對應種類類型選項
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "fk_type_id")
	private Type type;

	// 對應種類選項
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "fk_kind_id")
	private Kind kind;

	// 對應個性選項
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	@JoinColumn(name = "fk_personality_id")
	private Personality personality;

	// 對應petImg類
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "pet")
	private List<PetImg> petImg;

	// 對應User類
	@Column(name = "fk_user_id")
	@Transient
	private Integer userId;
	@ManyToOne
	@JoinColumn(name = "fk_user_id")
	@JsonIgnore
	private Users user;
	@Transient
	private List<MultipartFile> img;
	@Transient
	private List<Integer> delImgId;	
	public String getBase64PetImg() {
		return base64PetImg;
	}

	public void setBase64PetImg(String base64PetImg) {
		this.base64PetImg = base64PetImg;
	}

	@Transient
	String base64PetImg;

	public Pet() {
	}

	public Pet(Integer id, String name, String gender, Integer age, Food food, Type type, Kind kind,
			Personality personality, List<PetImg> petImg, Integer userId, Users user, List<MultipartFile> img,
			List<Integer>delImgId) {
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
		this.img = img;
		this.delImgId = delImgId;
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

	public List<MultipartFile> getImg() {
		return img;
	}

	public void setImg(List<MultipartFile> img) {
		this.img = img;
	}

	public List<Integer> getDelImgId() {
		return delImgId;
	}

	public void setDelImgId(List<Integer> delImgId) {
		this.delImgId = delImgId;
	}


}
