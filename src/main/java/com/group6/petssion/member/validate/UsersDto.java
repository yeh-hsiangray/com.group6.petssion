package com.group6.petssion.member.validate;

import java.util.List;
import java.util.Set;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.Job;
import com.group6.petssion.bean.UsersImg;

public class UsersDto {
	
	private Integer id;
	
	@NotBlank(message="姓名不能為空")
	@Length(min=1,max = 12,message="用戶名必須位於1到12之間")
	private String name;

	@NotNull(message = "性別不能為空")
	private String gender;
	
	@NotNull
	private Job job;
	
	@NotNull
	private Hobby hobby;
	
	private Set<UsersImg> usersImg;
	
	List<MultipartFile> img;
	
	
	


	public UsersDto(Integer id,
			@NotBlank(message = "姓名不能為空") @Length(min = 1, max = 12, message = "用戶名必須位於1到12之間") String name,
			@NotNull(message = "性別不能為空") String gender, @NotNull Job job, @NotNull Hobby hobby, Set<UsersImg> usersImg,
			List<MultipartFile> img) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.job = job;
		this.hobby = hobby;
		this.usersImg = usersImg;
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





	public Job getJob() {
		return job;
	}





	public void setJob(Job job) {
		this.job = job;
	}





	public Hobby getHobby() {
		return hobby;
	}





	public void setHobby(Hobby hobby) {
		this.hobby = hobby;
	}





	public Set<UsersImg> getUsersImg() {
		return usersImg;
	}





	public void setUsersImg(Set<UsersImg> usersImg) {
		this.usersImg = usersImg;
	}





	public List<MultipartFile> getImg() {
		return img;
	}





	public void setImg(List<MultipartFile> img) {
		this.img = img;
	}


	
	
}
