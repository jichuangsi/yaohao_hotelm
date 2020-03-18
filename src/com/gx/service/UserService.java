package com.gx.service;

import com.gx.page.Page;
import com.gx.po.UserPo;

import java.util.List;

public interface UserService {

	public UserPo selectLogin(UserPo user);

	//分页需要
	public Page<UserPo> pageFuzzyselect(String name, Page<UserPo> vo);


	public int insertAll(UserPo userPo);

	public UserPo selectById(Integer id);

	public int updateById(UserPo userPo);

	public int deleteById(Integer id);

	//ajax 验证是否存在 名字
	public int selectYZ(String name);


	//分页需要
	public List<UserPo>fuzzyselect(String name);
}
