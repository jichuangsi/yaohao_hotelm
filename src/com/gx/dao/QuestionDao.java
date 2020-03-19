package com.gx.dao;

import com.gx.po.QuestionPo;

import java.util.List;

public interface QuestionDao {

    public List<QuestionPo> list();

    public Integer inserAll();
}
