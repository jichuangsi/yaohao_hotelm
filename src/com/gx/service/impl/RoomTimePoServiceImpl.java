package com.gx.service.impl;

import com.gx.dao.RoomTimeDao;
import com.gx.po.RoomTimePo;
import com.gx.service.RoomSetService;
import com.gx.service.RoomTimePoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service(value="RoomTimePoService")
public class RoomTimePoServiceImpl implements RoomTimePoService {

    @Autowired
    private RoomTimeDao roomTimeDao;

    @Override
    public RoomTimePo list() {
        return roomTimeDao.list();
    }

    @Override
    public int update(String checkin, String checkout) {
        return roomTimeDao.update(checkin, checkout);
    }
}
