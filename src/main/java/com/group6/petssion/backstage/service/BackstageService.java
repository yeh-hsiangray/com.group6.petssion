package com.group6.petssion.backstage.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.group6.petssion.backstage.bean.BackendUserBeanInterface;
import com.group6.petssion.backstage.bean.BackstageBeanInterface;
import com.group6.petssion.bean.Users;
import com.group6.petssion.repository.AAndPRepository;
import com.group6.petssion.repository.UsersRepository;
@Service
public class BackstageService {
	@Autowired
	UsersRepository user;
	@Autowired
	AAndPRepository aAndP;

	public Page<BackendUserBeanInterface> select(Map<String, Object> map) {
		Pageable pageable = PageRequest.of(Integer.valueOf(map.get("index").toString()), 5,
				Sort.by(Sort.Direction.ASC, "id"));
		return user.findByName((String) map.get("name"), pageable);
	}

	public int updataManager(Map<String, Object> map) {
		Optional<Users> OptionalUser = user.findById(Integer.valueOf(map.get("id").toString()));
		Users users1 = OptionalUser.get();
		users1.setManager(Integer.valueOf(map.get("manager").toString()));
		user.save(users1);
		return 1;
	}
	public int updataBlockade(Map<String, Object> map) {
		Optional<Users> OptionalUser = user.findById(Integer.valueOf(map.get("id").toString()));
		Users users1 = OptionalUser.get();
		users1.setBlockade(Integer.valueOf(map.get("blockade").toString()));
		user.save(users1);
		return 1;
	}
	public Map<String, Object> byYear(String thisYy){
		List<BackstageBeanInterface> thisYear=new ArrayList<>();
		List<BackstageBeanInterface> lastYear=new ArrayList<>();
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
			thisYear.add(user.findByYearOrMonth(i+"月",thisDate)) ;
			lastYear.add(user.findByYearOrMonth(i+"月", lastDate));
		}
		Map<String, Object> map=new HashMap<>();
		map.put("thisYear", thisYear);
		map.put("lastYear", lastYear);
		return map;
	}
	public Map<String, Object> byMonth(String thisYy,String mm){
		List<BackstageBeanInterface> thisYear=new ArrayList<>();
		List<BackstageBeanInterface> lastYear=new ArrayList<>();
		int lastYy = (Integer.valueOf(thisYy)-1);
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
			thisYear.add(user.findByYearOrMonth(i+"日",thisDate)) ;
			lastYear.add(user.findByYearOrMonth(i+"日", lastDate));
		}
		Map<String, Object> map=new HashMap<>();
		map.put("thisYear", thisYear);
		map.put("lastYear", lastYear);
		return map;
	}
	
	public List<BackstageBeanInterface> selectJob(){
		return user.findJob();
	}
	
	public String downloadByYear(String thisYy){
		String body = "註冊時間,註冊人數,去年同期比對增長\r\n";
		List<BackstageBeanInterface> thisYear=new ArrayList<>();
		List<BackstageBeanInterface> lastYear=new ArrayList<>();
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
			thisYear.add(user.findByYearOrMonth(i+"月",thisDate)) ;
			lastYear.add(user.findByYearOrMonth(i+"月", lastDate));
		}
		for(int i=0;i<thisYear.size();i++) {
			body+=thisYear.get(i).getMonth()+","+thisYear.get(i).getNumeral()+","+(thisYear.get(i).getNumeral()-lastYear.get(i).getNumeral())+"\r\n";
		}
		return body;
	}
	public String downloadByMonth(String thisYy,String mm){
		String body = "註冊時間,註冊人數,去年同期比對增長\r\n";
		List<BackstageBeanInterface> thisYear=new ArrayList<>();
		List<BackstageBeanInterface> lastYear=new ArrayList<>();
		int lastYy = (Integer.valueOf(thisYy)-1);
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
			thisYear.add(user.findByYearOrMonth(i+"日",thisDate)) ;
			lastYear.add(user.findByYearOrMonth(i+"日", lastDate));
		}
		for(int i=0;i<thisYear.size();i++) {
			body+=thisYear.get(i).getMonth()+","+thisYear.get(i).getNumeral()+","+(thisYear.get(i).getNumeral()-lastYear.get(i).getNumeral())+"\r\n";
		}
		return body;
	}
	public String downloadByJob(){
		String body = "職業名,人數\r\n";
		 List<BackstageBeanInterface> data = user.findJob();
		 for(int i=0;i<data.size();i++) {
			 body+=data.get(i).getJobName()+","+data.get(i).getNumeral()+"\r\n";
		 }
		return body ;
	}
}