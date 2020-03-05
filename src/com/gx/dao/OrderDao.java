package com.gx.dao;

import com.gx.po.OrderPo;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.PUBLIC_MEMBER;

import java.util.List;

public interface OrderDao {

    public Integer inserAll(@Param("orderID") String orderID, @Param("status")Integer status,
                            @Param("platformId") int platformId,@Param("stayDetailsId") int stayDetailsId
    ,@Param("predeterID") int predeterID);
    //根据订单号修改订单状态
    public Integer upadeStatus(@Param("orderID")String orderID,@Param("status")int status);

    public Integer updateStatuaByCS(@Param("orderID")String orderID,@Param("status")int status,@Param("stayDetailsId")Integer stayDetailsId);

    public OrderPo selectStatua(String orderID);

    public List<OrderPo> listAll(@Param("orderID")String orderID, @Param("start") int start, @Param("pageSize") int pageSize);

    //分页模糊查询总条数
    public int countFuzzyselect(@Param("orderID") String orderID);

    public Integer deletedorder(String orderID);

    public String selectBypredetermineID(Integer predeterID);

    public Integer codeNumberYZ(String orderID);

    //根据住宿id查订单号
    public OrderPo byID(Integer id);

    public OrderPo selectBypredeID(Integer predeterID);
}
