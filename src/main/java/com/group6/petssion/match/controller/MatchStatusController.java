package com.group6.petssion.match.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.bean.Users;
import com.group6.petssion.match.service.MatchStatusService;
import com.group6.petssion.member.service.UserService;

@RestController
@RequestMapping("/match")
public class MatchStatusController {

	@Autowired
	private MatchStatusService matchStatusService;
	
	@Autowired
	private UserService userService;
	

	/**
	 * @興趣id抓使用者
	 * @排除登入者之資料
	 */
	@GetMapping("/selectHobby/getUsers")
	public @ResponseBody List<Users> getUserWithoutSignInId(@RequestParam Integer id, 			
			HttpServletResponse response,HttpServletRequest request) {
//		HttpSession session=request.getSession();
//		int SessionUserId =(int)session.getAttribute("userId");//抓取userId
		int SessionUserId =22;
		List<Users> userList =  matchStatusService.getUsersByHobbyId(id);
		Users user=userService.get(SessionUserId);
//		System.out.println(user);
		userList.remove(user);
	
		return userList;
	}
	
	
	/**
	 *  @興趣下拉選單
	 */
	@GetMapping("/_05/allHobbys")
	public @ResponseBody List<Hobby>  allHobbys()  {
		List<Hobby> list =  matchStatusService.getHobby();
		
//		List<Hobby> re = new ResponseEntity<>(list, HttpStatus.OK);
		return  matchStatusService.getHobby();
	}
	

	
	/**
	 *  
	 * @button寫入配對狀態資料表
	 *  
	 */	
	@PostMapping("/save")
	public void setMatchStatusByUserB(
			@RequestParam  (required=false) Integer userB,
			@RequestParam  (required=false) Integer status,
			HttpServletRequest request) {
		
		MatchStatus matchstatus = new MatchStatus();
	
		matchstatus.setUserB(userB);
		matchstatus.setStatus(status);
		/*springboot session @Autowrited [值不是無中生有 自動傳入]*/
//		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
//		HttpSession session = request.getSession();
//		Integer userId =(Integer) session.getAttribute("userId");
//		Integer userId=22;
//		Enumeration<String> names = session.getAttributeNames();
//        while (names.hasMoreElements()) {
//            String name = names.nextElement();
//            
//            System.out.print(name);
//        }        
//		HttpSession session=request.getSession();
//		  int SessionUserId =(int)session.getAttribute("userId");//抓取userId
		Integer SessionUserId=2;
		matchstatus.setUserA(SessionUserId);
		
		System.out.println(SessionUserId);
		matchStatusService.save(matchstatus);		
		
	}
	
	/**	  
	 * @使用者登入時收到交友通知
	 *  
	 */	
	@GetMapping("/signInNotify")
	public @ResponseBody List<String> getMatchStatus(@RequestParam Integer userAid){			
		return matchStatusService.getStatusByUsersId(userAid);			
	}

	
	//@GetMapping("/match/{id}")
//    public Hobby getHobby(@PathVariable int id) {
//        if(hobbyRepository.findById(id).isPresent()) {
//            return hobbyRepository.findById(id).get();
//        
//        
//	@GetMapping("/match/{id}")
//  public List<Users> getHobby(@PathVariable int id) {
//      if(hobbyRepository.findById(id).isPresent()) {
//      Hobby hobby = hobbyRepository.findById(id).get();
//      	
//      	return hobby.getUsers();
//      
//      
//      
//      }else return null;
//  }
	
	/*
	 * @GetMapping("/selectHobby/getUsers/{id}") public @ResponseBody Hobby
	 * getHobby(@PathVariable("id") Integer hobbyId, HttpServletResponse response) {
	 * Hobby hobby = null; Optional<Hobby> optional =
	 * matchStatusService.getUsersById(hobbyId); if (optional.isPresent()) { hobby =
	 * optional.get();
	 * 
	 * } else { response.setStatus(HttpServletResponse.SC_NOT_FOUND); } return
	 * hobby; }
	 */
//        
//        }else return null;
//    }
	
//	@GetMapping(value = "/selectHobby/allHobbys", produces = { "application/json; charset=UTF-8" })
//	public @ResponseBody List<Hobby> getAllHobbys() {
//		List<Hobby> hobbys = matchStatusService.getAllHobby();
//
//		return hobbys;
//	}
//	
}
