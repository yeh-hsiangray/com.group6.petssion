package com.group6.petssion.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.group6.petssion.bean.PetImg;

@Repository
public interface PetImgDao {
	PetImg findByPrimaryKey(int key);
	
	PetImg findByPetId(int petId);

	int savePetImg(PetImg petImg);

	void updatePetImg(PetImg petImg);

	void deletePetImgByPrimaryKey(int key);

	List<PetImg> findAllPetImg();

	void deleteAllPetImg();

	public boolean isPetImgExist(PetImg petImg);
	
	public String checkPetImgId(String PetImgId);
}
