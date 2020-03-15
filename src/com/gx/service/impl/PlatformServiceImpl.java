package com.gx.service.impl;

import com.gx.dao.PlatformDao;
import com.gx.page.Page;
import com.gx.po.PlatformPo;
import com.gx.service.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service(value="PlatformService")
public class PlatformServiceImpl implements PlatformService {
   @Autowired
    private PlatformDao platformDao;

    @Override
    public List<PlatformPo> listAll() {
        return platformDao.listAll();
    }

    /*@Override
    public String selectCode(Integer id) {
        return platformDao.selectCode(id);
    }*/

    @Override
    public PlatformPo selectById(Integer id) {
        return platformDao.selectById(id);
    }

    @Override
    public int deleteById(Integer id) {
        return platformDao.deleteById(id);
    }

    @Override
    public int enabledById(Integer id) {
       return platformDao.enabledById(id);
    }

    @Override
    public int insertAll(PlatformPo platformPo) {
        return platformDao.insertAll(platformPo);
    }

    @Override
    public int updateById(PlatformPo platformPo) {
        return platformDao.updateById(platformPo);
    }

    @Override
    public List<PlatformPo> fuzzySelect(String name) {
        return platformDao.fuzzySelect(name);
    }

    @Override
    public Page<PlatformPo> pageFuzzyselect(String name, Page<PlatformPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<PlatformPo> list=platformDao.pageFuzzyselect(name, start, vo.getPageSize());
        vo.setResult(list);
        int count=platformDao.countFuzzyselect(name);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public List<PlatformPo> pageFuzzyselects(String name, Page<PlatformPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<PlatformPo> list=platformDao.pageFuzzyselect(name, start, vo.getPageSize());
        vo.setResult(list);
        return list;
    }

    @Override
    public int count(String name) {
        int count=platformDao.countFuzzyselect(name);
        return count;
    }

    @Override
    public int selectYZ(String name) {
        return platformDao.selectYZ(name);
    }

    //////////////////////////////////////////////////////////////////



}
