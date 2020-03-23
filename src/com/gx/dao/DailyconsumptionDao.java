package com.gx.dao;

import com.gx.po.DailyconsumptionPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DailyconsumptionDao {

    public DailyconsumptionPo selectByTimeAndRoom(@Param("time") String time,@Param("roomId")  int roomId,@Param("cid")  int cid);

    public int insertAll(DailyconsumptionPo po);

    public int updateTimeRoom(DailyconsumptionPo po);

    public DailyconsumptionPo selectById(int id);
   public double selectSumMoney(@Param("time") String time,@Param("cid")int cid,@Param("roomId")  int roomId,
                                 @Param("supplierId")Integer supplierId);

    public List<DailyconsumptionPo> list();

    public Integer updateNumberByRoomId(@Param("roomId")Integer roomId,@Param("roomNumber")String roomNumber);

    public List<DailyconsumptionPo> listPage(@Param("time") String time,@Param("start")  int start,@Param("pageSize")  int pageSize);
    public Integer countpage(@Param("time") String time);
}
