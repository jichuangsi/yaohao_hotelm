package com.gx.service.impl;

import com.gx.dao.RoomSetDao;
import com.gx.page.Page;
import com.gx.po.RoomSetPo;
import com.gx.service.RoomSetService;
import com.gx.vo.OrderTimeVo;
import com.gx.vo.RoomVo;
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
	public Page<RoomVo> haveRoom(String roomNumber, Integer guestRoomLevelID, Page<RoomVo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<RoomVo> list=this.roomSetDao.pageHaveRoom(roomNumber,guestRoomLevelID,start, vo.getPageSize());
		vo.setResult(list);

		int count=this.roomSetDao.countHaveRoom(roomNumber,guestRoomLevelID);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public RoomSetPo selectIDSupplierid(String roomNumber, Integer supplierid) {
		return roomSetDao.selectIDSupplierid(roomNumber, supplierid);
	}

	@Override
	public int selectYZ(String roomNumber, Integer supplierID) {
		return roomSetDao.selectYZ(roomNumber, supplierID);
	}

	@Override
	public RoomVo selectDetailByIds(int id) {
		return roomSetDao.selectDetailByIds(id);
	}

	@Override
	public List<RoomSetPo> selectHave() {
		return roomSetDao.selectHave();
	}


	@Override
	public Integer roomAcountById(Integer id, Integer roomAcount) {
		return roomSetDao.roomAcountById(id, roomAcount);
	}

	@Override
	public List<RoomSetPo> roomByHotelm(Integer id) {
		return roomSetDao.roomByHotelm(id);
	}
}
