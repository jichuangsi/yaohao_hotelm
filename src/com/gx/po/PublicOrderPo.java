package com.gx.po;

import java.sql.Timestamp;

public class PublicOrderPo {

    private Integer id;
    private String orderNumber;
    private String hotelm;
    private String roomNumber;
    private String paltform;
    private String pname;
    private String sex;
    private String phone;
    private Timestamp checkintime;
    private Timestamp checkouttime;
    private Integer checkinNumber;
    private Integer currency;
    private double money;
    private Integer isdao;
    private Timestamp daotime;
    private Timestamp time;
    private Integer status;

    public Integer getCurrency() {
        return currency;
    }

    public void setCurrency(Integer currency) {
        this.currency = currency;
    }

    public Integer getCheckinNumber() {
        return checkinNumber;
    }

    public void setCheckinNumber(Integer checkinNumber) {
        this.checkinNumber = checkinNumber;
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

    public String getHotelm() {
        return hotelm;
    }

    public void setHotelm(String hotelm) {
        this.hotelm = hotelm;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getPaltform() {
        return paltform;
    }

    public void setPaltform(String paltform) {
        this.paltform = paltform;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Timestamp getCheckintime() {
        return checkintime;
    }

    public void setCheckintime(Timestamp checkintime) {
        this.checkintime = checkintime;
    }

    public Timestamp getCheckouttime() {
        return checkouttime;
    }

    public void setCheckouttime(Timestamp checkouttime) {
        this.checkouttime = checkouttime;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Integer getIsdao() {
        return isdao;
    }

    public void setIsdao(Integer isdao) {
        this.isdao = isdao;
    }

    public Timestamp getDaotime() {
        return daotime;
    }

    public void setDaotime(Timestamp daotime) {
        this.daotime = daotime;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
