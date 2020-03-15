package com.gx.po;

import java.sql.Timestamp;

public class RoomRecordPo {
	
	private Integer id;
	private Integer roomid;//房间id
	private String roomNumber;//房间号
	private String roomAmount;//床位数
	private Integer orderId;//订单id
	private String orderNumber;//订单号
	private Integer passengerId;//旅客id
	private long createTime;//创建时间
	private Integer checkinNumber;//入住人数
	private Integer isCheckout;//是否退房 1否 2退

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoomid() {
		return roomid;
	}

	public void setRoomid(Integer roomid) {
		this.roomid = roomid;
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

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Integer getPassengerId() {
		return passengerId;
	}

	public void setPassengerId(Integer passengerId) {
		this.passengerId = passengerId;
	}

	public long getCreateTime() {
		return createTime;
	}

	public void setCreateTime(long createTime) {
		this.createTime = createTime;
	}

	public Integer getCheckinNumber() {
		return checkinNumber;
	}

	public void setCheckinNumber(Integer checkinNumber) {
		this.checkinNumber = checkinNumber;
	}

	public Integer getIsCheckout() {
		return isCheckout;
	}

	public void setIsCheckout(Integer isCheckout) {
		this.isCheckout = isCheckout;
	}
}
