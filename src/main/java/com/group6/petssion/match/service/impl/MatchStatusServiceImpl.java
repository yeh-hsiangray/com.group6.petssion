package com.group6.petssion.match.service.impl;

import java.util.ArrayList;

import java.util.Base64;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;

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
	MatchStatusRepository matchStatusRepository;

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
			List<MatchStatus> statusOptional = matchStatusRepository.findByUserB(users.getId());
			if (statusOptional.isEmpty()) {
//				System.out.println(users.getName());
				/* show使用者圖片 */
				if (!users.getUsersImg() .isEmpty()) {
//				System.out.println(users.getUsersImg().get(0)==null);					
					byte[] UserImg = new UsersController().blobToByteArray(users.getUsersImg().get(0).getUsersImage());
//				System.out.println(Base64.getMimeEncoder().encodeToString(img));
					users.setbase64UserImg(Base64.getMimeEncoder().encodeToString(UserImg));
					users.setUsersImg(null);
				}
				/* show寵物圖片 */
				if (!users.getPet().isEmpty()) {
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
	 * @Get
	 * @使用者B欄登入時收到使用A交友通知"1"為喜歡
	 * 
	 */
	@Override
	public List<Users> getlikeNotify(Integer userBid) {
		List<MatchStatus> userAStatusList = matchStatusRepository.findByUserB(userBid);
		List<Users> loveListUserA = new ArrayList<Users>();
		for (MatchStatus userStatus : userAStatusList) { // 遍歷狀態表的使用者A
			if (userStatus.getStatus().equals(1)) {
				Optional<Users> usersOptional = usersRepository.findById(userStatus.getUserA());
				Integer id = userStatus.getId();
//				System.out.println(id);
				loveListUserA.add(usersOptional.get());
				if (!usersOptional.get().getUsersImg().isEmpty()) {
					byte[] UserImg = new UsersController().blobToByteArray(usersOptional.get().getUsersImg().get(0).getUsersImage());
					usersOptional.get().setbase64UserImg(Base64.getMimeEncoder().encodeToString(UserImg));
					usersOptional.get().setUsersImg(null);
				}
				if (!usersOptional.get().getPet().isEmpty()) {
					byte[] PetImg = new PetController()
							.blobToByteArray(usersOptional.get().getPet().get(0).getPetImg().get(0).getPetImage());
					usersOptional.get().getPet().get(0).setBase64PetImg(Base64.getMimeEncoder().encodeToString(PetImg));
					usersOptional.get().getPet().get(0).setPetImg(null);
				}
			}
		}
		return loveListUserA;
	}
//	/*回傳matchStatus的Id*/
//	@Override
//	public Integer getlikeNotifyStatusId(Integer userBid) {
//		List<MatchStatus> userAStatusList = matchStatusRepository.findByUserB(userBid);
//		Integer id=null;
//		for (MatchStatus userStatus : userAStatusList) { 
//			if (userStatus.getStatus().equals(1)) {
//				 id = userStatus.getId();
//				System.out.println(id);
//			}
//		}
//		return id;
//	}
	

	/**
	 * @使用者A登入時收到使用者B的回覆"3"為互相喜歡
	 * 
	 */
	
	@Override
	public List<Users> eachLike(Integer UserAid) {
		List<MatchStatus> userBStatusList = matchStatusRepository.findByUserA(UserAid);
		List<Users> loveListUserB = new ArrayList<Users>();
		for (MatchStatus userStatus : userBStatusList) {
			if (userStatus.getStatus().equals(3)) {
				Optional<Users> usersOptional = usersRepository.findById(userStatus.getUserB());
				loveListUserB.add(usersOptional.get());
				if (!usersOptional.get().getUsersImg().isEmpty()) {
					byte[] UserImg = new UsersController().blobToByteArray(usersOptional.get().getUsersImg().get(0).getUsersImage());
					usersOptional.get().setbase64UserImg(Base64.getMimeEncoder().encodeToString(UserImg));
					usersOptional.get().setUsersImg(null);
				}
				if (!usersOptional.get().getPet().isEmpty()) {
					byte[] PetImg = new PetController()
							.blobToByteArray(usersOptional.get().getPet().get(0).getPetImg().get(0).getPetImage());
					usersOptional.get().getPet().get(0).setBase64PetImg(Base64.getMimeEncoder().encodeToString(PetImg));
					usersOptional.get().getPet().get(0).setPetImg(null);
				}
			}
		}
		return loveListUserB;
	}

	/**
	 * @使用者A登入時收到使用者B的回覆"4"為使用者單方不喜歡
	 * 
	 */
	@Override
	public List<Users> oneSideLove(Integer UserAid) {
		List<MatchStatus> userBStatusList = matchStatusRepository.findByUserA(UserAid);
		List<Users> loveListUserB = new ArrayList<Users>();
		for (MatchStatus userStatus : userBStatusList) {
			if (userStatus.getStatus().equals(4)) {
				Optional<Users> usersOptional = usersRepository.findById(userStatus.getUserB());
				loveListUserB.add(usersOptional.get());
				if (!usersOptional.get().getUsersImg().isEmpty()) {
					byte[] UserImg = new UsersController().blobToByteArray(usersOptional.get().getUsersImg().get(0).getUsersImage());
					usersOptional.get().setbase64UserImg(Base64.getMimeEncoder().encodeToString(UserImg));
					usersOptional.get().setUsersImg(null);
				}
				if (!usersOptional.get().getPet().isEmpty()) {
					byte[] PetImg = new PetController()
							.blobToByteArray(usersOptional.get().getPet().get(0).getPetImg().get(0).getPetImage());
					usersOptional.get().getPet().get(0).setBase64PetImg(Base64.getMimeEncoder().encodeToString(PetImg));
					usersOptional.get().getPet().get(0).setPetImg(null);
				}
			}
		}
		return loveListUserB;
	}
	/**
	 * @使用者B欄登入時收到使用者A欄的交友通知作回覆"3"為互相喜歡,"4"為使用者單方不喜歡
	 * 
	 */

	@Override
	public void saveReplyStatus(MatchStatus matchStatus) {
		 
		Integer status=matchStatus.getStatus();
		Integer userA=matchStatus.getUserA();
		Integer userB=matchStatus.getUserB();
		MatchStatus getUserAAndUserB=matchStatusRepository.findByUserAAndUserB(userA,userB);
		System.err.println(getUserAAndUserB);
		getUserAAndUserB.setStatus(status);
		
	}

	
	

}
