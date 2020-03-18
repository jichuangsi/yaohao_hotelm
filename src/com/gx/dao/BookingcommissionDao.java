package com.gx.dao;

import com.gx.po.BookingcommissionPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookingcommissionDao {
    public List<BookingcommissionPo> list(String name);

    public int inserAll(BookingcommissionPo po);

    public BookingcommissionPo selectMoney(String time);

    public BookingcommissionPo select(BookingcommissionPo po);

    public Integer updateTimeRoom(BookingcommissionPo po);

    public List<BookingcommissionPo> selectAll(@Param("name")String name,@Param("sart")Integer sart,@Param("pageSize")Integer pageSize);

    public Integer countselectAll(@Param("name")String name);
}
