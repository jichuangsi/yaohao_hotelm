package com.gx.po;

public class BedroomPo {

    private Integer id;
    private Integer roomid;
    private String roomAcount;

    private  Integer surplusAcount;

    private Integer people;

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public Integer getPeople() {
        return people;
    }

    public String getRoomAcount() {
        return roomAcount;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public Integer getSurplusAcount() {
        return surplusAcount;
    }

    public void setPeople(Integer people) {
        this.people = people;
    }

    public void setRoomAcount(String roomAcount) {
        this.roomAcount = roomAcount;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public void setSurplusAcount(Integer surplusAcount) {
        this.surplusAcount = surplusAcount;
    }
}
