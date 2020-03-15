package com.gx.service.impl;

import com.gx.dao.SupplierDao;
import com.gx.page.Page;
import com.gx.po.PlatformPo;
import com.gx.po.SupplierPo;
import com.gx.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service(value="SupplierService")
public class SupplierServiceImpl implements SupplierService {
    @Autowired
    private SupplierDao supplierDao;


    @Override
    public Page<SupplierPo> pageFuzzyselect(String supplierName, Page<SupplierPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<SupplierPo> list=supplierDao.pageFuzzyselect(supplierName, start, vo.getPageSize());
        vo.setResult(list);
        int count=supplierDao.countFuzzyselect(supplierName);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Integer bySupplier(Integer supplierID) {
        return supplierDao.bySupplier(supplierID);
    }

    @Override
    public List<SupplierPo> listAll() {
        return supplierDao.listAll();
    }


    @Override
    public SupplierPo selectById(Integer id) {
        return supplierDao.selectById(id);
    }

    @Override
    public int deleteById(Integer id) {
        return supplierDao.deleteById(id);
    }

    @Override
    public int insertAll(SupplierPo platformPo) {
        return supplierDao.insertAll(platformPo);
    }

    @Override
    public int updateById(SupplierPo platformPo) {
        return supplierDao.updateById(platformPo);
    }

    @Override
    public List<SupplierPo> fuzzySelect(String supplierName) {
        return supplierDao.fuzzySelect(supplierName);
    }



    @Override
    public int selectYZ(String supplierName) {
        return supplierDao.selectYZ(supplierName);
    }

    @Override
    public int enabledById(Integer id) {
        return supplierDao.enabledById(id);
    }


    @Override
    public Page<SupplierPo> listTrueAll(String name, Page<SupplierPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<SupplierPo> list=supplierDao.listTrueAll(name,start, vo.getPageSize());
        vo.setResult(list);
        int count=supplierDao.listTrueAllCount(name);
        vo.setTotal(count);
        return vo;
    }

    /////////////////////////////////////////////////////////////


    @Override
    public Page<SupplierPo> listHaveTrueAll(String name, Page<SupplierPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<SupplierPo> list=supplierDao.listHaveTrueAll(name,start, vo.getPageSize());
        vo.setResult(list);
        int count=supplierDao.listHaveTrueAllCount(name);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public List<SupplierPo> listHaveAll() {
        return supplierDao.listHaveAll();
    }


    //////////////////////////////////////////////////////////////////////


    @Override
    public Page<SupplierPo> pageAll(String supplierName,Page<SupplierPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<SupplierPo> list=supplierDao.pageAll(supplierName, start, vo.getPageSize());
        vo.setResult(list);
        int count=supplierDao.countAll(supplierName);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public List<SupplierPo> HaveAll() {
        return supplierDao.HaveAll();
    }
}
