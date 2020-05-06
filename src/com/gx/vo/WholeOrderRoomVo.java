package com.gx.vo;

public class WholeOrderRoomVo {
    private Integer id;
    private Integer guestRoomLevelID;//房间等级id
    private String roomNumber;//房间号
    private String roomAmount;//床位数
    private double referencePrice;//参考价
    private Integer supplierId;//供应商
    private Integer supplierID;//供应商
    private long time;//创建时间
    private Integer surplus;//剩余床位数
    private Integer guestid;
    private String guestRoomLevel;
    private Integer status;
    private Integer supplierid;
    private String supplierName;
    private Integer isenabled;//1启用 2禁用
    private Integer have;//是否为自有  1是 2不是

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

    public Integer getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(Integer supplierID) {
        this.supplierID = supplierID;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public Integer getSurplus() {
        return surplus;
    }

    public void setSurplus(Integer surplus) {
        this.surplus = surplus;
    }

    public Integer getGuestid() {
        return guestid;
    }

    public void setGuestid(Integer guestid) {
        this.guestid = guestid;
    }

    public String getGuestRoomLevel() {
        return guestRoomLevel;
    }

    public void setGuestRoomLevel(String guestRoomLevel) {
        this.guestRoomLevel = guestRoomLevel;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(Integer supplierid) {
        this.supplierid = supplierid;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public Integer getIsenabled() {
        return isenabled;
    }

    public void setIsenabled(Integer isenabled) {
        this.isenabled = isenabled;
    }

    public Integer getHave() {
        return have;
    }

    public void setHave(Integer have) {
        this.have = have;
    }
}
