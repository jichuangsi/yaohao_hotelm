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

    @Override
    public List<guestRoomLevelPo> listwhole(String hometype) {
        return guestRoomLevelDao.listwhole(hometype);
    }

    @Override
    public Page<guestRoomLevelPo> pagelistwhole(String hometype, Page<guestRoomLevelPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<guestRoomLevelPo> list=guestRoomLevelDao.pagelistwhole(hometype,start, vo.getPageSize());
        vo.setResult(list);
        Integer count=guestRoomLevelDao.countlistwhole(hometype);
        if (count==null){
            count=0;
        }
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Integer inser(guestRoomLevelPo po) {
        return guestRoomLevelDao.insertAll(po);
    }

    @Override
    public Integer updateType(guestRoomLevelPo po) {
        return guestRoomLevelDao.updateType(po);
    }

    @Override
    public Integer nameYZ(guestRoomLevelPo po) {
        return guestRoomLevelDao.nameYZ(po);
    }

    @Override
    public Integer YZ(String guestRoomLevel) {
        return guestRoomLevelDao.YZ(guestRoomLevel);
    }

    @Override
    public guestRoomLevelPo selectById(Integer id) {
        return guestRoomLevelDao.selectById(id);
    }
}
