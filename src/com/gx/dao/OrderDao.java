package com.gx.dao;

import com.gx.page.Page;
import com.gx.po.OrderPo;
import com.gx.vo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

public interface OrderDao {

    @Transactional
    public Integer inserAll(OrderPo orderPo);
    //条件查询
    public List<OrderDetailsVo> list( @Param("orderNumber")String orderNumber,  @Param("passengerId")Integer passengerId,
                                      @Param("start")int start, @Param("size")int size);



    public Integer countList( @Param("orderNumber")String orderNumber,  @Param("passengerId")Integer passengerId);

    //已入住
    public List<OrderDetailsVo> checkinorder(@Param("orderNumber")String orderNumber,  @Param("passengerId")Integer passengerId,
                                             @Param("start")int start, @Param("size")int size);
    public Integer countcheckinorder( @Param("orderNumber")String orderNumber,  @Param("passengerId")Integer passengerId);
    //已退房
    public List<OrderDetailsVo> checkoutorder(@Param("orderNumber")String orderNumber,  @Param("passengerId")Integer passengerId,
                                              @Param("start")int start, @Param("size")int size);
    public Integer countcheckoutorder( @Param("orderNumber")String orderNumber,  @Param("passengerId")Integer passengerId);
    //已到款
    public List<OrderDetailsVo> myaccount(@Param("orderNumber")String orderNumber,  @Param("passengerId")Integer passengerId,
                                          @Param("start")int start, @Param("size")int size);
    public Integer countmyaccount( @Param("orderNumber")String orderNumber,  @Param("passengerId")Integer passengerId);






    //修改订单状态
    @Transactional
    public Integer updateStatus(@Param("orderNumber")String orderNumber, @Param("status")Integer status);
    //根据订单号查询订单
    public OrderPo selectByOrderNumber(@Param("orderNumber")String orderNumber);

    //查询已确认订单
    public List<OrderDetailsVo> selectCheckinList(@Param("orderNumber")String orderNumber,
                                                  @Param("passengerId") Integer passengerId,
                                                  @Param("time")long time, @Param("start")int start, @Param("size")int size);

    //查询已确认订单
    public int countSelectCheckinList(@Param("orderNumber")String orderNumber,
                                                  @Param("passengerId") Integer passengerId,
                                                  @Param("time")long time);

    //查询订单明细
    public List<OrderDetailsVo> selectOrderDetail(@Param("orderNumber")String orderNumber,
                                                  @Param("start")int start, @Param("size")int size);
    //查询订单明细
    public int countSelectOrderDetail(@Param("orderNumber")String orderNumber);

    public List<OrderDetailsVo> financial(@Param("startTime")long startTime,@Param("endTime")long endTime,
                                          @Param("start")int start, @Param("size")int size);

    public int  countFinancial(@Param("startTime")long startTime,@Param("endTime")long endTime);

    //验证订单号是否存在
    public Integer codeNumberYZ(String orderNumber);

    public List<OrderTimeVo> selectRoomByTime(@Param("time")Timestamp time,
                                              @Param("start")int start, @Param("size")int size);
    public int countSelectRoomByTime(@Param("time")Timestamp time);


    public List<OrderTimeVo> selectRoomPage( @Param("start")int start, @Param("size")int size);
    public List<OrderTimeVo> selectRoom();
    public Integer countSelectRoom();
    public List<OrderTimeVo> selectRoomByTimes(@Param("time")Timestamp time,@Param("list")List<Integer> list);
    public List<OrderTimeVo> selectRoomByin(@Param("idList")List<Integer> idList,@Param("allList")List<Integer> allList);


    public List<IndayVo> checkinDay(@Param("time")String time,
                                    @Param("roomId")int roomId);

    public List<DayRoomNumberVo> selectDayRoom(@Param("time")String time,
                                               @Param("roomId")int roomId);

    public List<OrderTimeVo> selectRooms();

    public List<OrderTimeVo> selectRoomByins(@Param("allList")List<Integer> allList);

    public Integer updateInEnd(@Param("start")String start,@Param("end")String end,
                               @Param("id")Integer id);

    /////////////////////////////////////////////////////////////////////////////////////
    public List<OrderDetailsVo> allContractOrder(@Param("name")String name,@Param("orderNumber")String orderNumber,
                                                 @Param("start")int start, @Param("size")int size);

   public int countallContractOrder(@Param("name")String name,@Param("orderNumber")String orderNumber);
    @Transactional
    public int updateMoney(@Param("id")int id,@Param("time")Timestamp time);

}
