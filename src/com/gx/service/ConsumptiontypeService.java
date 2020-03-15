package com.gx.service;

import com.gx.po.AccountPo;
import com.gx.po.ConsumptiontypePo;

import java.util.List;

public interface ConsumptiontypeService {

    public List<ConsumptiontypePo> list();

    public int inserAll(ConsumptiontypePo po);
    public int update(ConsumptiontypePo po);

    public int delete(int id);
}
