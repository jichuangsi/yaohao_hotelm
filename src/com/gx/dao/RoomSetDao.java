package com.gx.dao;

import com.gx.page.Page;
import com.gx.po.PredeterminePo;
import com.gx.po.RoomSetPo;
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
	
	//模糊查询
	/*public List<RoomSetPo> fuzzyselectPo(@Param("roomNumber")String roomNumber);*/
	
	
	//分页模糊查询
    public List<RoomSetPo> pageFuzzyselect(@Param("roomNumber") String roomNumber, @Param("start") int start, @Param("pageSize") int pageSize);
    
    //分页模糊查询总条数
    public int countFuzzyselect(String roomNumber);
    
    //查询全部
    public List<RoomSetPo> selectAll();
    
    //根据客房登记来查询
    public List<RoomSetPo> selectByLeveId(Integer id);
    
    //ajax 验证是否存在 此房间号
    public int selectYZ(@Param("roomNumber")String roomNumber,@Param("supplierID")Integer supplierID);
    
    
    
    
    
    
    
    
    // 非本派所用  安排房间时 需要改变当前房间的房态
    public int updateByIdToRoomState(RoomSetPo roomSetPo);
    
    //非本派所用  查询房间信息
    public  List<RoomSetPo> selectInformation(String roomNumber);
    
    //非本派所用  客服等级来查询房间信息
    public  List<RoomSetPo> levelSelectInformation(Integer guestRoomLevelID);
    /////////[=====================================================================================================//
    //分页模糊查询
    public List<RoomSetPo> pageFuzzy(@Param("roomNumber") String roomNumber,@Param("supplierID")int supplierID, @Param("start") int start, @Param("pageSize") int pageSize);

    //分页模糊查询总条数
    public int countFuzzy(@Param("roomNumber") String roomNumber,@Param("supplierID")int supplierID);

    //供应商查询房间信息
    public  List<RoomSetPo> levelSelectSupplier(Integer supplierid);
    //供应商和客服等级 来查询房间信息
    public  List<RoomSetPo> levelSelectInformationAndsupplier(@Param("guestRoomLevelID") Integer guestRoomLevelID,@Param("supplierid") Integer supplierid);

    //非本派所用  根据房间号和供应商查询房间信息
    public  List<RoomSetPo> selectInformationAndSupplierid(@Param("roomNumber")String roomNumber,@Param("supplierid")Integer supplierid);

    //非本派所用  供应商查询房间信息
    public  List<RoomSetPo> selectSupplierid(Integer supplierid);

    public RoomSetPo selectDetailByIds(Integer id);

    //非本派所用  查询房间信息
    public  List<RoomSetPo> selectBedInformation(String roomNumber);

    //非本派所用  根据房间号和供应商查询房间信息
    public  List<RoomSetPo> selectBedInformationAndSupplierid(@Param("roomNumber")String roomNumber,@Param("supplierid")Integer supplierid);

    //非本派所用  供应商查询房间信息
    public  List<RoomSetPo> selectBedSupplierid(Integer supplierid);

    public RoomSetPo selectIDSupplierid(@Param("roomNumber")String roomNumber,@Param("supplierid")Integer supplierid);

    public List<RoomSetPo> selectRentAll();
    //供应商和客服等级 来查询房间信息
    public  List<RoomSetPo> levelSelectBedInformationAndsupplier(@Param("guestRoomLevelID") Integer guestRoomLevelID,@Param("supplierid") Integer supplierid);

    //非本派所用  客服等级来查询房间信息
    public  List<RoomSetPo> levelSelectBedInformation(Integer guestRoomLevelID);

    //换房散客//================================
    public List<RoomSetPo> selectInformationsRoomNumberSupplier(@Param("roomNumber")String roomNumber,@Param("supplier")Integer supplier);
    public List<RoomSetPo> selectInformationsRoomNumber(@Param("roomNuber")String roomNuber);
    public List<RoomSetPo> selectInformationsSupplier(@Param("supplier")Integer supplier);
    public List<RoomSetPo> selectInformations();

    public List<RoomSetPo> selectInformationsRoomNumberSupplierBed(@Param("roomNuber")String roomNuber,@Param("supplier")Integer supplier,@Param("count")Integer count);


    public List<RoomSetPo> selectAllSupplier(@Param("supplier")Integer supplier);

    //分页加模糊查询
    public List<RoomSetPo> pageFuzzyAll(@Param("roomNumber")String roomNumber, @Param("supplierID")Integer supplierID,
                                        @Param("roomStateID")Integer roomStateID
                                        ,@Param("guestRoomLevelID")Integer guestRoomLevelID,
                                        @Param("start") int start, @Param("pageSize") int pageSize);

    public Integer countFuzzyselectAll(@Param("roomNumber")String roomNumber, @Param("supplierID")Integer supplierID,
                                       @Param("roomStateID")Integer roomStateID
                                        ,@Param("guestRoomLevelID")Integer guestRoomLevelID);



   /* //分页加模糊查询
    public List<RoomSetPo> pageEmptyRooms(@Param("roomNumber")String roomNumber, @Param("timeOne") Date timeOne,
                                          @Param("timeTwo")Date timeTwo, @Param("start") int start, @Param("pageSize") int pageSize);

    public Integer countEmptyRoomsAll(@Param("roomNumber")String roomNumber,
                                       @Param("timeOne") Date timeOne,@Param("timeTwo") Date timeTwo);
*/



    //分页加模糊查询
    public List<RoomSetPo> pageRoomSupper( @Param("supplierID")Integer supplierID,
                                        @Param("start") int start, @Param("pageSize") int pageSize);

    public Integer countpageRoomSupper(@Param("supplierID")Integer supplierID);

    //分页加模糊查询
    public List<RoomSetPo> pageRoomSupperNumber( @Param("supplierID")Integer supplierID,@Param("roomNumber")String roomNumber
            , @Param("guestRoomLevelID")Integer guestRoomLevelID,
                                           @Param("start") int start, @Param("pageSize") int pageSize);

    public Integer countpageRoomSupperNumber(@Param("supplierID")Integer supplierID,@Param("roomNumber")String roomNumber
    , @Param("guestRoomLevelID")Integer guestRoomLevelID);
}
