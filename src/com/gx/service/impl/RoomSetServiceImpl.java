package com.gx.service.impl;

import com.gx.dao.RoomSetDao;
import com.gx.page.Page;
import com.gx.po.RoomSetPo;
import com.gx.service.RoomSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Transactional
@Service(value="roomSetService")
public class RoomSetServiceImpl implements RoomSetService {

	@Autowired
	private RoomSetDao roomSetDao;
	
	/*@Override
	public List<RoomSetPo> selectAll() {
		return roomSetDao.selectAll();
	}
*/
	@Override
	public int deleteById(Integer id) {
		return roomSetDao.deleteById(id);
	}

	@Override
	public int insertAll(RoomSetPo roomSetPo) {
		return roomSetDao.insertAll(roomSetPo);
	}

	@Override
	public RoomSetPo selectById(Integer id) {
		return roomSetDao.selectById(id);
	}

	@Override
	public int updateById(RoomSetPo roomSetPo) {
		return roomSetDao.updateById(roomSetPo);
	}

	//模糊查询
	/*@Override
	public List<RoomSetPo> fuzzyselectPo(String roomNumber) {
		return roomSetDao.fuzzyselectPo(roomNumber);
	}*/
   


//分页的模糊查询
	@Override
	public Page<RoomSetPo> pageFuzzyselect(String roomNumber, Page<RoomSetPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<RoomSetPo> list=this.roomSetDao.pageFuzzyselect(roomNumber,start, vo.getPageSize());
		vo.setResult(list);

		int count=this.roomSetDao.countFuzzyselect(roomNumber);
		vo.setTotal(count);
		return vo;
	}
	@Override
	public List<RoomSetPo> selectAll() {
		return roomSetDao.selectAll();
	}

	@Override
	public List<RoomSetPo> selectByLeveId(Integer id) {
		return roomSetDao.selectByLeveId(id);
	}

	@Override
	public int updateByIdToRoomState(RoomSetPo roomSetPo) {
		return roomSetDao.updateByIdToRoomState(roomSetPo);
	}

	@Override
	public List<RoomSetPo> selectInformation(String roomNumber) {
		return roomSetDao.selectInformation(roomNumber);
	}

	@Override
	public List<RoomSetPo> levelSelectInformation(Integer guestRoomLevelID) {
		return this.roomSetDao.levelSelectInformation(guestRoomLevelID);
	}

	@Override
	public int selectYZ(String roomNumber,Integer supplierID) {
		return this.roomSetDao.selectYZ(roomNumber,supplierID);
	}

//=====================================================================================================================//
//分页的模糊查询
@Override
public Page<RoomSetPo> pageFuzzy(String roomNumber,int supplierID, Page<RoomSetPo> vo) {
	int start=0;
	if (vo.getCurrentPage()>1) {
		start=(vo.getCurrentPage()-1)*vo.getPageSize();
	}
	List<RoomSetPo> list=this.roomSetDao.pageFuzzy(roomNumber,supplierID,start, vo.getPageSize());
	vo.setResult(list);

	int count=this.roomSetDao.countFuzzy(roomNumber,supplierID);
	vo.setTotal(count);
	return vo;
}


	@Override
	public List<RoomSetPo> levelSelectInformationAndsupplier(Integer guestRoomLevelID, Integer supplierid) {
		return roomSetDao.levelSelectInformationAndsupplier(guestRoomLevelID, supplierid);
	}

	@Override
	public List<RoomSetPo> levelSelectSupplier(Integer supplierid) {
		return roomSetDao.levelSelectSupplier(supplierid);
	}

	@Override
	public List<RoomSetPo> selectInformationAndSupplierid(String roomNumber, Integer supplierid) {
		return roomSetDao.selectInformationAndSupplierid(roomNumber,supplierid);
	}

	@Override
	public List<RoomSetPo> selectSupplierid(Integer supplierid) {
		return roomSetDao.selectSupplierid(supplierid);
	}

	@Override
	public RoomSetPo selectDetailByIds(Integer id) {
		return roomSetDao.selectDetailByIds(id);
	}



	@Override
	public List<RoomSetPo> selectBedInformation(String roomNumber) {
		return roomSetDao.selectBedInformation(roomNumber);
	}

	@Override
	public List<RoomSetPo> selectBedInformationAndSupplierid(String roomNumber, Integer supplierid) {
		return roomSetDao.selectBedInformationAndSupplierid(roomNumber, supplierid);
	}

	@Override
	public List<RoomSetPo> selectBedSupplierid(Integer supplierid) {
		return roomSetDao.selectBedSupplierid(supplierid);
	}

	@Override
	public RoomSetPo selectIDSupplierid(String roomNumber, Integer supplierid) {
		return roomSetDao.selectIDSupplierid(roomNumber, supplierid);
	}

	@Override
	public List<RoomSetPo> selectRentAll() {
		return roomSetDao.selectRentAll();
	}

	@Override
	public List<RoomSetPo> levelSelectBedInformationAndsupplier(Integer guestRoomLevelID, Integer supplieridD) {
		return roomSetDao.levelSelectBedInformationAndsupplier(guestRoomLevelID, supplieridD);
	}

	@Override
	public List<RoomSetPo> levelSelectBedInformation(Integer guestRoomLevelID) {
		return roomSetDao.levelSelectBedInformation(guestRoomLevelID);
	}

	@Override
	public List<RoomSetPo> selectInformations() {
		return roomSetDao.selectInformations();
	}

	@Override
	public List<RoomSetPo> selectInformationsRoomNumber(String roomNuber) {
		return roomSetDao.selectInformationsRoomNumber(roomNuber);
	}

	@Override
	public List<RoomSetPo> selectInformationsRoomNumberSupplier(String roomNumber, Integer supplier) {
		return roomSetDao.selectInformationsRoomNumberSupplier(roomNumber, supplier);
	}

	@Override
	public List<RoomSetPo> selectInformationsSupplier(Integer supplier) {
		return roomSetDao.selectInformationsSupplier(supplier);
	}

	@Override
	public List<RoomSetPo> selectInformationsRoomNumberSupplierBed(String roomNuber, Integer supplier,Integer count) {
		return roomSetDao.selectInformationsRoomNumberSupplierBed(roomNuber, supplier,count);
	}

	@Override
	public List<RoomSetPo> selectAllSupplier(Integer supplier) {
		return roomSetDao.selectAllSupplier(supplier);
	}

	/*@Override
	public List<RoomSetPo> selectInformationsBed() {
		return roomSetDao.selectInformationsBed();
	}

	@Override
	public List<RoomSetPo> selectInformationsRoomNumberBed(String roomNuber) {
		return roomSetDao.selectInformationsRoomNumberBed(roomNuber);
	}



	@Override
	public List<RoomSetPo> selectInformationsSupplierBed(Integer supplier) {
		return roomSetDao.selectInformationsSupplierBed(supplier);
	}*/

	@Override
	public Page<RoomSetPo> pageFuzzyAll(String roomNumber, Integer supplierID, Integer roomStateID,
										Integer guestRoomLevelID,Page<RoomSetPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<RoomSetPo> list=this.roomSetDao.pageFuzzyAll(roomNumber,supplierID,roomStateID,guestRoomLevelID,start, vo.getPageSize());
		vo.setResult(list);

		int count=this.roomSetDao.countFuzzyselectAll(roomNumber, supplierID, roomStateID,guestRoomLevelID);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public Page<RoomSetPo> pageRoomSupper(Integer supplierID, Page<RoomSetPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<RoomSetPo> list=this.roomSetDao.pageRoomSupper(supplierID,start, vo.getPageSize());
		vo.setResult(list);

		int count=this.roomSetDao.countpageRoomSupper(supplierID);
		vo.setTotal(count);
		return vo;
	}
	@Override
	public Page<RoomSetPo> pageRoomSupperNumber(Integer supplierID, String roomNumber,Integer guestRoomLevelID, Page<RoomSetPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<RoomSetPo> list=this.roomSetDao.pageRoomSupperNumber(supplierID,roomNumber,guestRoomLevelID,start, vo.getPageSize());
		vo.setResult(list);

		int count=this.roomSetDao.countpageRoomSupperNumber(supplierID,roomNumber,guestRoomLevelID);
		vo.setTotal(count);
		return vo;
	}
}
