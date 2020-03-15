package com.gx.dao;

import com.gx.page.Page;
import com.gx.po.PublicOrderPo;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

public interface PublicOrderDao {

    public List<PublicOrderPo> list(@Param("orderNumber") String orderNumber,@Param("pname") String pname
            ,@Param("start") int start,@Param("pageSize") int pageSize);

    public Integer count(@Param("orderNumber") String orderNumber,@Param("pname") String pname);

    public Integer insertAll(PublicOrderPo publicOrderPo);

    public Integer updateStatus(@Param("id")Integer id,@Param("status")Integer status);

    public Integer updateDao(@Param("id")Integer id,@Param("timestamp") Timestamp timestamp);

    public Integer YZ(String orderNumber);

    public List<PublicOrderPo> selectInByTime(@Param("time")String time,@Param("orderNumber") String orderNumber
            ,@Param("pname") String pname ,@Param("start") int start,@Param("pageSize") int pageSize);

    public Integer countInByTime(@Param("time")String time,@Param("orderNumber") String orderNumber
            ,@Param("pname") String pname );


    public List<PublicOrderPo> selectmyfinance(@Param("time")String time,@Param("orderNumber") String orderNumber
            ,@Param("pname") String pname ,@Param("start") int start,@Param("pageSize") int pageSize);

    public Integer countmyfinance(@Param("time")String time,@Param("orderNumber") String orderNumber
            ,@Param("pname") String pname );

    public List<PublicOrderPo> selectOrder(@Param("isdao")Integer isdao,@Param("orderNumber") String orderNumber
            ,@Param("pname") String pname ,@Param("start") int start,@Param("pageSize") int pageSize);

    public Integer countOrder(@Param("isdao")Integer isdao,@Param("orderNumber") String orderNumber
            ,@Param("pname") String pname );
}
