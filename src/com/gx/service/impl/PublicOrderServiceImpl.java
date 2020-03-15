package com.gx.service.impl;

import com.gx.dao.PublicOrderDao;
import com.gx.page.Page;
import com.gx.po.FinancePo;
import com.gx.po.PublicOrderPo;
import com.gx.service.PublicOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Transactional
@Service("PublicOrderService")
public class PublicOrderServiceImpl implements PublicOrderService {

    @Autowired
    private PublicOrderDao publicOrderDao;
    @Override
    public Page<PublicOrderPo> list(String orderNumber, String pname, Page<PublicOrderPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<PublicOrderPo> list=publicOrderDao.list(orderNumber,pname,start, vo.getPageSize());
        vo.setResult(list);
        int count=publicOrderDao.count(orderNumber,pname);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Integer insertAll(PublicOrderPo publicOrderPo) {
        return publicOrderDao.insertAll(publicOrderPo);
    }

    @Override
    public Integer updateStatus(Integer id, Integer status) {
        return publicOrderDao.updateStatus(id, status);
    }

    @Override
    public Integer updateDao(Integer id,Timestamp time) {
        return publicOrderDao.updateDao(id,time);
    }

    @Override
    public Integer YZ(String orderNumber) {
        return publicOrderDao.YZ(orderNumber);
    }

    @Override
    public Page<PublicOrderPo> selectInByTime(String time, String orderNumber, String pname,Page<PublicOrderPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<PublicOrderPo> list=publicOrderDao.selectInByTime(time,orderNumber,pname,start, vo.getPageSize());
        vo.setResult(list);
        Integer count=publicOrderDao.countInByTime(time,orderNumber,pname);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Page<PublicOrderPo> selectmyfinance(String time, String orderNumber, String pname, Page<PublicOrderPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<PublicOrderPo> list=publicOrderDao.selectmyfinance(time,orderNumber,pname,start, vo.getPageSize());
        vo.setResult(list);
        Integer count=publicOrderDao.countmyfinance(time,orderNumber,pname);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Page<PublicOrderPo> selectOrder(Integer isdao, String orderNumber, String pname, Page<PublicOrderPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<PublicOrderPo> list=publicOrderDao.selectOrder(isdao,orderNumber,pname,start, vo.getPageSize());
        vo.setResult(list);
        Integer count=publicOrderDao.countOrder(isdao,orderNumber,pname);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public List<PublicOrderPo> selectfinance(String time, String orderNumber, String pname, Integer start, Integer pageSize) {
        int start1=0;
        if (start>1) {
            start1=(start-1)*pageSize;
        }
        return publicOrderDao.selectmyfinance(time,orderNumber,pname,start1,pageSize);
    }
}
