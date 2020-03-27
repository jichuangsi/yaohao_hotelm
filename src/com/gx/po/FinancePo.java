package com.gx.po;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class FinancePo {

    //财务报表

    private Integer id;
    private Integer supplierId;
    private Integer roomId;//房间id
    private String roomNumber;//房间号
    private String yearM;//时间(月)
    private double PHP;//菲律宾币
    private double RMB;//人名币
    private double rent;//房租
    private double water;//水费
    private double electricity;//电费
    private double maintenanceCost;//维修费
    private double network;//网费
    private double buildingManagementFee;//大厦管理费
    private double linenCleaningfee;//被子清洗费
    private double dailySupplies;//日常消费
    private double otherExpenses;//其他
    private Timestamp time;

    private double count;//小计
    private double sumPHP;
    private double sumCNY;
    private double booking;//接单提成

    private List<DailyconsumptionPo> dlist=new ArrayList<DailyconsumptionPo>();

    public List<DailyconsumptionPo> getDlist() {
        return dlist;
    }

    public void setDlist(List<DailyconsumptionPo> dlist) {
        this.dlist = dlist;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
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

    public double getBooking() {
        return booking;
    }

    public void setBooking(double booking) {
        this.booking = booking;
    }

    public double getCount() {
        return count;
    }

    public void setCount(double count) {
        this.count = count;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

  /*  public Timestamp getYearM() {
        return yearM;
    }

    public void setYearM(Timestamp yearM) {
        this.yearM = yearM;
    }*/

    public String getYearM() {
        return yearM;
    }

    public void setYearM(String yearM) {
        this.yearM = yearM;
    }

    public double getPHP() {
        return PHP;
    }

    public void setPHP(double PHP) {
        this.PHP = PHP;
    }

    public double getRMB() {
        return RMB;
    }

    public void setRMB(double RMB) {
        this.RMB = RMB;
    }

    public double getRent() {
        return rent;
    }

    public void setRent(double rent) {
        this.rent = rent;
    }

    public double getWater() {
        return water;
    }

    public void setWater(double water) {
        this.water = water;
    }

    public double getElectricity() {
        return electricity;
    }

    public void setElectricity(double electricity) {
        this.electricity = electricity;
    }

    public double getMaintenanceCost() {
        return maintenanceCost;
    }

    public void setMaintenanceCost(double maintenanceCost) {
        this.maintenanceCost = maintenanceCost;
    }

    public double getNetwork() {
        return network;
    }

    public void setNetwork(double network) {
        this.network = network;
    }

    public double getBuildingManagementFee() {
        return buildingManagementFee;
    }

    public void setBuildingManagementFee(double buildingManagementFee) {
        this.buildingManagementFee = buildingManagementFee;
    }

    public double getLinenCleaningfee() {
        return linenCleaningfee;
    }

    public void setLinenCleaningfee(double linenCleaningfee) {
        this.linenCleaningfee = linenCleaningfee;
    }

    public double getDailySupplies() {
        return dailySupplies;
    }

    public void setDailySupplies(double dailySupplies) {
        this.dailySupplies = dailySupplies;
    }

    public double getOtherExpenses() {
        return otherExpenses;
    }

    public void setOtherExpenses(double otherExpenses) {
        this.otherExpenses = otherExpenses;
    }
}
