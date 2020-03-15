package com.gx.service;

import com.gx.page.Page;
import com.gx.po.PublicOrderPo;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
import java.util.List;

public interface PublicOrderService {

    public Page<PublicOrderPo> list(String orderNumber, String pname, Page<PublicOrderPo> vo);

    public Integer insertAll(PublicOrderPo publicOrderPo);

    public Integer updateStatus(@Param("id")Integer id,@Param("status")Integer status);

    public Integer updateDao(Integer id, Timestamp timestamp);

    public Integer YZ(String orderNumber);

    public Page<PublicOrderPo> selectInByTime(String time,String orderNumber,String pname, Page<PublicOrderPo> vo);


    public Page<PublicOrderPo> selectmyfinance(@Param("time")String time,@Param("orderNumber") String orderNumber
            ,@Param("pname") String pname, Page<PublicOrderPo> vo);

    public Page<PublicOrderPo> selectOrder(Integer isdao,String orderNumber
            ,String pname, Page<PublicOrderPo> vo);

    public List<PublicOrderPo> selectfinance(String time,String orderNumber
            , String pname,Integer start,Integer pageSize);

}
