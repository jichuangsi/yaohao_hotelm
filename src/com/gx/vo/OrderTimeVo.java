package com.gx.vo;

public class OrderTimeVo {
    private int orderId;
    private String orderNumber;
    private String supplierName;
    private Integer roomId;
    private String roomNumber;
    private Integer remainingBeds;
    private Integer number;//入住人数
    private Integer roomAmount;
    private Integer checkinNumber;
    private Integer supplierId;

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Integer getCheckinNumber() {
        return checkinNumber;
    }

    public void setCheckinNumber(Integer checkinNumber) {
        this.checkinNumber = checkinNumber;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getRoomAmount() {
        return roomAmount;
    }

    public void setRoomAmount(Integer roomAmount) {
        this.roomAmount = roomAmount;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

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

    public Integer getRemainingBeds() {
        return remainingBeds;
    }

    public void setRemainingBeds(Integer remainingBeds) {
        this.remainingBeds = remainingBeds;
    }
}
