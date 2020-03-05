package com.gx.service;

import com.gx.page.Page;
import com.gx.po.EmptyroomPo;

import java.sql.Date;
import java.util.List;

public interface EmptyRoomSerivce {

    public int inserAll(EmptyroomPo emptyroomPo);

    public int deleteByid(EmptyroomPo emptyroomPo);

    public int upadtecheck(EmptyroomPo emptyroomPo);

    public Page<EmptyroomPo> listAll(String roomAcount, Date checkin, Date checkout, Page<EmptyroomPo> vo);

    public Page<EmptyroomPo> listSelectAll(String roomAcount,Page<EmptyroomPo> vo);
    //判断是否为空调的数据
    public  List<EmptyroomPo> selectOneAndNull(Integer roomid);

    public int upadte(EmptyroomPo emptyroomPo);


    public int deleteRoomid(Integer roomid);

    public int updatePre(int preid,int stayid);

    public int updateSta(int stayid,int preid);

    public int deleteBypreid(int roomid,int preid);

    public Integer listAllYZ(Integer roomid,Date checkin);



    ///////////////////////////////////////////////////
    public List<EmptyroomPo> listByRoomId(Integer roomid);
    public List<EmptyroomPo> listByRoomIdAndTime(Integer roomid, java.util.Date timeOne, java.util.Date timeTwo);

    public Integer listsYZ(Integer roomid,Date checkin,Date checkout);

    public EmptyroomPo selectById(Integer id);

}
