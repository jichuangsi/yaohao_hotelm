package com.gx.service;

import com.gx.po.RoomAndTime;

public interface RoomAndTimeService {

    public int inserAll(RoomAndTime roomAndTime);
    public int updateisdao(RoomAndTime roomAndTime);

    public int deleteOrder(int orderId);
}
