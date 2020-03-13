package com.gx.service.impl;

import com.gx.dao.RoomAndTimeDao;
import com.gx.po.RoomAndTime;
import com.gx.service.RoomAndTimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("RoomAndTimeService")
public class RoomAndTimeServiceImpl implements RoomAndTimeService {

    @Autowired
    private RoomAndTimeDao roomAndTimeDao;
    @Override
    public int inserAll(RoomAndTime roomAndTime) {
        return roomAndTimeDao.inserAll(roomAndTime);
    }

    @Override
    public int updateisdao(RoomAndTime roomAndTime) {
        return roomAndTimeDao.updateisdao(roomAndTime);
    }

    @Override
    public int deleteOrder(int orderId) {
        return roomAndTimeDao.deleteOrder(orderId);
    }
}
