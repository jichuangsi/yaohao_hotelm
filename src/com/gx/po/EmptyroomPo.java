package com.gx.po;

import org.omg.CORBA.PRIVATE_MEMBER;

import java.sql.Date;
import java.sql.Timestamp;

public class EmptyroomPo {

    private Integer id;
    private Integer roomid;
    private String  roomNumber;
    private Date checkin;
    private Date   checkout;

    private  Integer stayid;

    private Integer preid;

    private Integer sorp;//预定还是入住或者空


    ///
    private Double standardPriceDay;

    private String roomAcount;

    private String supplierName;

    public Integer getSorp() {
        return sorp;
    }

    public void setSorp(Integer sorp) {
        this.sorp = sorp;
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

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public Double getStandardPriceDay() {
        return standardPriceDay;
    }

    public void setStandardPriceDay(Double standardPriceDay) {
        this.standardPriceDay = standardPriceDay;
    }

    public String getRoomAcount() {
        return roomAcount;
    }

    public void setRoomAcount(String roomAcount) {
        this.roomAcount = roomAcount;
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
}
