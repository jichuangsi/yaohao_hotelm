package com.gx.dao;

import com.gx.po.ConsumptiontypePo;

import java.util.List;

public interface ConsumptiontypeDao {
    public List<ConsumptiontypePo> list();

    public int inserAll(ConsumptiontypePo po);
    public int update(ConsumptiontypePo po);

    public int delete(int id);
}
