package com.gx.service;

import com.gx.po.BookingcommissionPo;

import java.util.List;

public interface BookingcommissionService {

    public List<BookingcommissionPo> list(String name);

    public int inserAll(BookingcommissionPo po);

}
