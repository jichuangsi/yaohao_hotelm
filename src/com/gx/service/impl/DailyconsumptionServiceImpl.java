package com.gx.service.impl;

import com.gx.dao.DailyconsumptionDao;
import com.gx.page.Page;
import com.gx.po.DailyconsumptionPo;
import com.gx.service.DailyconsumptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("DailyconsumptionService")
public class DailyconsumptionServiceImpl implements DailyconsumptionService {
@Autowired
private DailyconsumptionDao dailyconsumptionDao;
    @Override
    public DailyconsumptionPo selectByTimeAndRoom(String time, Integer roomId,Integer cid) {
        return dailyconsumptionDao.selectByTimeAndRoom(time, roomId,cid);
    }

    @Override
    public int insertAll(DailyconsumptionPo po) {
        return dailyconsumptionDao.insertAll(po);
    }

    @Override
    public int updateTimeRoom(DailyconsumptionPo po) {
        return dailyconsumptionDao.updateTimeRoom(po);
    }

    @Override
    public DailyconsumptionPo selectById(Integer id) {
        return dailyconsumptionDao.selectById(id);
    }

    @Override
    public double selectSumMoney(String time, Integer cid, Integer roomId, Integer supplierId) {
        return dailyconsumptionDao.selectSumMoney(time,cid,roomId,supplierId);
    }

    @Override
    public List<DailyconsumptionPo> list() {
        return dailyconsumptionDao.list();
    }

    @Override
    public Integer updateNumberByRoomId(Integer roomId, String roomNumber) {
        return dailyconsumptionDao.updateNumberByRoomId(roomId, roomNumber);
    }

    @Override
    public Page<DailyconsumptionPo> listpage(String time, Page<DailyconsumptionPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<DailyconsumptionPo> list=dailyconsumptionDao.listPage(time, start, vo.getPageSize());
        vo.setResult(list);
        int count=dailyconsumptionDao.countpage(time);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public DailyconsumptionPo financesum(Integer roomId, String time, Integer cid) {
        return dailyconsumptionDao.financesum(roomId, time, cid);
    }

    @Override
    public List<DailyconsumptionPo> dailydateil(Integer roomId,Integer cid,String time) {
        return dailyconsumptionDao.dailydateil(roomId,cid,time);
    }

    @Override
    public Integer updateAll(DailyconsumptionPo po) {
        return dailyconsumptionDao.updateAll(po);
    }

    @Override
    public Integer delByid(Integer id) {
        return dailyconsumptionDao.delById(id);
    }
}
