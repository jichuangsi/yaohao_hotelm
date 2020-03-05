package com.gx.service.impl;

import com.gx.dao.OrderDao;
import com.gx.page.Page;
import com.gx.po.OrderPo;
import com.gx.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("OrderService")
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;


    @Override
    public Integer inserAll(String codeNumber,Integer status,int platformID,int stayDetailsId,int predeterID) {
       return orderDao.inserAll(codeNumber, status, platformID,stayDetailsId,predeterID);
    }

    @Override
    public Integer updateStatua(String orderID,int status) {

        return orderDao.upadeStatus(orderID,status);
    }

    @Override
    public Integer updateStatuaByCS(String orderID, int status, Integer stayDetailsId) {
        return  orderDao.updateStatuaByCS(orderID,status,stayDetailsId);
    }

    @Override
    public OrderPo selectStatua(String orderID) {
        return orderDao.selectStatua(orderID);
    }

    @Override
    public Page<OrderPo> listAll(String codeNumber,Page<OrderPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<OrderPo> list=orderDao.listAll(codeNumber, start, vo.getPageSize());
        vo.setResult(list);
        int count=orderDao.countFuzzyselect(codeNumber);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Integer deletedorder(String codeNumber) {
        return orderDao.deletedorder(codeNumber);
    }

    @Override
    public String selectBypredetermineID(Integer predeterID) {
        return orderDao.selectBypredetermineID(predeterID);
    }

    @Override
    public Integer codeNumberYZ(String orderID) {
        return orderDao.codeNumberYZ(orderID);
    }

    @Override
    public OrderPo byID(Integer id) {
        return orderDao.byID(id);
    }

    @Override
    public OrderPo selectBypredeID(Integer predeterID) {
        return orderDao.selectBypredeID(predeterID);
    }
}
