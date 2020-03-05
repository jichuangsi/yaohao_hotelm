package com.gx.vo;

import java.sql.Date;

public class EmptyroomVo {
    private Integer id;
    private Integer roomid;
    private String  roomNumber;
    private Date checkin;
    private Date   checkout;

    private  Integer stayid;

    private Integer preid;

    private Integer sorp;//预定还是入住或者空

    private String checkins;//具体入住时间点
    private String checkouts;//具体退房时间点

    private long in;
    private long out;


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

    public long getIn() {
        return in;
    }

    public void setIn(long in) {
        this.in = in;
    }

    public long getOut() {
        return out;
    }

    public void setOut(long out) {
        this.out = out;
    }

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

    public Integer getStayid() {
        return stayid;
    }

    public void setStayid(Integer stayid) {
        this.stayid = stayid;
    }

    public Integer getPreid() {
        return preid;
    }

    public void setPreid(Integer preid) {
        this.preid = preid;
    }

    public Integer getSorp() {
        return sorp;
    }

    public void setSorp(Integer sorp) {
        this.sorp = sorp;
    }

}
