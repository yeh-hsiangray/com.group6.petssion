package com.group6.petssion.match.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
			HttpSession session) {
	
		int sessionUserId =(int)session.getAttribute("userId");//抓取userId
//		int sessionUserId =2;
		List<Users> userList =  matchStatusService.getUsersByHobbyId(id);
		Users user=userService.get(sessionUserId);
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
			HttpSession session) {
		
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
		
		  int sessionUserId =(int)session.getAttribute("userId");//抓取userId
//		Integer sessionUserId=2;
		matchstatus.setUserA(sessionUserId);
		
		System.out.println(sessionUserId);
		matchStatusService.save(matchstatus);		
		
	}
	
	/**@Get
	 * 
	 * @使用者A欄登入時收到使用者B欄的回覆"3"為互相喜歡
	 */
	@GetMapping("/signInNotifyEachLike")
	public @ResponseBody List<Users> signInNotifyEachLike(HttpSession session){	
		
		int sessionUserId =(int)session.getAttribute("userId");//抓取userId
//		int sessionUserId =22;
//		List<Users> oneSideLove= matchStatusService.oneSideLove(SessionUserId);	
//		List<Users> eachLike= matchStatusService.eachLike(SessionUserId);	
//		ArrayList<Users> resultList = new ArrayList<Users>();
//		resultList.addAll(oneSideLove);
//		resultList.addAll(eachLike);
//		return resultList;
		return matchStatusService.eachLike(sessionUserId);
	}
	
	/**@Get
	 * @使用者A欄登入時收到使用者B欄的回覆"4"為使用者單方不喜歡
	 * 
	 */
	@GetMapping("/signInNotifyOneSideLove")
	public @ResponseBody List<Users> signInNotifyOneSideLove(HttpSession session){	
		
		int sessionUserId =(int)session.getAttribute("userId");//抓取userId
//		int sessionUserId =22;
		// 阻擋 倒回登入	
		return matchStatusService.oneSideLove(sessionUserId);
	}
	
	/**@Get
	 * @使用者B欄登入時收到使用A交友通知"1"為喜歡
	 * 
	 */
	@GetMapping("/signInNotifyConfirm")
	public @ResponseBody List<Users> signInNotifyConfirm(HttpSession session){	
		
		int sessionUserId =(int)session.getAttribute("userId");//抓取userId
//		int sessionUserId =22;
		System.out.println(sessionUserId);
		// 阻擋 倒回登入	
		return matchStatusService.getlikeNotify(sessionUserId);
	}

	
	
	
	/**
	 * @更新回覆狀態 
	 * @使用者B欄登入時收到使用者A欄的交友通知作回覆"3"為互相喜歡,"4"為使用者單方不喜歡
	 */
	@PostMapping("/updateMatchStatus")
	  public void updateMatchStatus(
			  @RequestBody MatchStatus matchStatus,HttpSession session) {
		
		
	    int sessionUserId =(int)session.getAttribute("userId");//抓取userId
	   
//		Integer sessionUserId=22;
		matchStatus.setUserB(sessionUserId);
		matchStatusService.saveReplyStatus(matchStatus);
		   
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

	
}
