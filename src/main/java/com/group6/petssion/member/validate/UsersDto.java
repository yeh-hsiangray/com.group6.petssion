package com.group6.petssion.member.validate;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.Job;
import com.group6.petssion.bean.UsersImg;

public class UsersDto {
	
	private static final String PHOME_REGEXP = "[0-9]{4}[0-9]{3}[0-9]{3}";
	
	
//	private static final String Birthday_REGEXP = "/^(19|20)\\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$/";	
	
	private Integer id;
	
	@Email(message="電子郵件格式錯誤")
	@NotBlank(message = "電子郵件不能為空")
	private String email;
	
	//台灣《姓名條例》規定取名無字數上限，故移除限制字數長度
	@NotEmpty(message="姓名不能為空")
	private String name;
	
	@NotNull(message = "性別不能為空")
	private String gender;
	
	private Date birthday;
	

	@NotNull(message = "地址不能為空")
	private String address;
	
	@Length(min=3,max = 3,message="請正確輸入星座")
	private String constellation;
	
	@Range(min=100,max=250,message="請輸入正確身高")
	private Integer height;
	
	@Range(min=1,max=300,message="請輸入正確體重")
	private Integer weight;
	
	@NotBlank(message="手機號碼不能為空")
	@Pattern(regexp=PHOME_REGEXP, message="手機號碼格式錯誤")
	private String mobilephone;
	
	@NotNull
	private Job job;
	
	@NotNull
	private List <Hobby> hobby;
	
	@Length(min=1,max = 100,message="自我介紹字數最多1到100之間")
	private String selfintroduction;
	
	private Set<UsersImg> usersImg;
	
//	private Integer userId;
//	private Users user;
	
	List<MultipartFile> img;
	
	public UsersDto() {
		
	}

	public UsersDto(Integer id, String email, @NotEmpty(message = "姓名不能為空") String name,
			@NotNull(message = "性別不能為空") String gender, Date birthday, @NotNull(message = "地址不能為空") String address,
			@Length(min = 3, max = 3, message = "請正確輸入星座") String constellation,
			@Range(min = 100, max = 250, message = "請輸入正確身高") Integer height,
			@Range(min = 1, max = 300, message = "請輸入正確體重") Integer weight,
			@NotBlank(message = "手機號碼不能為空") @Pattern(regexp = "[0-9]{4}[0-9]{3}[0-9]{3}", message = "手機號碼格是錯誤") String mobilephone,
			@NotNull Job job, @NotNull List<Hobby> hobby,
			@Length(min = 1, max = 100, message = "自我介紹字數最多1到100之間") String selfintroduction, Set<UsersImg> usersImg,
			List<MultipartFile> img) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.constellation = constellation;
		this.height = height;
		this.weight = weight;
		this.mobilephone = mobilephone;
		this.job = job;
		this.hobby = hobby;
		this.selfintroduction = selfintroduction;
		this.usersImg = usersImg;
		this.img = img;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public List<Hobby> getHobby() {
		return hobby;
	}

	public void setHobby(List<Hobby> hobby) {
		this.hobby = hobby;
	}

	public String getSelfintroduction() {
		return selfintroduction;
	}

	public void setSelfintroduction(String selfintroduction) {
		this.selfintroduction = selfintroduction;
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

	public static String getPhomeRegexp() {
		return PHOME_REGEXP;
	}

	

	
	
}
