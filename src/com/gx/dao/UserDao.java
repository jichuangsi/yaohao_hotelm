package com.gx.dao;

import com.gx.po.UserPo;
import org.apache.ibatis.annotations.Param;

;import java.util.List;

public interface UserDao {
	
	public UserPo selectLogin(UserPo user);

	//分页模糊查询
	public List<UserPo> pageFuzzyselect(@Param("name") String name,
										@Param("start") int start, @Param("pageSize") int pageSize);

	//分页模糊查询总条数
	public int countFuzzyselect(@Param("name") String name);


	public int insertAll(UserPo userPo);

	public UserPo selectById(Integer id);

	public int updateById(UserPo userPo);

	public int deleteById(Integer id);

	//ajax 验证是否存在 名字
	public int selectYZ(String name);

	//分页需要
	public List<UserPo>fuzzyselect(String name);
}
