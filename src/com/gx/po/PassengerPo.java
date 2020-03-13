package com.gx.po;

import java.sql.Timestamp;

public class PassengerPo {
	
	private Integer id;
	private String name;                   //姓名
	private Integer genderName;             //姓别
	private String phoneNumber;     //联系电话
	private long time;              //注册时间

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getGenderName() {
		return genderName;
	}

	public void setGenderName(Integer genderName) {
		this.genderName = genderName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}
}
