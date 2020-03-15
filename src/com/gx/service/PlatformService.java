package com.gx.service;

import com.gx.page.Page;
import com.gx.po.PlatformPo;

import java.util.List;

public interface PlatformService {

    public List<PlatformPo> listAll();

   // public String selectCode(Integer code);
    //根据ID删除
    public int deleteById(Integer id);
    public int enabledById(Integer id);

    //添加
    public int insertAll(PlatformPo platformPo);

    //根据ID查询
    public PlatformPo selectById(Integer id);

    //根据ID修改
    public int updateById(PlatformPo platformPo);


    //分页需要
    public Page<PlatformPo> pageFuzzyselect(String name, Page<PlatformPo> vo);
   public List<PlatformPo> pageFuzzyselects(String name, Page<PlatformPo> vo);

   public int count(String name);
    //无分页的模糊查询  非本派所用
    public List<PlatformPo> fuzzySelect(String name);

    //ajax 验证是否存在 此平台
    public int selectYZ(String name);



}
