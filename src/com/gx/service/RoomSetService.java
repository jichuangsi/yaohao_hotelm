package com.gx.service;

import com.gx.page.Page;
import com.gx.po.RoomSetPo;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public interface RoomSetService {

	   /* public List<RoomSetPo> selectAll( );*/
		
	public int deleteById(Integer id);
		
		
	public int insertAll(RoomSetPo roomSetPo);
		
		
	public RoomSetPo selectById(Integer id);

		
	public int updateById(RoomSetPo roomSetPo);
		
		//模糊查询
/*		public List<RoomSetPo> fuzzyselectPo(@Param("roomNumber")String roomNumber);*/

    //分页加模糊查询
    public Page<RoomSetPo> pageFuzzyselect(String roomNumber, Page<RoomSetPo> vo);

		
	//查询全部
    public List<RoomSetPo> selectAll();
	    
    //根据客房登记来查询
    public List<RoomSetPo> selectByLeveId(Integer id);
	    
	 // 非本派所用  安排房间时 需要改变当前房间的房态
    public int updateByIdToRoomState(RoomSetPo roomSetPo);
	    
	    
    //非本派所用  查询房间信息
    public  List<RoomSetPo> selectInformation(String roomNumber);
	    
   //非本派所用  客服等级来查询房间信息
   public  List<RoomSetPo> levelSelectInformation(Integer guestRoomLevelID);
	   
   /*//ajax 验证是否存在 此房间号
   public int selectYZ(String roomNumber);*/
   //ajax 验证是否存在 此房间号
   public int selectYZ(String roomNumber,Integer supplierID);
//==================================================================================//
    //分页加模糊查询
    public Page<RoomSetPo> pageFuzzy(String roomNumber,int supplierID, Page<RoomSetPo> vo);
    //供应商查询房间信息
    public  List<RoomSetPo> levelSelectSupplier(Integer supplierid);
    //供应商和客服等级 来查询房间信息
    public  List<RoomSetPo> levelSelectInformationAndsupplier(Integer guestRoomLevelID,Integer supplieridD);


    //非本派所用  根据房间号和供应商查询房间信息
    public  List<RoomSetPo> selectInformationAndSupplierid(String roomNumber,Integer supplierid);

    //非本派所用  供应商查询房间信息
    public  List<RoomSetPo> selectSupplierid(Integer supplierid);

    public RoomSetPo selectDetailByIds(Integer id);


    //非本派所用  查询房间信息
    public  List<RoomSetPo> selectBedInformation(String roomNumber);

    //非本派所用  根据房间号和供应商查询房间信息
    public  List<RoomSetPo> selectBedInformationAndSupplierid(String roomNumber,Integer supplierid);

    //非本派所用  供应商查询房间信息
    public  List<RoomSetPo> selectBedSupplierid(Integer supplierid);

    public RoomSetPo selectIDSupplierid(String roomNumber,Integer supplierid);


    public List<RoomSetPo> selectRentAll();

    //供应商和客服等级 来查询房间信息
    public  List<RoomSetPo> levelSelectBedInformationAndsupplier(Integer guestRoomLevelID,Integer supplieridD);

    //非本派所用  客服等级来查询房间信息
    public  List<RoomSetPo> levelSelectBedInformation(Integer guestRoomLevelID);

    //换房散客//================================
    public List<RoomSetPo> selectInformationsRoomNumberSupplier(String roomNumber,Integer supplier);
    public List<RoomSetPo> selectInformationsRoomNumber(String roomNuber);
    public List<RoomSetPo> selectInformationsSupplier(Integer supplier);
    public List<RoomSetPo> selectInformations();

   public List<RoomSetPo> selectInformationsRoomNumberSupplierBed(String roomNuber,Integer supplier,Integer count);

    public List<RoomSetPo> selectAllSupplier(Integer supplier);



    //分页加模糊查询
    public Page<RoomSetPo> pageFuzzyAll(String roomNumber, Integer supplierID, Integer roomStateID,Integer guestRoomLevelID, Page<RoomSetPo> vo);


    //分页加模糊查询
    public Page<RoomSetPo> pageRoomSupper(Integer supplierID,Page<RoomSetPo> vo);

    //分页加模糊查询
    public Page<RoomSetPo> pageRoomSupperNumber( Integer supplierID,String roomNumber,Integer guestRoomLevelID, Page<RoomSetPo> vo);

}
