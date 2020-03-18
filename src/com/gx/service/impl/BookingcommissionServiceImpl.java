package com.gx.service.impl;

import com.gx.dao.BookingcommissionDao;
import com.gx.page.Page;
import com.gx.po.BookingcommissionPo;
import com.gx.service.BookingcommissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service("BookingcommissionService")
public class BookingcommissionServiceImpl implements BookingcommissionService {

    @Autowired
    private BookingcommissionDao bookingcommissionDao;
   

    @Override
    public List<BookingcommissionPo> list(String name) {
        return bookingcommissionDao.list(name);
    }

    @Override
    public int inserAll(BookingcommissionPo po) {
        return bookingcommissionDao.inserAll(po);
    }

    @Override
    public BookingcommissionPo selectMoney(String time) {
        return bookingcommissionDao.selectMoney(time);
    }

    @Override
    public BookingcommissionPo select(BookingcommissionPo po) {
        return bookingcommissionDao.select(po);
    }

    @Override
    public Integer updateTimeRoom(BookingcommissionPo po) {
        return bookingcommissionDao.updateTimeRoom(po);
    }

    @Override
    public Page<BookingcommissionPo> listall(String name, Page<BookingcommissionPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<BookingcommissionPo> list=bookingcommissionDao.selectAll(name, start, vo.getPageSize());
        vo.setResult(list);
        int count=bookingcommissionDao.countselectAll(name);
        vo.setTotal(count);
        return vo;
    }
}
