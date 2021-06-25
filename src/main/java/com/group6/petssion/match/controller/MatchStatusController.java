package com.group6.petssion.match.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.group6.petssion.bean.Hobby;
import com.group6.petssion.match.service.MatchStatusService;
import com.group6.petssion.repository.HobbyRepository;

@RestController
public class MatchStatusController {

	@Autowired
	private MatchStatusService matchStatusService;
	@Autowired
	private HobbyRepository hobbyRepository;


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
	
	@GetMapping("/match/{id}")
    public Hobby getHobby(@PathVariable int id) {
        if(hobbyRepository.findById(id).isPresent()) {
            return hobbyRepository.findById(id).get();
        
        
        
        }else return null;
    }
	
}
