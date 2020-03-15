package com.gx.dao;

import com.gx.po.BookingcommissionPo;

import java.util.List;

public interface BookingcommissionDao {
    public List<BookingcommissionPo> list(String name);

    public int inserAll(BookingcommissionPo po);

    public BookingcommissionPo selectMoney(String time);
}
