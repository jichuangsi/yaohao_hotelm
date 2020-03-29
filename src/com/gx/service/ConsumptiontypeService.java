package com.gx.service;

import com.gx.po.AccountPo;
import com.gx.po.ConsumptiontypePo;

import java.util.List;

public interface ConsumptiontypeService {

    public List<ConsumptiontypePo> list();

    public int inserAll(ConsumptiontypePo po);
    public int update(ConsumptiontypePo po);

    public Integer delete(Integer id);

    public ConsumptiontypePo nameYZ(String name);

    public Integer updateStatus(Integer status,Integer id);
    public List<ConsumptiontypePo> listAll();
}
