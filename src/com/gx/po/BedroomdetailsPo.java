package com.gx.po;

public class BedroomdetailsPo {
    private Integer id;
    private Integer bedroomid;
    private Integer predeid;
    private Integer stayid;
    private Integer islikai;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBedroomid() {
        return bedroomid;
    }

    public Integer getIslikai() {
        return islikai;
    }

    public Integer getPredeid() {
        return predeid;
    }

    public Integer getStayid() {
        return stayid;
    }

    public void setBedroomid(Integer bedroomid) {
        this.bedroomid = bedroomid;
    }

    public void setIslikai(Integer islikai) {
        this.islikai = islikai;
    }

    public void setPredeid(Integer predeid) {
        this.predeid = predeid;
    }

    public void setStayid(Integer stayid) {
        this.stayid = stayid;
    }
}
