package com.gx.service.impl;

import com.gx.dao.ConsumptiontypeDao;
import com.gx.po.ConsumptiontypePo;
import com.gx.service.ConsumptiontypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service("ConsumptiontypeService")
public class ConsumptiontypeServiceImpl implements ConsumptiontypeService {
    @Autowired
    private ConsumptiontypeDao consumptiontypeDao;


    @Override
    public List<ConsumptiontypePo> list() {
        return consumptiontypeDao.list();
    }

    @Override
    public int inserAll(ConsumptiontypePo po) {
        return consumptiontypeDao.inserAll(po);
    }

    @Override
    public int update(ConsumptiontypePo po) {
        return consumptiontypeDao.update(po);
    }

    @Override
    public Integer delete(Integer id) {
        return consumptiontypeDao.delete(id);
    }

    @Override
    public ConsumptiontypePo nameYZ(String name) {
        return consumptiontypeDao.nameYZ(name);
    }

    @Override
    public Integer updateStatus(Integer status, Integer id) {
        return consumptiontypeDao.updateStatus(status, id);
    }

    @Override
    public List<ConsumptiontypePo> listAll() {
        return consumptiontypeDao.listAll();
    }
}
