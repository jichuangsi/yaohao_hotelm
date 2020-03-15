package com.gx.service;

import com.gx.po.BookingcommissionPo;
import com.gx.po.DailyconsumptionPo;

public interface DailyconsumptionService {

    public DailyconsumptionPo selectByTimeAndRoom(String time,int roomId,int cid);

    public int insertAll(DailyconsumptionPo po);

    public int updateTimeRoom(DailyconsumptionPo po);

    public DailyconsumptionPo selectById(int id);

    public double selectSumMoney(String time, Integer cid,
                                 Integer roomId,Integer supplierId);
}