package com.gx.service.impl;

import com.gx.dao.ReceiveTargetDao;
import com.gx.page.Page;
import com.gx.po.ReceiveTargetPo;
import com.gx.service.ReceiveTargetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service(value="receiveTargetService")
public class ReceiveTargetServiceImpl implements ReceiveTargetService {

	@Autowired
	private ReceiveTargetDao receiveTargetDao;

	@Override
	public int deleteById(Integer id) {
		return receiveTargetDao.deleteById(id);
	}

	@Override
	public int insertAll(ReceiveTargetPo receiveTargetPo) {
		return receiveTargetDao.insertAll(receiveTargetPo);
	}

	@Override
	public ReceiveTargetPo selectById(Integer id) {
		return receiveTargetDao.selectById(id);
	}

	@Override
	public int updateById(ReceiveTargetPo receiveTargetPo) {
		return receiveTargetDao.updateById(receiveTargetPo);
	}

	@Override
	public Page<ReceiveTargetPo> pageFuzzyselect(String teamName, Page<ReceiveTargetPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<ReceiveTargetPo> list=receiveTargetDao.pageFuzzyselectone(teamName, start, vo.getPageSize());
		vo.setResult(list);
		int count=receiveTargetDao.countFuzzyselectone(teamName);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public List<ReceiveTargetPo> ajaxSelect(String teamName) {
		return receiveTargetDao.ajaxSelect(teamName);
	}

	@Override
	public int selectYZ(String teamCode) {
		return this.receiveTargetDao.selectYZ(teamCode);
	}


/*	@Override
	public Page<ReceiveTargetPo> pageFuzzyselectOrder(String ordernumber, Page<ReceiveTargetPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<ReceiveTargetPo> list=receiveTargetDao.pageFuzzyselects(ordernumber, start, vo.getPageSize());
		vo.setResult(list);
		int count=receiveTargetDao.countFuzzyselects(ordernumber);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public ReceiveTargetPo selectOrderDetails(String codeNumber) {
		return receiveTargetDao.selectOrderDetails(codeNumber);
	}

	@Override
	public Integer updateStatus(String codeNumber, Integer orderStatus) {
		return receiveTargetDao.updateStatus(codeNumber,orderStatus);
	}*/
}
