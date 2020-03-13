package com.gx.service.impl;

import com.gx.po.RoomRecordPo;
import com.gx.service.RoomRecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("RoomRecordService")
public class RoomRecordServiceImpl implements RoomRecordService {

    @Override
    public int inserAll(RoomRecordPo roomRecordPo) {
        return 0;
    }

    @Override
    public RoomRecordPo selctByRoomidAndOrderNumber(Integer roomId, String orderNumber) {
        return null;
    }

    @Override
    public Integer updateCheckout(Integer id,Integer checkout) {
        return null;
    }
}
