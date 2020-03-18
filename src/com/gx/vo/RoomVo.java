package com.gx.vo;

public class RoomVo {
    private Integer id;
    private Integer guestRoomLevelID;//房间等级id
    private String roomNumber;//房间号
    private String roomAmount;//床位数
    private double referencePrice;//参考价
    private Integer supplierId;//供应商
    private Integer supplierID;//供应商
    private long createTime;//创建时间
    private Integer gid;
    private String guestRoomLevelName;
    private String supplierName;

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getGuestRoomLevelName() {
        return guestRoomLevelName;
    }

    public void setGuestRoomLevelName(String guestRoomLevelName) {
        this.guestRoomLevelName = guestRoomLevelName;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public Integer getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(Integer supplierID) {
        this.supplierID = supplierID;
    }

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

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }
}
