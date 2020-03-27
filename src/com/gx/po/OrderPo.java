package com.gx.po;

import java.sql.Timestamp;

public class OrderPo {

    private Integer id;
    private String orderNumber;
    private Integer status;//1未确认 2已确认 3 已撤销 5已入住  6退房
    private Integer  platformId;//平台id
    private  double money;//价钱
    private Integer currency;//1人名币 2菲律宾币
    private Integer  hotelmId;//酒店id
    private Integer roomId;//房号id
    private Timestamp checkinTime;//入住时间
    private Timestamp checkoutTime;//退房时间
    private Timestamp orderTime;//订单时间
    private Integer passengerId;//用户id
    private Integer isdao;//是否到账 1未到账 2到账
    private Timestamp daoTime;//到账时间
    private Integer checkinNumber;//入住人数
    private Integer checkinRoom;//入住床位数
    private Integer account;//账户
    private Integer checkinDay;//入住天数
    private Integer type;//类型 1自己 2合约


    public Integer getCheckinRoom() {
        return checkinRoom;
    }

    public void setCheckinRoom(Integer checkinRoom) {
        this.checkinRoom = checkinRoom;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getCheckinDay() {
        return checkinDay;
    }

    public void setCheckinDay(Integer checkinDay) {
        this.checkinDay = checkinDay;
    }

    public Integer getCheckinNumber() {
        return checkinNumber;
    }

    public void setCheckinNumber(Integer checkinNumber) {
        this.checkinNumber = checkinNumber;
    }

    public Integer getCurrency() {
        return currency;
    }

    public void setCurrency(Integer currency) {
        this.currency = currency;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPlatformId() {
        return platformId;
    }

    public void setPlatformId(Integer platformId) {
        this.platformId = platformId;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Integer getHotelmId() {
        return hotelmId;
    }

    public void setHotelmId(Integer hotelmId) {
        this.hotelmId = hotelmId;
    }

    /*public long getCheckinTime() {
        return checkinTime;
    }

    public void setCheckinTime(long checkinTime) {
        this.checkinTime = checkinTime;
    }

    public long getCheckoutTime() {
        return checkoutTime;
    }

    public void setCheckoutTime(long checkoutTime) {
        this.checkoutTime = checkoutTime;
    }

    public long getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(long orderTime) {
        this.orderTime = orderTime;
    }*/

    public Integer getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(Integer passengerId) {
        this.passengerId = passengerId;
    }

    public Integer getIsdao() {
        return isdao;
    }

    public void setIsdao(Integer isdao) {
        this.isdao = isdao;
    }

  /*  public long getDaoTime() {
        return daoTime;
    }

    public void setDaoTime(long daoTime) {
        this.daoTime = daoTime;
    }*/

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getAccount() {
        return account;
    }

    public void setAccount(Integer account) {
        this.account = account;
    }

    public Timestamp getCheckinTime() {
        return checkinTime;
    }

    public void setCheckinTime(Timestamp checkinTime) {
        this.checkinTime = checkinTime;
    }

    public Timestamp getCheckoutTime() {
        return checkoutTime;
    }

    public void setCheckoutTime(Timestamp checkoutTime) {
        this.checkoutTime = checkoutTime;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public Timestamp getDaoTime() {
        return daoTime;
    }

    public void setDaoTime(Timestamp daoTime) {
        this.daoTime = daoTime;
    }
}
