package com.gx.dao;

import com.gx.po.DailyconsumptionPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DailyconsumptionDao {

    public DailyconsumptionPo selectByTimeAndRoom(@Param("time") String time,@Param("roomId") Integer roomId,@Param("cid")Integer cid);

    public int insertAll(DailyconsumptionPo po);

    public int updateTimeRoom(DailyconsumptionPo po);

    public DailyconsumptionPo selectById(Integer id);
   public double selectSumMoney(@Param("time") String time,@Param("cid")int cid,@Param("roomId")  int roomId,
                                 @Param("supplierId")Integer supplierId);

    public List<DailyconsumptionPo> list();

    public Integer updateNumberByRoomId(@Param("roomId")Integer roomId,@Param("roomNumber")String roomNumber);

    public List<DailyconsumptionPo> listPage(@Param("time") String time,@Param("start")  int start,@Param("pageSize")  int pageSize);
    public Integer countpage(@Param("time") String time);

    public DailyconsumptionPo financesum(@Param("roomId")Integer roomId,@Param("time")String time,
                                         @Param("cid")Integer cid);

    public List<DailyconsumptionPo> dailydateil(@Param("roomId")Integer roomId, @Param("cid")Integer cid,@Param("time")String time);

    public Integer updateAll(DailyconsumptionPo po);

    public Integer delById(Integer id);
}
