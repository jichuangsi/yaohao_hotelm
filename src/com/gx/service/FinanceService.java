package com.gx.service;

import com.gx.page.Page;
import com.gx.po.FinancePo;

import java.sql.Timestamp;
import java.util.List;

public interface FinanceService {

    //财务报表按月
    public Page<FinancePo> list(String time,Page<FinancePo> vo);

    public int countFinanceM(String yearM,int roomId);

    public int updateOtherById(FinancePo po);

    public int updateRentById(FinancePo po);

    public int updateById(FinancePo po);

    public FinancePo selectById(int id);
    public FinancePo selectByyearM(String yearM,Integer roomId);

    public int updatePHP(FinancePo po);

    public int updateRMB(FinancePo po);

    public int insertAll(FinancePo po);

    public int slectCountRoom();


    //财务报表按月
    public List<FinancePo> list(String time);

    public Integer updateRoomNuberByRoomId(Integer roomId,String roomNumber);
}
