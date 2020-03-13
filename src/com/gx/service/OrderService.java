package com.gx.service;

import com.gx.page.Page;
import com.gx.po.OrderPo;
import com.gx.vo.IndayVo;
import com.gx.vo.OrderDetailsVo;
import com.gx.vo.OrderTimeVo;

import java.sql.Timestamp;
import java.util.List;

public interface OrderService {

    //添加订单
    public Integer inserAll(OrderPo orderPo);
        //已确认
    public Page<OrderDetailsVo> list(String orderNumber, Integer passengerId, Page<OrderDetailsVo> vo);
    //已入住
    public Page<OrderDetailsVo> checkinorder(String orderNumber, Integer passengerId, Page<OrderDetailsVo> vo);
    //已退房
    public Page<OrderDetailsVo> checkoutorder(String orderNumber, Integer passengerId, Page<OrderDetailsVo> vo);
    //已到款
    public Page<OrderDetailsVo> myaccount(String orderNumber, Integer passengerId, Page<OrderDetailsVo> vo);

    //修改订单状态
    public Integer updateStatus(String orderNumber, Integer status);
   //根据订单号查询订单
    public OrderPo selectByOrderNumber(String orderNumber);
    //查询已确认订单
    public Page<OrderDetailsVo> selectCheckinList(String orderNumber, Integer passengerId,long time, Page<OrderDetailsVo> vo);

    //查询订单明细
    public Page<OrderDetailsVo> selectOrderDetail(String orderNumber,Page<OrderDetailsVo> vo);

    public Page<OrderDetailsVo> financial(long startTime,long endTime,Page<OrderDetailsVo> vo);

    //验证订单号是否存在
   public Integer codeNumberYZ(String orderNumber);

    public Page<OrderTimeVo> selectRoomByTime(Timestamp time, Page<OrderTimeVo> vo);

    public List<IndayVo> checkinDay(String time, int roomId);

    public int updateMoney(int id,Timestamp time);

/////////////////////////////////////////////////////////////////////////////////////////////////////

    public Page<OrderDetailsVo> allContractOrder(String name,String orderNumber,Page<OrderDetailsVo> vo);




}
