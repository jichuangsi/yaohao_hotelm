package com.gx.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class OrderDetailsVo {
    private Integer id;
    private Integer platformId;//平台
    private String platformName;
    private Integer orderID;//订单
    private String orderNumber;
    private Integer status;//订单状态1未确认 2已确认 3 已撤销 4待入住 5退房
    private Integer supplierId;//供应商
    private String supplierName;
    private Integer roomid;//客房
    private String roomNumber;//房号
    private Double money;
    private Integer pId;//用户
    private String name;
    private Integer genderID;
    private String phoneNumber;
    private Integer currency;//1人民币 2菲律宾币
    private Integer isdao;//1未到 2已到
    private Timestamp daoTime;//到账时间
    private Timestamp checkintime;
    private Timestamp checkouttime;
    private Timestamp orderTime;//订单时间
    private int checkinDay;//入住天数
    private int checkinNumber;//入住床位
    private int checkinRoom;//入住人数
    private Integer aid;
    private String accountName;//账户
    private int type; //1自有 2合约
    private String in;
    private String out;
    private Integer hometype;//房型合租整租Id
    private String guestRoomLevel;//房型名称
    private Integer guestRoomLevelID;//房型id

    public Integer getGuestRoomLevelID() {
        return guestRoomLevelID;
    }

    public void setGuestRoomLevelID(Integer guestRoomLevelID) {
        this.guestRoomLevelID = guestRoomLevelID;
    }

    public String getGuestRoomLevel() {
        return guestRoomLevel;
    }

    public void setGuestRoomLevel(String guestRoomLevel) {
        this.guestRoomLevel = guestRoomLevel;
    }

    public Integer getHometype() {
        return hometype;
    }

    public void setHometype(Integer hometype) {
        this.hometype = hometype;
    }

    public int getCheckinRoom() {
        return checkinRoom;
    }

    public void setCheckinRoom(int checkinRoom) {
        this.checkinRoom = checkinRoom;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIn() {
        return in;
    }

    public void setIn(String in) {
        this.in = in;
    }

    public String getOut() {
        return out;
    }

    public void setOut(String out) {
        this.out = out;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getCheckinNumber() {
        return checkinNumber;
    }

    public void setCheckinNumber(int checkinNumber) {
        this.checkinNumber = checkinNumber;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
/*
    public long getDaoTime() {
        return daoTime;
    }

    public void setDaoTime(long daoTime) {
        this.daoTime = daoTime;
    }

    public long getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(long orderTime) {
        this.orderTime = orderTime;
    }*/

    public Integer getPlatformId() {
        return platformId;
    }

    public void setPlatformId(Integer platformId) {
        this.platformId = platformId;
    }

    public String getPlatformName() {
        return platformName;
    }

    public void setPlatformName(String platformName) {
        this.platformName = platformName;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
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

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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

   /* public long getCheckintime() {
        return checkintime;
    }

    public void setCheckintime(long checkintime) {
        this.checkintime = checkintime;
    }

    public long getCheckouttime() {
        return checkouttime;
    }

    public void setCheckouttime(long checkouttime) {
        this.checkouttime = checkouttime;
    }*/

    public int getCheckinDay() {
        return checkinDay;
    }

    public void setCheckinDay(int checkinDay) {
        this.checkinDay = checkinDay;
    }

    public Timestamp getDaoTime() {
        return daoTime;
    }

    public void setDaoTime(Timestamp daoTime) {
        this.daoTime = daoTime;
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

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }
}
