package com.group6.petssion.blog.Model;

import javax.persistence.*;

@Entity
public class TagVo {
	@Id
	private String tag;
	private Integer count;
	
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public TagVo() {
		
	}
	public TagVo(String tag, Integer count) {
		super();
		this.tag = tag;
		this.count = count;
	}
	
}
