package com.gx.service.impl;

import com.gx.dao.BookingcommissionDao;
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
}
