package com.infotran.springboot.bean;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "PetImg")
public class PetImg {
	@Id
	@Column(name = "id", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String fileName;
	private Blob petImage;
	@Column(name = "fk_pet_id")
	@Transient
	private Integer petId;
	@ManyToOne
	@JoinColumn(name = "fk_pet_id")
	private Pet pet;

	public PetImg() {
	}

	public PetImg(Integer id, Timestamp admissionTime, String fileName, Blob petImage, Integer petId, Pet pet) {
		super();
		this.id = id;
		this.fileName = fileName;
		this.petImage = petImage;
		this.petId = petId;
		this.pet = pet;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Blob getPetImage() {
		return petImage;
	}

	public void setPetImage(Blob petImage) {
		this.petImage = petImage;
	}

	public Integer getPetId() {
		return petId;
	}

	public void setPetId(Integer petId) {
		this.petId = petId;
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	
}
