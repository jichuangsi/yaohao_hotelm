package com.gx.po;

public class QuestionPo {

    private Integer id;
    private Integer hotelm;
    private String title;
    private long createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHotelm() {
        return hotelm;
    }

    public void setHotelm(Integer hotelm) {
        this.hotelm = hotelm;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }
}
