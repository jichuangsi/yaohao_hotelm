package com.gx.dao;

import com.gx.po.RoomAndTime;

public interface RoomAndTimeDao {

    public int inserAll(RoomAndTime roomAndTime);
    public int updateisdao(RoomAndTime roomAndTime);

    public int deleteOrder(int orderId);
}
