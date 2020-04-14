package com.gx.service;

import com.gx.po.AnserPo;

import java.util.List;

public interface AnserService {

    public List<AnserPo> listall(Integer questionId);
    public Integer insertAll(AnserPo po);

    public Integer updateById(AnserPo po);

    public AnserPo questionById(Integer id);

    public Integer delById(Integer id);
    public Integer delByquestionId(Integer questionId);
    public Integer selectByImg(String image);
    public List<String> allAnser();
}
