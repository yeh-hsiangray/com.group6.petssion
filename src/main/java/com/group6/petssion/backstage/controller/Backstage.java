package com.group6.petssion.backstage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group6.petssion.backstage.bean.BackendUserBeanInterface;
import com.group6.petssion.backstage.bean.BackstageBeanInterface;
import com.group6.petssion.backstage.service.BackstageService;
import com.group6.petssion.bean.Users;

@Controller
@RequestMapping("/backend")
public class Backstage {

	@Autowired
	private BackstageService bs;

	@GetMapping("/backManager")
	public String basckManager() {
		return "backend/backstage/backManager";
	}
	@GetMapping("/backBlockade")
	public String basckBlockade() {

		return "backend/backstage/backBlockade";
	}
	@GetMapping("/backChart")
	public String basckChert() {
		return "backend/backstage/backChart";
	}
	@PostMapping("/select")
	@ResponseBody
	public Page<BackendUserBeanInterface> select(@RequestBody Map<String, Object> map) {
		return bs.select(map);
	}

	@PostMapping("/updateManager")
	@ResponseBody
	public int updataManager(@RequestBody Map<String, Object> map) {
		return bs.updataManager(map);
	}
	@PostMapping("/updateBlockade")
	@ResponseBody
	public int updataBlockade(@RequestBody Map<String, Object> map) {
		System.out.println(map);		
		return bs.updataBlockade(map);
	}
	@GetMapping("/byYear/{year}")
	@ResponseBody
	public Map<String, Object> byYear(@PathVariable String year) {
		return bs.byYear(year);
	}
	@GetMapping("/byMonth/{year}/{mm}")
	@ResponseBody
	public Map<String, Object> byMonth(@PathVariable String year,@PathVariable String mm) {
		return bs.byMonth(year,mm);
	}
	@GetMapping("/byJob")
	@ResponseBody
	public List<BackstageBeanInterface> selectJob() {
		return bs.selectJob();
	}

	@GetMapping("/downloadByYear/{year}/{name}")
	public void downloadByYear(HttpServletResponse response,@PathVariable String year,@PathVariable String name) {
		String body  = bs.downloadByYear(year);
	    response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    try {
	    	byte[] bytes=name.getBytes("UTF-8");
	    	name=new String(bytes,"ISO-8859-1");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	    response.setHeader("Content-Disposition","attachment;filename="+name+".csv");
	    PrintWriter out;
		try {
			out = response.getWriter();
			out.print(body);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@GetMapping("/downloadByMonth/{year}/{month}/{name}")
	public void downloadByMonth(HttpServletResponse response,@PathVariable String year,@PathVariable String name,@PathVariable String month) {
		String body  = bs.downloadByMonth(year,month);
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			byte[] bytes=name.getBytes("UTF-8");
			name=new String(bytes,"ISO-8859-1");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition","attachment;filename="+name+".csv");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(body);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@GetMapping("/downloadByJob")
	public void downloadByJob(HttpServletResponse response) {
		String body  = bs.downloadByJob();
		String name= "註冊職業分布";
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			byte[] bytes=name.getBytes("UTF-8");
			name=new String(bytes,"ISO-8859-1");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition","attachment;filename="+name+".csv");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(body);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
