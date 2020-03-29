package com.gx.dao;

import com.gx.po.ConsumptiontypePo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ConsumptiontypeDao {
    public List<ConsumptiontypePo> list();

    public int inserAll(ConsumptiontypePo po);
    public int update(ConsumptiontypePo po);

    public Integer delete(Integer id);

    public ConsumptiontypePo nameYZ(String name);

    public Integer updateStatus(@Param("status") Integer status,@Param("id") Integer id);

    public List<ConsumptiontypePo> listAll();
}
