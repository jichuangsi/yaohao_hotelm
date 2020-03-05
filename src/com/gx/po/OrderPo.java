package com.gx.po;

public class OrderPo {

    private Integer id;

    private String orderID;

    private Integer status;

    private Integer  platformId;

    private Integer stayDetailsId;

    private String pname;

    private Integer predeterID;

    public Integer getPredeterID() {
        return predeterID;
    }

    public void setPredeterID(Integer predeterID) {
        this.predeterID = predeterID;
    }

    public Integer getStayDetailsId() {
        return stayDetailsId;
    }

    public void setStayDetailsId(Integer stayDetailsId) {
        this.stayDetailsId = stayDetailsId;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public Integer getId() {
        return id;
    }

    public Integer getPlatformId() {
        return platformId;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }
    public void setPlatformId(Integer platformId) {
        this.platformId = platformId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
