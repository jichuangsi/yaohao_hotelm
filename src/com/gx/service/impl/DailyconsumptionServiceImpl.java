package com.gx.service.impl;

import com.gx.dao.DailyconsumptionDao;
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
    public DailyconsumptionPo selectByTimeAndRoom(String time, int roomId,int cid) {
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
    public DailyconsumptionPo selectById(int id) {
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
}
