package com.gx.po;

import java.sql.Timestamp;

public class PassengerPo {
	
	private Integer id;
	

	private Integer genderID;              //性别ID
	

	private String name;                   //姓名

	private String contactPhoneNumber;     //联系电话
	
	private String remarks;                //备注

	private Timestamp time;              //注册时间
	
	//扩展字段
	
	/*private String papersName;             //证件名称
	
	private String educationDegreeName;    //文化程度名称*/
	
	private String genderName;             //姓别
	
/*
	private String passengerLevelName;     //旅客级别名称
	
	private String nationName;             //民族名称
	
	private String thingReasonName;        //民族名称
*/


	//额外传参数需要
	private Integer lvKeID;        //旅客id
	
	private Integer stayRegisterID;        //住宿登记id




	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGenderID() {
		return genderID;
	}

	public void setGenderID(Integer genderID) {
		this.genderID = genderID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContactPhoneNumber() {
		return contactPhoneNumber;
	}

	public void setContactPhoneNumber(String contactPhoneNumber) {
		this.contactPhoneNumber = contactPhoneNumber;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getGenderName() {
		return genderName;
	}

	public void setGenderName(String genderName) {
		this.genderName = genderName;
	}

	public Integer getLvKeID() {
		return lvKeID;
	}

	public void setLvKeID(Integer lvKeID) {
		this.lvKeID = lvKeID;
	}

	public Integer getStayRegisterID() {
		return stayRegisterID;
	}

	public void setStayRegisterID(Integer stayRegisterID) {
		this.stayRegisterID = stayRegisterID;
	}
	
	//==================================================================================================================//

	private String codeNumber;

	private Integer platID;

	public void setCodeNumber(String codeNumber) {
		this.codeNumber = codeNumber;
	}

	public String getCodeNumber() {
		return codeNumber;
	}

	public void setPlatID(Integer platID) {
		this.platID = platID;
	}

	public Integer getPlatID() {
		return platID;
	}
}
