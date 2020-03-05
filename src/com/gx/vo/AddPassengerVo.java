package com.gx.vo;

import java.sql.Date;

public class AddPassengerVo {
    private String roomNumber;
    private Integer roomid;
    private String supperName;
    private Integer supperId;
    private String name;
    private Integer genderID;
    private String contactPhoneNumber;
    private Double accountsreceivable;
    private Integer payWayID;
    private Integer currency;
    private Integer isdao;
    private Date checkintime;
    private Date checkouttime;
    private Integer platformId;
    private String orderID;
    private Integer isdicount;

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getSupperId() {
        return supperId;
    }

    public void setSupperId(Integer supperId) {
        this.supperId = supperId;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getSupperName() {
        return supperName;
    }

    public void setSupperName(String supperName) {
        this.supperName = supperName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getGenderID() {
        return genderID;
    }

    public void setGenderID(Integer genderID) {
        this.genderID = genderID;
    }

    public String getContactPhoneNumber() {
        return contactPhoneNumber;
    }

    public void setContactPhoneNumber(String contactPhoneNumber) {
        this.contactPhoneNumber = contactPhoneNumber;
    }

    public Double getAccountsreceivable() {
        return accountsreceivable;
    }

    public void setAccountsreceivable(Double accountsreceivable) {
        this.accountsreceivable = accountsreceivable;
    }

    public Integer getPayWayID() {
        return payWayID;
    }

    public void setPayWayID(Integer payWayID) {
        this.payWayID = payWayID;
    }

    public Integer getCurrency() {
        return currency;
    }

    public void setCurrency(Integer currency) {
        this.currency = currency;
    }

    public Integer getIsdao() {
        return isdao;
    }

    public void setIsdao(Integer isdao) {
        this.isdao = isdao;
    }

    public Date getCheckintime() {
        return checkintime;
    }

    public void setCheckintime(Date checkintime) {
        this.checkintime = checkintime;
    }

    public Date getCheckouttime() {
        return checkouttime;
    }

    public void setCheckouttime(Date checkouttime) {
        this.checkouttime = checkouttime;
    }

    public Integer getPlatformId() {
        return platformId;
    }

    public void setPlatformId(Integer platformId) {
        this.platformId = platformId;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public Integer getIsdicount() {
        return isdicount;
    }

    public void setIsdicount(Integer isdicount) {
        this.isdicount = isdicount;
    }
}
