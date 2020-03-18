package com.gx.service;

import com.gx.page.Page;
import com.gx.po.BookingcommissionPo;

import java.util.List;

public interface BookingcommissionService {

    public List<BookingcommissionPo> list(String name);

    public Page<BookingcommissionPo> listall(String name,Page<BookingcommissionPo> vo);

    public int inserAll(BookingcommissionPo po);

    public BookingcommissionPo selectMoney(String time);

    public BookingcommissionPo select(BookingcommissionPo po);

    public Integer updateTimeRoom(BookingcommissionPo po);
}
