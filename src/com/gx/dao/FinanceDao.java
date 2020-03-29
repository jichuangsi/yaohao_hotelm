package com.gx.dao;

import com.gx.page.Page;
import com.gx.po.FinancePo;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

public interface FinanceDao {
    //财务报表按月
    public List<FinancePo> pageFinance(@Param("yearM") String yearM,@Param("start")  int start,@Param("pageSize")  int pageSize);

    public int countFinance(@Param("yearM")String yearM);
    public int countFinanceM(@Param("yearM")String yearM,@Param("roomId")Integer roomId);

    public int updateOtherById(FinancePo po);

    public int updateRentById(FinancePo po);

    public int updateById(FinancePo po);

    public FinancePo selectById(int id);

    public FinancePo selectByyearM(@Param("yearM")String yearM,@Param("roomId")Integer roomId);

    public int updatePHP(FinancePo po);

    public int updateRMB(FinancePo po);

    public int insertAll(FinancePo po);

    public int slectCountRoom();

    public List<FinancePo> listtime(String time);

    //根据房间id 修改房间号
    public Integer updateRoomNuberByRoomId(@Param("roomId")Integer roomId,@Param("roomNumber")String roomNumber);

 }
