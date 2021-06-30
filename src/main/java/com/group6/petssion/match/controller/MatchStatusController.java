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
	

	
	@GetMapping("/selectHobby/getUsers")
	public @ResponseBody Hobby getHobby(@RequestParam Integer id, 
			HttpServletResponse response) {
		Hobby hobby = null;
		Optional<Hobby> optional =  matchStatusService.getUsersById(id);
		if (optional.isPresent()) {
			hobby = optional.get();
			
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		return hobby;
	}
	
	@GetMapping("/_05/allHobbys")
	public ResponseEntity<List<Hobby>>  allHobbys()  {
		List<Hobby> list =  matchStatusService.getHobby();
		ResponseEntity<List<Hobby>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}
	

	@PostMapping("/save")
	public @ResponseBody MatchStatus setMatchStatusByUserB(
			@RequestParam int user_A,
			@RequestParam int user_B,
			@RequestParam int status) {
	
		MatchStatus match=new MatchStatus();
		match.setUser_A(user_A);
		match.setUser_B(user_B);
		match.setStatus(status);
		
		return matchStatusService.save(match);
		
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
