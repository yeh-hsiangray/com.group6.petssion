package com.group6.petssion.petprofile.validate;

import java.util.List;

import java.util.Set;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;


import com.group6.petssion.bean.Food;
import com.group6.petssion.bean.Kind;
import com.group6.petssion.bean.Personality;
import com.group6.petssion.bean.PetImg;
import com.group6.petssion.bean.Type;
import com.group6.petssion.bean.Users;

public class PetDto {
	private Integer id;
	@NotBlank(message="寵物名不能為空")
	@Length(min=1,max = 12,message="用戶名必須位於1到12之間")
	private String name;
	@NotNull(message = "性別不能為空")
	private String gender;
	@Range(min=1, max=20,message = "年齡異常,範圍{min}到{max}")
//	@Pattern(regexp = "^[0-9]*$", message = "請輸入數字")
	private Integer age;

	// 對應喜愛食物選項
	@NotNull(message = "喜愛食物不能為空")
	private Food food;

	// 對應種類類型選項
	@NotNull
	private Type type;

	// 對應種類選項
	@NotNull
	private Kind kind;

	// 對應個性選項
	@NotNull(message = "個性不能為空")
	private Personality personality;

	// 對應petImg類

	private Set<PetImg> petImg;


	// 對應User類
	private Integer userId;
	private Users user;

//	@NotNull(message = "必須上傳圖片")
	List<MultipartFile> img;


	public PetDto() {
	}

	public PetDto(Integer id,
			@NotBlank(message = "寵物名不能為空") @Length(min = 1, max = 12, message = "用戶名必須位於1到12之間") String name,
			@NotNull(message = "性別不能為空") String gender,
			@Range(min = 1, max = 20, message = "年齡異常,範圍{min}到{max}") Integer age,
			@NotNull(message = "喜愛食物不能為空") Food food, @NotNull Type type, @NotNull Kind kind,
			@NotNull(message = "個性不能為空") Personality personality, Set<PetImg> petImg, Integer userId, Users user,
			List<MultipartFile> img) {
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


	public Set<PetImg> getPetImg() {
		return petImg;
	}

	public void setPetImg(Set<PetImg> petImg) {

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

}
