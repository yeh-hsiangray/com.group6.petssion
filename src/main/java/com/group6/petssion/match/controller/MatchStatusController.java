package com.group6.petssion.match.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.bean.MatchStatus;
import com.group6.petssion.match.service.MatchStatusService;

@RestController
@RequestMapping("/match")
public class MatchStatusController {

	@Autowired
	private MatchStatusService matchStatusService;
	
	

	/**
	 *  @興趣id抓使用者
	 * 
	 */
	@GetMapping("/selectHobby/getUsers")
	public @ResponseBody Hobby getHobby(@RequestParam Integer id, 
			HttpServletResponse response) {
		Hobby hobby = null;
		Optional<Hobby> optional =  matchStatusService.getUsersById(id);
		if (optional.isPresent()) {
			hobby = optional.get();
			System.out.println(id);
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		return hobby;
	}
	
	
	/**
	 *  @興趣下拉選單
	 */
	@GetMapping("/_05/allHobbys")
	public ResponseEntity<List<Hobby>>  allHobbys()  {
		List<Hobby> list =  matchStatusService.getHobby();
		
		ResponseEntity<List<Hobby>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}
	

	
	/**
	 *  @return 
	 * @Lovebutton寫入
	 *  @配對狀態資料表 
	 */	
//	@PostMapping("/save")
//	public MatchStatus setMatchStatusByUserB(
//		   @RequestParam (required=false)String user_A,
//		   @RequestParam  (required=false)String user_B,
//		   @RequestParam  (required=false)String status) {
//		Map<String, String> map = new HashMap<>();
//
//		
//		map.put("user_A",user_A);
//		map.put("user_B",user_B);
//		map.put("status",status);
// 		ResponseEntity<Map<String, String>> re = new ResponseEntity<>(map, HttpStatus.OK);
// 		System.out.println(re);
//		return matchStatusService.save(re);
//	}
	
	@PostMapping("/save")
	public void setMatchStatusByUserB(
			@RequestParam (required=false) Integer user_A,
			@RequestParam  (required=false) Integer user_B,
			@RequestParam  (required=false) Integer status) {
		
		MatchStatus matchstatus = new MatchStatus();
	
		matchstatus.setUser_A(user_A);
		matchstatus.setUser_B(user_B);
		matchstatus.setStatus(status);
		
		 matchStatusService.save(matchstatus);		
		
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
