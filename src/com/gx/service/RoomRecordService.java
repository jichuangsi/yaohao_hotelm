package com.gx.service;

import com.gx.po.RoomRecordPo;

public interface RoomRecordService {

    public int inserAll(RoomRecordPo roomRecordPo);

    public RoomRecordPo selctByRoomidAndOrderNumber(Integer roomId,String orderNumber);

    public Integer updateCheckout(Integer id,Integer checkout);
}
