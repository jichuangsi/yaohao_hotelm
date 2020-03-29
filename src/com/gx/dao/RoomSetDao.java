package com.gx.dao;

import com.gx.page.Page;
import com.gx.po.RoomSetPo;
import com.gx.vo.OrderTimeVo;
import com.gx.vo.RoomVo;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public interface RoomSetDao {
	
    /*public List<RoomSetPo> selectAll( );*/
	
	public int deleteById(Integer id);
	
	
	public int insertAll(RoomSetPo roomSetPo);
	
	
	public RoomSetPo selectById(Integer id);

	
	public int updateById(RoomSetPo roomSetPo);


	public List<RoomVo> pageHaveRoom(@Param("roomNumber") String roomNumber,
                                     @Param("guestRoomLevelID") Integer guestRoomLevelID,
                                     @Param("start") int start, @Param("pageSize") int pageSize);

	public int countHaveRoom(@Param("roomNumber") String roomNumber,
                             @Param("guestRoomLevelID") Integer guestRoomLevelID);

    //ajax 验证是否存在 此房间号
    public int selectYZ(@Param("roomNumber")String roomNumber,@Param("supplierID")Integer supplierID);

    public List<RoomSetPo> pageRoomSupper( @Param("supplierID")Integer supplierID,
                                        @Param("start") int start, @Param("pageSize") int pageSize);

    public Integer countpageRoomSupper(@Param("supplierID")Integer supplierID);
    //判断房间是否重复
    public RoomSetPo selectIDSupplierid(@Param("roomNumber")String roomNumber,@Param("supplierID")Integer supplierID);



    public List<RoomSetPo> pageFuzzyselect(@Param("roomNumber") String roomNumber, @Param("start") int start, @Param("pageSize") int pageSize);

    //分页模糊查询总条数
    public int countFuzzyselect(String roomNumber);

    public RoomVo selectDetailByIds(int id);

    //查询空床
    public  List<RoomSetPo> selectAll();
    //查询无人入住房间
    public  List<RoomSetPo> selectKong();
//查询入住房间
    public  List<RoomSetPo> selectRoom();
//查询时间段内有空床的房间
    public List<Integer> selectTimeKong(@Param("time")Timestamp time);
    //查询时间段内有空的房间的空床位
    public Integer slectRoomBend(Integer roomId);

    //根据有空床位的房间信息
    public OrderTimeVo selectRoomByRoomId(Integer roomId);

    public List<RoomSetPo> selectHave();


    public Integer roomAcountById(@Param("id")Integer id,@Param("roomAcount")Integer roomAcount);
}
