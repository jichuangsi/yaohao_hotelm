package com.gx.service;

import com.gx.page.Page;
import com.gx.po.QuestionPo;

import java.util.List;

public interface QuestionService {

    public Page<QuestionPo> list(String name,Page<QuestionPo> vo);

    public List<QuestionPo> listall(String name);

    public Integer inserAll(QuestionPo po);

    public Integer updateById(QuestionPo po);

   public QuestionPo questionById(Integer id);

    public Integer deleteById(Integer id);
}
