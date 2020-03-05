package com.gx.service.impl;

import com.gx.dao.EmptyRoomDao;
import com.gx.page.Page;
import com.gx.po.EmptyroomPo;
import com.gx.service.EmptyRoomSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

@Transactional
@Service(value="EmptyRoomSerivce")
public class EmptyRoomSerivceImpl implements EmptyRoomSerivce {
    @Autowired
    private EmptyRoomDao emptyRoomDao;

    @Override
    public int inserAll(EmptyroomPo emptyroomPo) {
        return emptyRoomDao.inserAll(emptyroomPo);
    }

    @Override
    public int deleteByid(EmptyroomPo emptyroomPo) {
        return emptyRoomDao.deleteByid(emptyroomPo);
    }

    @Override
    public int upadtecheck(EmptyroomPo emptyroomPo) {
        return emptyRoomDao.upadtecheck(emptyroomPo);
    }

    @Override
    public Page<EmptyroomPo> listAll(String roomAcount, Date checkin, Date checkout, Page<EmptyroomPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<EmptyroomPo> list=this.emptyRoomDao.listAll(roomAcount,checkin,checkout,start, vo.getPageSize());
        vo.setResult(list);

        int count=this.emptyRoomDao.listAllCount(roomAcount,checkin,checkout);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Page<EmptyroomPo> listSelectAll(String roomAcount, Page<EmptyroomPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<EmptyroomPo> list=this.emptyRoomDao.listSelectAll(roomAcount,start, vo.getPageSize());
        vo.setResult(list);

        int count=this.emptyRoomDao.listSelectAllCount(roomAcount);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public List<EmptyroomPo> selectOneAndNull(Integer roomid) {
        return emptyRoomDao.selectOneAndNull(roomid);
    }

    @Override
    public int upadte(EmptyroomPo emptyroomPo) {
        return emptyRoomDao.upadte(emptyroomPo);
    }

    @Override
    public int deleteRoomid(Integer roomid) {
        return emptyRoomDao.deleteRoomid(roomid);
    }

    @Override
    public int updatePre(int preid, int stayid) {
        return emptyRoomDao.updatePre(preid, stayid);
    }

    @Override
    public int updateSta(int stayid, int preid) {
        return emptyRoomDao.updateSta(stayid, preid);
    }


    @Override
    public int deleteBypreid(int roomid, int preid) {
        return emptyRoomDao.deleteBypreid(roomid,preid);
    }

    @Override
    public Integer listAllYZ(Integer roomid, Date checkin) {
        return emptyRoomDao.listAllYZ(roomid, checkin);
    }


    @Override
    public List<EmptyroomPo> listByRoomId(Integer roomid) {
       return emptyRoomDao.listByRoomId(roomid);
    }

    @Override
    public List<EmptyroomPo> listByRoomIdAndTime(Integer roomid, java.util.Date timeOne, java.util.Date timeTwo) {
        return emptyRoomDao.listByRoomIdAndTime(roomid,timeOne,timeTwo);
    }

    @Override
    public Integer listsYZ(Integer roomid, Date checkin, Date checkout) {
        return emptyRoomDao.listsYZ(roomid, checkin, checkout);
    }

    @Override
    public EmptyroomPo selectById(Integer id) {
        return emptyRoomDao.selectById(id);
    }
}
