package com.group6.petssion.match.service.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Users;
import com.group6.petssion.bean.UsersImg;
import com.group6.petssion.match.service.MatchStatusService;
import com.group6.petssion.repository.HobbyRepository;
import com.group6.petssion.repository.MatchStatusRepository;
import com.group6.petssion.repository.UsersImgRepository;
import com.group6.petssion.repository.UsersRepository;

@Transactional
@Service
@EnableTransactionManagement
public class MatchStatusServiceImpl implements MatchStatusService {

	@Autowired
	private UsersRepository usersRepository;

	@Autowired
	private HobbyRepository hobbyRepository;

	@Autowired
	private MatchStatusRepository matchStatusRepository;

	@Autowired
	private UsersImgRepository usersImgRepository;

	
	@Autowired 
	ServletContext context;
	
	/**
	 *  @興趣id抓使用者
	 * 
	 */
	@Override
	public Optional<Hobby> getUsersById(Integer id) {
		// 檔案存檔 users
		Optional<Hobby> hobbyOptional = hobbyRepository.findById(id);
		List<Users> userList = hobbyOptional.get().getUsers();	
		Users user = userList.get(userList.size()-1);
		List<UsersImg> imgList = user.getUsersImg();
		byte[] img=imgList.get(0).getUsersImage();
		// bytes = byte[]
		 
//		  Path path = Paths.get(context.getRealPath("/Sources/img/profile.png")).getParent();
		  Path path = Paths.get(Paths.get(context.getRealPath("/")).getParent().toAbsolutePath().toString(), "resources","static","img", "profile.png");				  
		  System.out.println(path.toAbsolutePath());
		  if(Files.exists(path)){
			  System.out.println("----------------------");
		  }
		  try {
			Files.write(path, img);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return hobbyOptional;
	}
	
	
	/**
	 *  @興趣下拉選單
	 */
	@Override
	public List<Hobby> getHobby() {

		return hobbyRepository.findAll();
	}
	
	/**
	 *  @Lovebutton寫入
	 *  @配對狀態資料表 
	 */	
	@Override
	public MatchStatus save(MatchStatus matchstatus) {
		
		return matchStatusRepository.save(matchstatus);
		
	}
	
	


	@Override
	public List<Hobby> getUsers() {
		// TODO Auto-generated method stub
		return null;
	}

}