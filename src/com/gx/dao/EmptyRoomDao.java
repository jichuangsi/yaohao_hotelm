package com.gx.dao;

import com.gx.po.EmptyroomPo;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.PUBLIC_MEMBER;

import java.sql.Date;
import java.util.List;

public interface EmptyRoomDao {

    public int inserAll(EmptyroomPo emptyroomPo);



    public int upadtecheck(EmptyroomPo emptyroomPo);

    public List<EmptyroomPo> listAll(@Param("roomNumber") String roomNumber, @Param("checkin")Date checkin,@Param("checkout") Date checkout
            , @Param("start") int start, @Param("pageSize") int pageSize);

    public int listAllCount(@Param("roomNumber") String roomNumber, @Param("checkin")Date checkin,@Param("checkout") Date checkout);

    public List<EmptyroomPo> listSelectAll(@Param("roomNumber") String roomNumber,@Param("start") int start, @Param("pageSize") int pageSize);

    public int listSelectAllCount(@Param("roomNumber") String roomNumber);

    public  List<EmptyroomPo> selectOneAndNull(Integer roomid);

    public int deleteByid(EmptyroomPo emptyroomPo);

    public int upadte(EmptyroomPo emptyroomPo);

    public int deleteRoomid(Integer roomid);

    public int updatePre(@Param("preid") int preid,@Param("stayid") int stayid);

    public int updateSta(@Param("stayid") int stayid,@Param("preid") int preid);

    public int deleteBypreid(@Param("roomid") int roomid,@Param("preid") int preid);


    public Integer listAllYZ(@Param("roomid") Integer roomid, @Param("checkin")Date checkin);

   public List<EmptyroomPo> listByRoomId(@Param("roomid") Integer roomid);

    public List<EmptyroomPo> listByRoomIdAndTime(@Param("roomid")Integer roomid,
                                                 @Param("timeOne")java.util.Date timeOne,@Param("timeTwo") java.util.Date timeTwo);



    public Integer listsYZ(@Param("roomid") Integer roomid, @Param("checkin")Date checkin,@Param("checkout")Date checkout);

    public EmptyroomPo selectById(@Param("id")Integer id);
}
