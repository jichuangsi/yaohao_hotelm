package com.gx.service;

import com.gx.po.BedroomPo;

public interface BedRoomService {

    public int inserAll(BedroomPo bedroomPo);

    public int updateAcount(Integer id);

    public BedroomPo selectID(Integer id);

    public BedroomPo selectByRoomidAndSupplierid(Integer supplierID,Integer roomid);

    public int update(BedroomPo bedroomPo);

    public int updateOne(Integer roomid);

    public Integer deleteRoomid(Integer roomid);

    public BedroomPo selectroomid(Integer roomid);



}
