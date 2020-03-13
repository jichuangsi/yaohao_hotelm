package com.gx.dao;

import com.gx.po.DailyconsumptionPo;
import org.apache.ibatis.annotations.Param;

public interface DailyconsumptionDao {

    public DailyconsumptionPo selectByTimeAndRoom(@Param("time") String time,@Param("roomId")  int roomId,@Param("cid")  int cid);

    public int insertAll(DailyconsumptionPo po);

    public int updateTimeRoom(DailyconsumptionPo po);

    public DailyconsumptionPo selectById(int id);
   public double selectSumMoney(@Param("time") String time,@Param("cid")int cid,@Param("roomId")  int roomId,
                                 @Param("supplierId")Integer supplierId);
}
