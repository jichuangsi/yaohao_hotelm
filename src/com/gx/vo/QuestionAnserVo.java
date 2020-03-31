package com.gx.vo;

import com.gx.po.AnserPo;

import java.util.ArrayList;
import java.util.List;

public class QuestionAnserVo {
    private Integer qid;
    private String title;
    private Integer hotelm;
    private String hotelmName;
    private long time;
    private List<AnserPo> alist=new ArrayList<AnserPo>();


    public String getHotelmName() {
        return hotelmName;
    }

    public void setHotelmName(String hotelmName) {
        this.hotelmName = hotelmName;
    }

    public Integer getHotelm() {
        return hotelm;
    }

    public void setHotelm(Integer hotelm) {
        this.hotelm = hotelm;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public List<AnserPo> getAlist() {
        return alist;
    }

    public void setAlist(List<AnserPo> alist) {
        this.alist = alist;
    }
}
