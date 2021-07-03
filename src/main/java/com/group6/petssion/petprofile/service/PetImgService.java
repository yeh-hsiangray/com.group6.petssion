package com.group6.petssion.petprofile.service;

import java.util.List;

import com.group6.petssion.bean.PetImg;

public interface PetImgService {
	PetImg savePetImg(PetImg petImg);
	void delete(Integer id);
	PetImg get(Integer id);
	void updatePetImg(PetImg petImg);
	List<PetImg> finAllPetImg();
	List<Integer> findPetImgIdByPetId(int petId);
//	List<String> delPetImgByPetImgId(int imgId);
//	void delPetImgByPetImgId(int imgId);
}
