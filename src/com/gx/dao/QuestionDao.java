package com.gx.dao;

import com.gx.po.QuestionPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionDao {

    public List<QuestionPo> list(@Param("title") String title,@Param("start")int start,@Param("pageSize")  int pageSize);
    public List<QuestionPo> listall(@Param("title") String title);
    public Integer count(@Param("title") String title);
    public Integer inserAll(QuestionPo po);

    public Integer updateById(QuestionPo po);

}
