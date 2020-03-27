package com.gx.vo;

import com.gx.po.FinancePo;

import java.util.ArrayList;
import java.util.List;

public class FinanceVo {
    public List<FinancePo> list=new ArrayList<FinancePo>();
    public String time;
    public double booking=0d;
    public double sumPHP=0d;
    public double sumCNY=0d;

    public List<Object> name=new ArrayList<Object>();

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public List<Object> getName() {
        return name;
    }

    public void setName(List<Object> name) {
        this.name = name;
    }

    public List<FinancePo> getList() {
        return list;
    }

    public void setList(List<FinancePo> list) {
        this.list = list;
    }

    public double getBooking() {
        return booking;
    }

    public void setBooking(double booking) {
        this.booking = booking;
    }

    public double getSumPHP() {
        return sumPHP;
    }

    public void setSumPHP(double sumPHP) {
        this.sumPHP = sumPHP;
    }

    public double getSumCNY() {
        return sumCNY;
    }

    public void setSumCNY(double sumCNY) {
        this.sumCNY = sumCNY;
    }
}
