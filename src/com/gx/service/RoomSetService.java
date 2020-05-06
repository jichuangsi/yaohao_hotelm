package com.gx.service;

import com.gx.page.Page;
import com.gx.po.RoomSetPo;
import com.gx.vo.OrderTimeVo;
import com.gx.vo.RoomVo;
import com.gx.vo.WholeOrderRoomVo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public interface RoomSetService {


    public int insertAll(RoomSetPo roomSetPo);

    public RoomSetPo selectById(Integer id);

    public Page<RoomVo> haveRoom(String roomNumber,Integer guestRoomLevelID,Page<RoomVo> vo);
    //分页加模糊查询
    public Page<RoomSetPo> pageRoomSupper(Integer supplierID,Page<RoomSetPo> vo);

    public int deleteById(Integer id);


    public int updateById(RoomSetPo roomSetPo);

    public RoomSetPo selectIDSupplierid(String roomNumber,Integer supplierid);

    public int selectYZ(String roomNumber,Integer supplierID);

    public RoomVo selectDetailByIds(int id);

    public List<RoomSetPo> selectHave();

    public Integer roomAcountById(Integer id,Integer roomAcount);

    public List<RoomSetPo> roomByHotelm(Integer id);

    //=====================================整租==========================================================================//
    public List<WholeOrderRoomVo> selectSupplierByGuest(Integer guestid);
    public List<WholeOrderRoomVo> selectSupplier();
    public List<RoomSetPo> roomByHotelAndGuest(Integer guestid,Integer supplierId);
}
