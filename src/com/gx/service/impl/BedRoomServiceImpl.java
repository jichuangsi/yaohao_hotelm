package com.gx.service.impl;

import com.gx.dao.BedRoomDao;
import com.gx.po.BedroomPo;
import com.gx.service.BedRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("BedRoomService")
public class BedRoomServiceImpl implements BedRoomService {
    @Autowired
    private BedRoomDao bedRoomDao;
    @Override
    public int inserAll(BedroomPo bedroomPo) {
        return bedRoomDao.inserAll(bedroomPo);
    }

    @Override
    public int updateAcount(Integer id) {
        return bedRoomDao.updateAcount(id);
    }

    @Override
    public BedroomPo selectID(Integer id) {
        return bedRoomDao.selectID(id);
    }

    @Override
    public BedroomPo selectByRoomidAndSupplierid(Integer supplierID, Integer roomid) {
        return bedRoomDao.selectByRoomidAndSupplierid(supplierID,roomid);
    }

    @Override
    public int update(BedroomPo bedroomPo) {
        return bedRoomDao.update(bedroomPo);
    }

    @Override
    public int updateOne(Integer roomid) {
        return bedRoomDao.updateOne(roomid);
    }

    @Override
    public Integer deleteRoomid(Integer roomid) {
        return bedRoomDao.deleteRoomid(roomid);
    }

    @Override
    public BedroomPo selectroomid(Integer roomid) {
        return bedRoomDao.selectroomid(roomid);
    }


}
