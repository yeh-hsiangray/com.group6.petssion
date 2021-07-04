package com.group6.petssion.bean;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

/**
 * 名字: Gina Ko
 * 日期: 2021/05/01
 */
@Entity
@Table(name="FriendlyEnv")
public class FriendlyEnv implements Serializable, Comparable<FriendlyEnv>{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int envId;
	private String city;
	private String name;
	private String animalTypes;
	private String envTypes;
	private String telephone;
	private String address;	 
	private byte[] image;
	private String fileName;
	
	@Transient
	MultipartFile friendlyEnvImage;
	
	@Transient
	private String[] animalTypesArr;
	
	
	
	public FriendlyEnv(int envId, String city, String name, String animalTypes, String envTypes, String telephone,
			String address, byte[] image) {
		super();
		this.envId = envId;
		this.city = city;
		this.name = name;
		this.animalTypes = animalTypes;
		this.envTypes = envTypes;
		this.telephone = telephone;
		this.address = address;
		this.image = image;
	}


	public FriendlyEnv() {
		super();
	}


	public int getEnvId() {
		return envId;
	}

	public void setEnvId(int envId) {
		this.envId = envId;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAnimalTypes() {
		return animalTypes;
	}


	public void setAnimalTypes(String animalTypes) {
		this.animalTypes = animalTypes;
	}


	public String getEnvTypes() {
		return envTypes;
	}


	public void setEnvTypes(String envTypes) {
		this.envTypes = envTypes;
	}


	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public byte[] getImage() {
		return image;
	}


	public void setImage(byte[] image) {
		this.image = image;
	}

	public String[] getAnimalTypesArr() {
		return animalTypesArr;
	}

	public void setAnimalTypesArr(String[] animalTypesArr) {
		this.animalTypesArr = animalTypesArr;
	}


	@Override
	public String toString() {
		return "FriendlyEnv [envId=" + envId + ", city=" + city + ", name=" + name + ", animalTypes=" + animalTypes
				+ ", envTypes=" + envTypes + ", telephone=" + telephone + ", address=" + address + ", image="
				+ Arrays.toString(image) + "]";
	}

	public MultipartFile getFriendlyEnvImage() {
		return friendlyEnvImage;
	}


	public void setFriendlyEnvImage(MultipartFile friendlyEnvImage) {
		this.friendlyEnvImage = friendlyEnvImage;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	@Override
	public int compareTo(FriendlyEnv o) {
		// TODO Auto-generated method stub
		return this.envId - o.envId;
	}


	
}
	