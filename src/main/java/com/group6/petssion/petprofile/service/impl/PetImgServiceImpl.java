 package com.group6.petssion.petprofile.service.impl;

import java.util.List;
import java.util.Optional;

import javax.persistence.NoResultException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.Pet;
import com.group6.petssion.bean.PetImg;
import com.group6.petssion.petprofile.dao.impl.PetImgDaoImpl;
import com.group6.petssion.petprofile.service.PetImgService;
import com.group6.petssion.repository.PetImgRepository;
@Service
@Transactional(rollbackFor=Exception.class)
public class PetImgServiceImpl implements PetImgService {
	@Autowired
	PetImgRepository petImgDao;
	@Autowired
	PetImgDaoImpl petImgDao2;
	
	
	@Override
	public PetImg savePetImg(PetImg petImg) {
		return petImgDao.save(petImg);
	}

	@Override
	public void delete(Integer id) {
		petImgDao.deleteById(id);
	}

	@Override
	public PetImg get(Integer id) {
		Optional<PetImg> optional = petImgDao.findById(id);
		PetImg petImg = null;
		if (optional.isPresent()) {
			petImg = optional.get();
		} else {
			throw new RuntimeException("PetImg(id=" + id + ")不存在");
		}
		return petImg;
	}
	@Transactional
	@Override
	public void updatePetImg(PetImg petImg) {
		petImgDao2.updatePetImg(petImg);
	}

	@Override
	public List<PetImg> finAllPetImg() {
		return petImgDao.findAll();
	}

	@Override
	public List<Integer> findPetImgIdByPetId(int petId) {
		return petImgDao2.findPetImgIdByPetId(petId);
	}
	public boolean isPetImgExist(Integer id) {
		boolean exist = false;
		try {
		Optional<PetImg> optional = petImgDao.findById(id);
		if (optional.isPresent()) {
			exist=true;
		}
		}catch(NoResultException e) {
			;
		}
		return exist;
	}
}
