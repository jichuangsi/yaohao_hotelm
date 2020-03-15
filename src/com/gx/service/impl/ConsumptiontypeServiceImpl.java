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
    public int delete(int id) {
        return consumptiontypeDao.delete(id);
    }
}
