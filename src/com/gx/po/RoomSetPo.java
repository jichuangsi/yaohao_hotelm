package com.gx.po;

import java.sql.Timestamp;

public class RoomSetPo {
	
	private Integer id;
	private Integer guestRoomLevelID;//房间等级id
	private String roomNumber;//房间号
	private String roomAmount;//床位数
	private double referencePrice;//参考价
	private Integer supplierId;//供应商
	private Integer supplierID;//供应商
	private long time;//创建时间
	private Integer surplus;//剩余床位数

	public Integer getSupplierID() {
		return supplierID;
	}

	public void setSupplierID(Integer supplierID) {
		this.supplierID = supplierID;
	}

	public Integer getSurplus() {
		return surplus;
	}

	public void setSurplus(Integer surplus) {
		this.surplus = surplus;
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

	public double getReferencePrice() {
		return referencePrice;
	}

	public void setReferencePrice(double referencePrice) {
		this.referencePrice = referencePrice;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public long getTime() {
		return time;
	}

	public void setTime(long time) {
		this.time = time;
	}
}
