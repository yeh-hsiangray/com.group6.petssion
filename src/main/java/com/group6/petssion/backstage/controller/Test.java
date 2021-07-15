package com.group6.petssion.backstage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.group6.petssion.backstage.bean.BackstageBeanInterface;
import com.group6.petssion.repository.UsersRepository;

@RestController
@RequestMapping("/test")
public class Test {

	@Autowired
	private UsersRepository ur;
	@GetMapping
	public Map<String, Object> test(){
		List<BackstageBeanInterface> thisYear=new ArrayList<>();
		List<BackstageBeanInterface> lastYear=new ArrayList<>();
		String thisYy ="2021";
		int lastYy = (Integer.valueOf(thisYy)-1);
		for (int i = 1; i < 13; i++) {
			String thisDate;
			String lastDate;
			if (i < 10) {
				thisDate = thisYy + "-" + "0" + i;
				lastDate = lastYy + "-" + "0" + i;
				
			} else {
				thisDate = thisYy + "-" + i;
				lastDate = lastYy + "-" + i;
			}
			thisYear.add(ur.findByMonth(i+"月",thisDate)) ;
			lastYear.add(ur.findByMonth(i+"月", lastDate));
		}
		Map<String, Object> map=new HashMap<>();
		map.put("thisYear", thisYear);
		map.put("lastYear", lastYear);
		return map;
	}
	
	@GetMapping("/1")
	public Map<String, Object> test1(){
		List<BackstageBeanInterface> thisYear=new ArrayList<>();
		List<BackstageBeanInterface> lastYear=new ArrayList<>();
		String thisYy ="2021";
		int lastYy = (Integer.valueOf(thisYy)-1);
		String mm = "07";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date date = null;
			try {
				date = sdf.parse(thisYy + "-" + (Integer.valueOf(mm) + 1) + "-" + "0");
			} catch (NumberFormatException | ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		cal.setTime(date);
		for(int i=1;i<=cal.get(Calendar.DATE);i++) {
			String thisDate;
			String lastDate;
			if (i < 10) {
				thisDate = thisYy +"-"+mm+ "-" + "0" + i;
				lastDate = lastYy +"-"+mm+ "-" + "0" + i;	
			} else {
				thisDate = thisYy +"-"+mm+ "-" + i;
				lastDate = lastYy +"-"+mm+"-" + i;
			}
			System.out.println(thisDate);
			thisYear.add(ur.findByMonth(i+"日",thisDate)) ;
			lastYear.add(ur.findByMonth(i+"日", lastDate));
		}
		Map<String, Object> map=new HashMap<>();
		map.put("thisYear", thisYear);
		map.put("lastYear", lastYear);
		return map;
	}
	@GetMapping("/2")
	public List<BackstageBeanInterface> selectJob() {
		return ur.findJob();
	}
}
