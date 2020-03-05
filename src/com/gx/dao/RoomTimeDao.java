package com.gx.dao;

import com.gx.po.RoomTimePo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomTimeDao {

    public RoomTimePo list();

    public int update(@Param("checkin") String checkin,@Param("checkout") String checkout);

}
