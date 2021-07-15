package com.group6.petssion.backstage.bean;

public class BackstageBean implements BackstageBeanInterface {
	
	private String month;
	private Integer numeral;
	private String jobName;
	public BackstageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BackstageBean(String month, Integer numeral, String jobName) {
		super();
		this.month = month;
		this.numeral = numeral;
		this.jobName = jobName;
	}
	
	@Override
	public String getMonth() {
		return month;
	}
	public void setMonth(String registrationMonth) {
		this.month = registrationMonth;
	}
	@Override
	public Integer getNumeral() {
		return numeral;
	}
	public void setNumeral(Integer registrationNumeral) {
		this.numeral = registrationNumeral;
	}
	@Override
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
}
