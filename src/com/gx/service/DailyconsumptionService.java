package com.gx.service;

import com.gx.page.Page;
import com.gx.po.BookingcommissionPo;
import com.gx.po.DailyconsumptionPo;

import java.util.List;

public interface DailyconsumptionService {

    public DailyconsumptionPo selectByTimeAndRoom(String time,Integer roomId,Integer cid);

    public int insertAll(DailyconsumptionPo po);

    public int updateTimeRoom(DailyconsumptionPo po);

    public DailyconsumptionPo selectById(Integer id);

    public double selectSumMoney(String time, Integer cid,
                                 Integer roomId,Integer supplierId);

    public List<DailyconsumptionPo> list();

    public Integer updateNumberByRoomId(Integer roomId,String roomNumber);

    public Page<DailyconsumptionPo> listpage(String time,Page<DailyconsumptionPo> vo);


    public DailyconsumptionPo financesum(Integer roomId,String time,Integer cid);

    public List<DailyconsumptionPo> dailydateil(Integer roomId,Integer cid,String time);

    public Integer updateAll(DailyconsumptionPo po);

    public Integer delByid(Integer id);
}
