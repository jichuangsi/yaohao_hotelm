package com.gx.dao;

import com.gx.po.BedroomPo;
import org.apache.ibatis.annotations.Param;

public interface BedRoomDao {

    public int inserAll(BedroomPo bedroomPo);

    public int updateAcount(Integer id);

    public BedroomPo selectID(Integer id);

    public BedroomPo selectByRoomidAndSupplierid(@Param("supplierID") Integer supplierID,@Param("roomid") Integer roomid);

    public int update(BedroomPo bedroomPo);

    public int updateOne(Integer roomid);

    public Integer deleteRoomid(Integer roomid);

    public BedroomPo selectroomid(Integer roomid);
}
