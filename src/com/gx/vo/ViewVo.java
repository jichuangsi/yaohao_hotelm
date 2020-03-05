package com.gx.vo;

import java.sql.Date;

public class ViewVo {

    private String passenger;
    private Integer sorp;
    private String phone;
    private String roomNumber;
    private Date checkin;
    private Date checkout;
    private Integer id;
    private Integer supplierId;
    private Integer preid;
    private Integer stayid;
    private long time;
    private long time2;
    private Integer isdao;



    private String checkins;//具体入住时间点
    private String checkouts;//具体退房时间点

    public String getCheckins() {
        return checkins;
    }

    public void setCheckins(String checkins) {
        this.checkins = checkins;
    }

    public String getCheckouts() {
        return checkouts;
    }

    public void setCheckouts(String checkouts) {
        this.checkouts = checkouts;
    }

    public Integer getIsdao() {
        return isdao;
    }

    public void setIsdao(Integer isdao) {
        this.isdao = isdao;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public long getTime2() {
        return time2;
    }

    public void setTime2(long time2) {
        this.time2 = time2;
    }

    public String getPassenger() {
        return passenger;
    }

    public void setPassenger(String passenger) {
        this.passenger = passenger;
    }

    public Integer getSorp() {
        return sorp;
    }

    public void setSorp(Integer sorp) {
        this.sorp = sorp;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Integer getPreid() {
        return preid;
    }

    public void setPreid(Integer preid) {
        this.preid = preid;
    }

    public Integer getStayid() {
        return stayid;
    }

    public void setStayid(Integer stayid) {
        this.stayid = stayid;
    }
}
