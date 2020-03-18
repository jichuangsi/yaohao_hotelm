package com.gx.service.impl;

import com.gx.dao.UserDao;
import com.gx.page.Page;
import com.gx.po.UserPo;
import com.gx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public UserPo selectLogin(UserPo user) {
		// TODO Auto-generated method stub
		return userDao.selectLogin(user);
	}

	@Override
	public Page<UserPo> pageFuzzyselect(String name, Page<UserPo> vo) {
		int start=0;
		if (vo.getCurrentPage()>1) {
			start=(vo.getCurrentPage()-1)*vo.getPageSize();
		}
		List<UserPo> list=userDao.pageFuzzyselect(name, start, vo.getPageSize());
		vo.setResult(list);
		int count=userDao.countFuzzyselect(name);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public int insertAll(UserPo userPo) {
		return userDao.insertAll(userPo);
	}

	@Override
	public int updateById(UserPo userPo) {
		return userDao.updateById(userPo);
	}

	@Override
	public int deleteById(Integer id) {
		return userDao.deleteById(id);
	}

	@Override
	public int selectYZ(String name) {
		return userDao.selectYZ(name);
	}

	@Override
	public UserPo selectById(Integer id) {
		return userDao.selectById(id);
	}

	@Override
	public List<UserPo> fuzzyselect(String name) {
		return userDao.fuzzyselect(name);
	}
}
