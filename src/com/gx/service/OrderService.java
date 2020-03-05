package com.gx.service;

import com.gx.page.Page;
import com.gx.po.OrderPo;

import java.util.List;

public interface OrderService {

    public Integer inserAll(String codeNumber,Integer status,int platformID,int stayDetailsId,int predeterID);

    //根据订单号修改订单状态updateStatuaByCS
    public Integer updateStatua(String orderID,int status);
    public Integer updateStatuaByCS(String orderID,int status,Integer stayDetailsId);

    public OrderPo selectStatua(String orderID);

    public Page<OrderPo> listAll(String codeNumber,Page<OrderPo> vo);

    public Integer deletedorder(String codeNumber);

    public String selectBypredetermineID(Integer predeterID);

    public Integer codeNumberYZ(String orderID);

    //根据住宿id查订单号
    public OrderPo byID(Integer id);

    public OrderPo selectBypredeID(Integer predeterID);


}
