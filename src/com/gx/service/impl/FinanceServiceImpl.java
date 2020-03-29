package com.gx.service.impl;

import com.gx.dao.FinanceDao;
import com.gx.page.Page;
import com.gx.po.FinancePo;
import com.gx.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Transactional
@Service("FinanceService")
public class FinanceServiceImpl implements FinanceService {
    @Autowired
    private FinanceDao financeDao;
    @Override
    public Page<FinancePo> list(String time,Page<FinancePo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<FinancePo> list=financeDao.pageFinance(time,start, vo.getPageSize());
        vo.setResult(list);
        int count=financeDao.countFinance(time);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public int countFinanceM(String yearM,int roomId) {
        return financeDao.countFinanceM(yearM,roomId);
    }

    @Override
    public int updateOtherById(FinancePo po) {
        return financeDao.updateOtherById(po);
    }

    @Override
    public int updateRentById(FinancePo po) {
        return financeDao.updateRentById(po);
    }

    @Override
    public int updateById(FinancePo po) {
        return financeDao.updateById(po);
    }

    @Override
    public FinancePo selectById(int id) {
        return financeDao.selectById(id);
    }

    @Override
    public FinancePo selectByyearM(String yearM,Integer roomId) {
        return financeDao.selectByyearM(yearM,roomId);
    }

    @Override
    public int updatePHP(FinancePo po) {
        return financeDao.updatePHP(po);
    }

    @Override
    public int updateRMB(FinancePo po) {
        return financeDao.updateRMB(po);
    }

    @Override
    public int insertAll(FinancePo po) {
        return financeDao.insertAll(po);
    }

    @Override
    public int slectCountRoom() {
        return financeDao.slectCountRoom();
    }

    @Override
    public List<FinancePo> list(String time) {
        return financeDao.listtime(time);
    }

    @Override
    public Integer updateRoomNuberByRoomId(Integer roomId, String roomNumber) {
        return financeDao.updateRoomNuberByRoomId(roomId, roomNumber);
    }
}
