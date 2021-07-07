package com.group6.petssion.match.service.impl;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Pet;
import com.group6.petssion.bean.Users;
import com.group6.petssion.match.service.MatchStatusService;
import com.group6.petssion.member.controller.UsersController;
import com.group6.petssion.petprofile.controller.PetController;
import com.group6.petssion.repository.HobbyRepository;
import com.group6.petssion.repository.MatchStatusRepository;
import com.group6.petssion.repository.UsersRepository;

@Transactional
@Service
@EnableTransactionManagement
public class MatchStatusServiceImpl implements MatchStatusService {

	@Autowired
	private HobbyRepository hobbyRepository;

	@Autowired
	private MatchStatusRepository matchStatusRepository;

	@Autowired
	private UsersRepository usersRepository;

	@Autowired
	ServletContext context;

	/**
	 * @興趣id抓使用者資料 及寵物資料
	 * 
	 */
	@Override
	public List<Users> getUsersByHobbyId(Integer id) {

		Optional<Hobby> hobbyOptional = hobbyRepository.findById(id);
		List<Users> userList = hobbyOptional.get().getUsers();

		/* 判斷matchStatus不為空加入暫存.前端秀暫存 */
		List<Users> userNoStatus = new ArrayList<Users>();
		for (Users users : userList) {
//			System.out.println(userList);
			Optional<MatchStatus> statusOptional = matchStatusRepository.findByUserB(users.getId());
			if (statusOptional.isEmpty()) {
//				System.out.println(users.getName());
				/* show使用者圖片 */
				if (users.getUsersImg() != null) {
//				System.out.println(users.getUsersImg().get(0)==null);					
					byte[] UserImg = new UsersController().blobToByteArray(users.getUsersImg().get(0).getUsersImage());
//				System.out.println(Base64.getMimeEncoder().encodeToString(img));
					users.setbase64UserImg(Base64.getMimeEncoder().encodeToString(UserImg));
					users.setUsersImg(null);
				}
				/* show寵物圖片 */
				if (users.getPet().get(0).getPetImg() != null) {
//					System.out.println(users.getUsersImg().get(0)==null);									
					byte[] PetImg = new PetController()
							.blobToByteArray(users.getPet().get(0).getPetImg().get(0).getPetImage());
//					System.out.println(Base64.getMimeEncoder().encodeToString(PetImg));
					users.getPet().get(0).setBase64PetImg(Base64.getMimeEncoder().encodeToString(PetImg));
					users.getPet().get(0).setPetImg(null);
				}
				userNoStatus.add(users);

			}
		}
//		Users user = userList.get(userList.size()-1);
//		Users user = userNoStatus.get(userNoStatus.size() - 1);
////		List<UsersImg> imgList = user.getUsersImg();
////		byte[] img = new byte[] {};
////		if (!imgList.isEmpty()) {
////			img = imgList.get(0).getUsersImage();
////		}
//////		  Path path = Paths.get(context.getRealPath("/Sources/img/profile.png")).getParent();
////		Path path = Paths.get(Paths.get(context.getRealPath("/")).getParent().toAbsolutePath().toString(), "resources",
////				"static", "img", "profile.png");
////		System.out.println(path.toAbsolutePath());
////		if (Files.exists(path)) {
////			System.out.println("----------------------");
////		}
////		try {
////			Files.write(path, img);
////		} catch (IOException e) {
////			e.printStackTrace();
////		}
//	
//		System.out.println(Base64.getMimeEncoder().encodeToString(img));

		return userNoStatus;
	}

	/**
	 * @興趣下拉選單
	 * 
	 */
	@Override
	public List<Hobby> getHobby() {

		return hobbyRepository.findAll();
	}

	/**
	 * @button寫入配對狀態資料表
	 * 
	 */
	@Override
	public MatchStatus save(MatchStatus matchstatus) {

		return matchStatusRepository.save(matchstatus);

	}

	/**
	 * @使用者登入時收到交友通知
	 * 
	 */
	@Override
	public List<String> getStatusByUsersId(Integer UserAid) {

		List<MatchStatus> statusList = matchStatusRepository.findByUserA(UserAid);// 傳入使用者AID 撈出狀態表陣列
		List<String> userBNameList = new ArrayList<String>();
		for (MatchStatus status : statusList) { // 遍歷所有狀態表找出Status為1
			System.out.println("2");
			Integer love = status.getStatus();
			System.out.println("3");
			if (love.equals(1)) { // Status為1 ("喜歡")
				Integer userBId = status.getUserB();
				System.out.println("4");
				Optional<Users> usersOptional = usersRepository.findById(userBId);
				System.out.println("5");
				if (usersOptional.isPresent()) {
					Users userB = usersOptional.get();
					System.out.println("6");
					String userBName = userB.getName();
					userBNameList.add(userBName);
					System.out.println("7");
				} else {
					throw new RuntimeException("User(id=" + userBId + ")不存在");
				}
			}
		}
		return userBNameList;
	}

//	@Override
//	public MatchStatus get(Integer id) {
//		Optional<Users> optional = userDao.findById(id);
//		Users user = null;
//		if (optional.isPresent()) {
//			user = optional.get();
//		} else {
//			throw new RuntimeException("User(id=" + id + ")不存在");
//		}
//		return user;
//	}

}