package com.gx.vo;

import java.sql.Timestamp;

public class DayRoomNumberVo {
    //一个月内每天剩余床位
    private Integer roomId;
    private String roomNumber;
    private String roomAmount;
    private Integer supplierId;
    private String supplierName;
   /* private Timestamp time;*/
    private long time;
    private Integer checkinNumber;
    private long times;

    private Integer sumRoom;//总房间数
    private Integer surplus;//剩余房间数

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public Integer getSumRoom() {
        return sumRoom;
    }

    public void setSumRoom(Integer sumRoom) {
        this.sumRoom = sumRoom;
    }

    public Integer getSurplus() {
        return surplus;
    }

    public void setSurplus(Integer surplus) {
        this.surplus = surplus;
    }

    public long getTimes() {
        return times;
    }

    public void setTimes(long times) {
        this.times = times;
    }

    public Integer getCheckinNumber() {
        return checkinNumber;
    }

    public void setCheckinNumber(Integer checkinNumber) {
        this.checkinNumber = checkinNumber;
    }

   /* public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }*/

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
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

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }
}
