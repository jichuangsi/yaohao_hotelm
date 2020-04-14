package com.gx.dao;

import com.gx.po.AnserPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnserDao {
    public List<AnserPo> listall(@Param("questionId") Integer questionId);
    public Integer insertAll(AnserPo po);

    public Integer updateById(AnserPo po);

    public AnserPo questionById(Integer id);

    public Integer delById(@Param("id") Integer id);
    public Integer delByquestionId(@Param("questionId") Integer questionId);

    public Integer selectByImg(String image);
    public List<String> allAnser();
}
