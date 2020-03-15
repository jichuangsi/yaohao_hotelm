package com.gx.service.impl;

import com.gx.dao.GuestRoomLevelDao;
import com.gx.page.Page;
import com.gx.po.guestRoomLevelPo;
import com.gx.service.GuestRoomLevelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service("GuestRoomLevelService")
public class GuestRoomLevelServiceImpl implements GuestRoomLevelService {

    @Autowired
    private GuestRoomLevelDao guestRoomLevelDao;
    @Override
    public List<guestRoomLevelPo> list() {

        return guestRoomLevelDao.list();
    }
}
