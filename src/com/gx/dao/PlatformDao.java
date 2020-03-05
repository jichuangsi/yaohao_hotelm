package com.gx.dao;

import com.gx.page.Page;
import com.gx.po.PlatformPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlatformDao {
    //查询所有平台
  public   List<PlatformPo> listAll();

  /*public   String selectCode(@Param("id") Integer id);*/

    //根据ID删除
    public int deleteById(@Param("id")Integer id);
  public int enabledById(@Param("id")Integer id);
    //添加
    public int insertAll(PlatformPo platformPo);

    //根据ID查询
    public PlatformPo selectById(Integer id);

    //根据ID修改
    public int updateById(PlatformPo platformPo);


    //分页需要
    public List<PlatformPo> pageFuzzyselect(@Param("name")String name, @Param("start") int start, @Param("pageSize") int pageSize);


    //分页模糊查询总条数
    public int countFuzzyselect(@Param("name") String name);

    //无分页的模糊查询  非本派所用
    public List<PlatformPo> fuzzySelect(String name);

    //ajax 验证是否存在 此平台
    public int selectYZ(String name);


    /////////////////////////////////////////////////////////


}
