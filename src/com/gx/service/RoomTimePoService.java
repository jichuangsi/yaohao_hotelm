package com.gx.service;

import com.gx.po.RoomTimePo;

import java.util.List;

public interface RoomTimePoService {

    public RoomTimePo list();

    public int update(String checkin,String checkout);
}
