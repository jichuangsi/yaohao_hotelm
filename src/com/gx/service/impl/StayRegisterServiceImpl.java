package com.gx.service.impl;

import com.gx.dao.StayRegisterDao;
import com.gx.page.Page;
import com.gx.po.StayRegisterPo;
import com.gx.service.StayRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

@Transactional
@Service(value="stayRegisterService")
public class StayRegisterServiceImpl implements StayRegisterService {

	@Autowired
	private StayRegisterDao stayRegisterDao;
	
	@Override
	public int insertAll(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.insertAll(stayRegisterPo);
	}

	@Override
	public Page<StayRegisterPo> pageFuzzyselectOne(int receiveTargeTypeID,
                                                   int isBillID, String roomNumber, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectOne(receiveTargeTypeID, isBillID, roomNumber,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectOne(receiveTargeTypeID, isBillID,roomNumber);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public StayRegisterPo selectById(Integer id) {
		return this.stayRegisterDao.selectById(id);
	}

	@Override
	public int insertStayregisterdetails(int stayRegisterID, int passengerID,String codeNumber,int platformID) {
		return stayRegisterDao.insertStayregisterdetails(stayRegisterID, passengerID,codeNumber,platformID);
	}

	@Override
	public int insertDeposit(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.insertDeposit(stayRegisterPo);
	}

	@Override
	public List<StayRegisterPo> selectDepositById(int id) {
		return stayRegisterDao.selectDepositById(id);
	}

	@Override
	public int insertConsumptiondetails(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.insertConsumptiondetails(stayRegisterPo);
	}

	@Override
	public Page<StayRegisterPo> pageConsumption(int consumptionStayRegisterID, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageConsumption(consumptionStayRegisterID, start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countConsumption(consumptionStayRegisterID);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public int deleteConsumption(Integer id) {
		return stayRegisterDao.deleteConsumption(id);
	}

	@Override
	public int updateSumConst(int id, Double sumConst) {
		return stayRegisterDao.updateSumConst(id, sumConst);
	}

	@Override
	public List<StayRegisterPo> selectMoney(int id) {
		return stayRegisterDao.selectMoney(id);
	}

	@Override
	public List<StayRegisterPo> selectChangRoom(int id) {
		return stayRegisterDao.selectChangRoom(id);
	}

	@Override
	public List<StayRegisterPo> selectAll() {
		return stayRegisterDao.selectAll();
	}

	@Override
	public int updateRemind(int id, int remind) {
		return stayRegisterDao.updateRemind(id, remind);
	}

	@Override
	public int updateChangRoom(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.updateChangRoom(stayRegisterPo);
	}

	@Override
	public int pay(int id, String remarks, Timestamp payTime, int payWay) {
		return stayRegisterDao.pay(id, remarks, payTime, payWay);
	}

	@Override
	public Page<StayRegisterPo> pageFuzzyselectTwo(int receiveTargetID,
                                                   int isBillID, String roomNumber, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectTwo(receiveTargetID, isBillID, roomNumber,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectTwo(receiveTargetID, isBillID, roomNumber);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public List<StayRegisterPo> selectFormTeamId(int receiveTargetID,
                                                 int isBillID) {
		return this.stayRegisterDao.selectFormTeamId(receiveTargetID, isBillID);
	}

	@Override
	public List<StayRegisterPo> selectTeamDeposit(int receiveTargetID) {
		return this.stayRegisterDao.selectTeamDeposit(receiveTargetID);
	}

	@Override
	public List<StayRegisterPo> selectTeamConsumption(int receiveTargetID) {
		return this.stayRegisterDao.selectTeamConsumption(receiveTargetID);
	}

	@Override
	public List<StayRegisterPo> ajaxSelectTeamRoom(int receiveTargetID,
                                                   String roomNumber) {
		return this.stayRegisterDao.ajaxSelectTeamRoom(receiveTargetID, roomNumber);
	}

	@Override
	public List<StayRegisterPo> ajaxSelectTeamFormTime(int receiveTargetID,
                                                       Timestamp min, Timestamp max) {
		return this.stayRegisterDao.ajaxSelectTeamFormTime(receiveTargetID, min, max);
	}

	@Override
	public List<StayRegisterPo> ajaxSelectTeamDeposit(int receiveTargetID,
                                                      Timestamp min, Timestamp max) {
		return this.stayRegisterDao.ajaxSelectTeamDeposit(receiveTargetID, min, max);
	}

	@Override
	public List<StayRegisterPo> ajaxSelectTeamConsumption(int receiveTargetID,
                                                          Timestamp min, Timestamp max) {
		return this.stayRegisterDao.ajaxSelectTeamConsumption(receiveTargetID, min, max);
	}

	@Override
	public List<StayRegisterPo> selectDepositJinJianBan(int id) {
		return this.stayRegisterDao.selectDepositJinJianBan(id);
	}

	@Override
	public List<StayRegisterPo> selectConsumptionJinJianBan(int id) {
		return this.stayRegisterDao.selectConsumptionJinJianBan(id);
	}

	@Override
	public StayRegisterPo selectInformationXiangQingBan(int id) {
		return this.stayRegisterDao.selectInformationXiangQingBan(id);
	}

	@Override
	public int changOverTeam(int id, int receiveTargetID) {
		return this.stayRegisterDao.changOverTeam(id, receiveTargetID);
	}

	@Override
	public List<StayRegisterPo> selectFormTeamIdTwo(int isBillID) {
		return this.stayRegisterDao.selectFormTeamIdTwo(isBillID);
	}

	@Override
	public Page<StayRegisterPo> pageFuzzyselectThree(int isBillID,
                                                     String roomNumber, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectThree(isBillID, roomNumber,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectThree(isBillID, roomNumber);
		vo.setTotal(count);
		return vo;
	}


	@Override
	public List<StayRegisterPo> selectShuJuTongJi(Timestamp min, Timestamp max) {
		return this.stayRegisterDao.selectShuJuTongJi(min, max);
	}
	
	
	
	
	
	
	
	
	
	
/*-------------------------------------FinancialStatistics--------------------------------------------------------*/

	@Override
	public Page<StayRegisterPo> pageFuzzyselectFour(Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectFour(start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectFour();
		vo.setTotal(count);
		return vo;
	}

	@Override
	public Page<StayRegisterPo> pageFuzzyselectFive(Timestamp min,
                                                    Timestamp max, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectFive(min, max,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectFive(min, max);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public List<StayRegisterPo> selectPayJingJianBanNot() {
		return this.stayRegisterDao.selectPayJingJianBanNot();
	}
	@Override
	public List<StayRegisterPo> selectPayJingJianBanNotf() {
		return this.stayRegisterDao.selectPayJingJianBanNotf();
	}

	@Override
	public List<StayRegisterPo> selectPayStayNumberNot() {
		return this.stayRegisterDao.selectPayStayNumberNot();
	}

	@Override
	public List<StayRegisterPo> selectPayXiaoFeiNot() {
		return this.stayRegisterDao.selectPayXiaoFeiNot();
	}
	@Override
	public List<StayRegisterPo> selectPayXiaoFeiNotf() {
		return this.stayRegisterDao.selectPayXiaoFeiNotf();
	}

	@Override
	public List<StayRegisterPo> selectPayJingJianBan(Timestamp min,
                                                     Timestamp max) {
		return this.stayRegisterDao.selectPayJingJianBan(min, max);
	}
	@Override
	public List<StayRegisterPo> selectPayJingJianBanf(Timestamp min,
													 Timestamp max) {
		return this.stayRegisterDao.selectPayJingJianBanf(min, max);
	}
	@Override
	public List<StayRegisterPo> selectPayStayNumber(Timestamp min, Timestamp max) {
		return this.stayRegisterDao.selectPayStayNumber(min, max);
	}

	@Override
	public List<StayRegisterPo> selectPayXiaoFei(Timestamp min, Timestamp max) {
		return this.stayRegisterDao.selectPayXiaoFei(min, max);
	}
	@Override
	public List<StayRegisterPo> selectPayXiaoFeif(Timestamp min, Timestamp max) {
		return this.stayRegisterDao.selectPayXiaoFeif(min, max);
	}
	@Override
	public List<StayRegisterPo> selectAllInformation(int id) {
		return this.stayRegisterDao.selectAllInformation(id);
	}

	@Override
	public List<StayRegisterPo> selectXiaoFeiMingXi(int id) {
		return this.stayRegisterDao.selectXiaoFeiMingXi(id);
	}

	@Override
	public int updateStayRegisterPredetermineID(Integer predetermineID,
			Integer id) {
		return this.stayRegisterDao.updateStayRegisterPredetermineID(predetermineID, id);
	}

	@Override
	public StayRegisterPo selectSumconst(int id) {
		return this.stayRegisterDao.selectSumconst(id);
	}


	@Override
	public Integer updateDepoit(Integer id, Integer depoist) {
		return stayRegisterDao.updateDepoit(id,depoist);
	}

	//=====================================================================================================================//

	@Override
	public List<StayRegisterPo> roomConsumption(Integer id) {
		return stayRegisterDao.roomConsumption(id);
	}

	@Override
	public StayRegisterPo selectByStayId(Integer id) {
		return stayRegisterDao.selectByStayId(id);
	}
	/*@Override
	public StayRegisterPo selectByStayId(Integer id,Timestamp registerTime) {
		return stayRegisterDao.selectByStayId(id,registerTime);
	}*/

	@Override
	public Page<StayRegisterPo> pageFuzzyselectOrder(int receiveTargeTypeID,
													 int isBillID,String ordernumber, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectOrder(receiveTargeTypeID,isBillID,ordernumber, start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectOrder(receiveTargeTypeID,isBillID,ordernumber);
		vo.setTotal(count);
		return vo;
	}


	@Override
	public Page<StayRegisterPo> pageFuzzyselectThrees(int isBillID,
													 String orderID, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectThrees(isBillID, orderID,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectThrees(isBillID, orderID);
		vo.setTotal(count);
		return vo;
	}
	@Override
	public Page<StayRegisterPo> pageFuzzyselectTwos(int receiveTargetID,
												   int isBillID, String orderID, Page<StayRegisterPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<StayRegisterPo> list=stayRegisterDao.pageFuzzyselectTwos(receiveTargetID, isBillID, orderID,start, vo.getPageSize());
		vo.setResult(list);
		int count=stayRegisterDao.countFuzzyselectTwos(receiveTargetID, isBillID, orderID);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public int getID(String codeNumber) {
		return stayRegisterDao.getID(codeNumber);
	}

	@Override
	public String orderIDBystayid(int id) {
		return stayRegisterDao.orderIDBystayid(id);
	}

	@Override
	public int codeNumberYZ(String codeNumber) {
		return stayRegisterDao.codeNumberYZ(codeNumber);
	}

	@Override
	public Integer selectPredetermineById(Integer id) {
		return stayRegisterDao.selectPredetermineById(id);
	}

	@Override
	public Integer selectStaCount(Integer supplierid) {
		return stayRegisterDao.selectStaCount(supplierid);
	}

	@Override
	public Integer selectStaPlatform(Integer platformid) {
		return stayRegisterDao.selectStaPlatform(platformid);
	}

	@Override
	public Integer confirmReceipt(Integer id, Integer isdao) {
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		return stayRegisterDao.confirmReceipt(id,timestamp,isdao);
	}


	@Override
	public List<StayRegisterPo> fuzzyselectAll() {
		return stayRegisterDao.fuzzyselectAll();
	}

	@Override
	public int countAll() {
		return stayRegisterDao.countAll();
	}
	@Override
	public List<StayRegisterPo> fuzzyselectAllTwo(Timestamp min, Timestamp max) {
		return stayRegisterDao.fuzzyselectAllTwo(min, max);
	}

	@Override
	public int countAllTwo(Timestamp min, Timestamp max) {
		return stayRegisterDao.countAllTwo(min, max);
	}


	@Override
	public List<StayRegisterPo> selectPayTime() {
		return stayRegisterDao.selectPayTime();
	}



	@Override
	public int regiserTime(StayRegisterPo stayRegisterPo) {
		return stayRegisterDao.regiserTime(stayRegisterPo);
	}


	////////////////////////////////////

	@Override
	public StayRegisterPo selectSP(Integer id) {
		return stayRegisterDao.selectSP(id);
	}

	@Override
	public int pay2(int id, Timestamp payTime, int currency) {
		return stayRegisterDao.pay2(id, payTime, currency);
	}

	@Override
	public StayRegisterPo getsID(String codeNumber) {
		return stayRegisterDao.getsID(codeNumber);
	}
}
