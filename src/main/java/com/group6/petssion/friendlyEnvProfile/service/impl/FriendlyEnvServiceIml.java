package com.group6.petssion.friendlyEnvProfile.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.FriendlyEnv;
import com.group6.petssion.friendlyEnvProfile.dao.impl.FriendlyEnvDaoImpl;
import com.group6.petssion.friendlyEnvProfile.repository.FriendlyEnvRepository;
import com.group6.petssion.friendlyEnvProfile.service.FriendlyEnvService;

@Service
@Transactional
public class FriendlyEnvServiceIml implements FriendlyEnvService {
	@Autowired
	FriendlyEnvRepository friendlyEnvDao;

	@Autowired
	FriendlyEnvDaoImpl friendlyEnvDao2;

	@Override
	public FriendlyEnv save(FriendlyEnv friendlyEnv) {
		// TODO Auto-generated method stub
		if (friendlyEnv == null) {
			System.out.println("image is null");
		}
		return friendlyEnvDao.save(friendlyEnv);
	}

	@Override
	public void delete(Integer id) {
		friendlyEnvDao.deleteById(id);

	}

	@Override
	public FriendlyEnv get(Integer id) {
		Optional<FriendlyEnv> friendlyEnv = friendlyEnvDao.findById(id);
		if (friendlyEnv.isPresent())
			return friendlyEnv.get();
		return null;
	}

	@Override
	public void update(FriendlyEnv friendlyEnv) {
		friendlyEnvDao2.updateFriendlyEnv(friendlyEnv);
	}

	@Override
	public List<FriendlyEnv> getAllFriendlyEnvs() {
		return friendlyEnvDao.findAll();
	}

	@Override
	public List<FriendlyEnv> getEnvByCityAndATypes(String city, String animalTypes) {
		List<FriendlyEnv> list1 = new ArrayList<>();
		String[] animalT = animalTypes.split(",");

		if (animalT.length > 1) {
			list1 = friendlyEnvDao.findByCityAndAnimalTypes(city, animalTypes);
		} else {
			for (int i = 0; i < animalT.length; i++) {
				list1.addAll(friendlyEnvDao.findByCityAndAnimalTypes(city, animalT[i]));
			}
		}

		Set<FriendlyEnv> set = new TreeSet<>(list1);
		List<FriendlyEnv> finalList = new ArrayList<>(set);
//		Collections.sort(finalList);
//		return new ArrayList<>(finalList);
		return finalList;
	}

	@Override
	public List<String> getCityList() {
		List<String> cityList = friendlyEnvDao.getCityList();
		System.out.println("CityList: " + cityList);
		return cityList;
	}

}
