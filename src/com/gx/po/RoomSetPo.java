package com.gx.po;

import java.sql.Timestamp;

public class RoomSetPo {
	
	private Integer id;
	
	private Integer guestRoomLevelID;

	private Integer roomStateID;
	
	private String roomNumber;
	
	private String roomAmount;

	private double standardPriceDay;

	private double standardPrice;

	private String maxDuration;

	private String firstDuration;

	private double firstPrice;
	//=========================================================================================================================//
	private double discount;//折扣
	private double discountPrice;//折扣后价
	private double bedPrice;//床位价/小时
	private String bedHour;//限制时长
	private double bedDayPrice;//床位价/天

	private int isBed;

	private Timestamp time;
	private double purchasePrice;//采购价


//拓展字段

	private String guestRoomLevelName;

	private String roomName;

	private Integer surplusAcount;//剩余床位数
	/*private Integer predetermineDay;*/

	public double getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Timestamp getTime() {
		return time;
	}

	public Integer getSurplusAcount() {
		return surplusAcount;
	}

	public void setSurplusAcount(Integer surplusAcount) {
		this.surplusAcount = surplusAcount;
	}

	public int getIsBed() {
		return isBed;
	}

	public void setIsBed(int isBed) {
		this.isBed = isBed;
	}

	public double getBedPrice() {
		return bedPrice;
	}

	public double getDiscount() {
		return discount;
	}

	public double getDiscountPrice() {
		return discountPrice;
	}

	public void setBedPrice(double bedPrice) {
		this.bedPrice = bedPrice;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getBedDayPrice() {
		return bedDayPrice;
	}

	public String getBedHour() {
		return bedHour;
	}

	public void setBedDayPrice(double bedDayPrice) {
		this.bedDayPrice = bedDayPrice;
	}

	public void setBedHour(String bedHour) {
		this.bedHour = bedHour;
	}

	public void setDiscountPrice(double discountPrice) {
		this.discountPrice = discountPrice;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGuestRoomLevelID() {
		return guestRoomLevelID;
	}

	public void setGuestRoomLevelID(Integer guestRoomLevelID) {
		this.guestRoomLevelID = guestRoomLevelID;
	}

	public Integer getRoomStateID() {
		return roomStateID;
	}

	public void setRoomStateID(Integer roomStateID) {
		this.roomStateID = roomStateID;
	}

	public String getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}

	public String getRoomAmount() {
		return roomAmount;
	}

	public void setRoomAmount(String roomAmount) {
		this.roomAmount = roomAmount;
	}

	public double getStandardPriceDay() {
		return standardPriceDay;
	}

	public void setStandardPriceDay(double standardPriceDay) {
		this.standardPriceDay = standardPriceDay;
	}

	public double getStandardPrice() {
		return standardPrice;
	}

	public void setStandardPrice(double standardPrice) {
		this.standardPrice = standardPrice;
	}

	public String getMaxDuration() {
		return maxDuration;
	}

	public void setMaxDuration(String maxDuration) {
		this.maxDuration = maxDuration;
	}

	public String getFirstDuration() {
		return firstDuration;
	}

	public void setFirstDuration(String firstDuration) {
		this.firstDuration = firstDuration;
	}

	public double getFirstPrice() {
		return firstPrice;
	}

	public void setFirstPrice(double firstPrice) {
		this.firstPrice = firstPrice;
	}



	//拓展字段属性

	public String getGuestRoomLevelName() {
		return guestRoomLevelName;
	}

	public void setGuestRoomLevelName(String guestRoomLevelName) {
		this.guestRoomLevelName = guestRoomLevelName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	/*public Integer getPredetermineDay() {
		return predetermineDay;
	}

	public void setPredetermineDay(Integer predetermineDay) {
		this.predetermineDay = predetermineDay;
	}*/

	private Integer supplierID;

	public Integer getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(Integer supplierID) {
		this.supplierID = supplierID;
	}

	//=======================================================================================================================//
	private String supplierName;

	private Integer sid;

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	//bedRoom
	private Integer roomid;
	private String roomAcount;

	private Integer people;


	public Integer getPeople() {
		return people;
	}

	public String getRoomAcount() {
		return roomAcount;
	}

	public Integer getRoomid() {
		return roomid;
	}

	public void setPeople(Integer people) {
		this.people = people;
	}

	public void setRoomAcount(String roomAcount) {
		this.roomAcount = roomAcount;
	}

	public void setRoomid(Integer roomid) {
		this.roomid = roomid;
	}

}
