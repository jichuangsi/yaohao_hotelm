package com.gx.service;

import com.gx.page.Page;
import com.gx.po.PlatformPo;
import com.gx.po.SupplierPo;

import java.util.List;

public interface SupplierService {

    //查询所有平台
    public List<SupplierPo> listAll();

    //根据ID删除
    public int deleteById(Integer id);

    //添加
    public int insertAll(SupplierPo supplierPo);

    //根据ID查询
    public SupplierPo selectById(Integer id);

    //根据ID修改
    public int updateById(SupplierPo supplierPo);


    //分页需要
    public Page<SupplierPo> pageFuzzyselect(String supplierName, Page<SupplierPo> vo);

    //无分页的模糊查询  非本派所用
    public List<SupplierPo> fuzzySelect(String supplierName);

    //ajax 验证是否存在 此平台
    public int selectYZ(String supplierName);
    //启用
    public int enabledById(Integer id);

    ///////////////////////////////////////////////////////////////////
    public Page<SupplierPo> listTrueAll(String name, Page<SupplierPo> vo);

    public Page<SupplierPo> listHaveTrueAll(String name, Page<SupplierPo> vo);


   public List<SupplierPo> listHaveAll();

   ////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////

    //分页需要
    Page<SupplierPo> pageAll(String supplierName,Page<SupplierPo> vo);



    public List<SupplierPo> HaveAll();

    public Integer bySupplier(Integer supplierID);
}
