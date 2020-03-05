package com.gx.po;

public class StayregisterdetailsPo {


    private Integer id;

    private Integer stayRegisterID ;

    private  Integer passengerID;

    private String codeNumber;

    private Integer platformID;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCodeNumber() {
        return codeNumber;
    }

    public void setCodeNumber(String codeNumber) {
        this.codeNumber = codeNumber;
    }

    public Integer getPassengerID() {
        return passengerID;
    }

    public Integer getPlatformID() {
        return platformID;
    }

    public Integer getStayRegisterID() {
        return stayRegisterID;
    }

    public void setPassengerID(Integer passengerID) {
        this.passengerID = passengerID;
    }

    public void setPlatformID(Integer platformID) {
        this.platformID = platformID;
    }

    public void setStayRegisterID(Integer stayRegisterID) {
        this.stayRegisterID = stayRegisterID;
    }
}
