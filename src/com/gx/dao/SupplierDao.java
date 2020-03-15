package com.gx.dao;

import com.gx.po.PlatformPo;
import com.gx.po.SupplierPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SupplierDao {

    //查询所有平台
    public List<SupplierPo> listAll();
    //根据ID删除
    public int deleteById(@Param("id")Integer id);

    public int enabledById(@Param("id")Integer id);

    //添加
    public int insertAll(SupplierPo supplierPo);

    //根据ID查询
    public SupplierPo selectById(Integer id);

    //根据ID修改
    public int updateById(SupplierPo supplierPo);


    //分页需要
    public List<SupplierPo> pageFuzzyselect(@Param("supplierName")String supplierName, @Param("start") int start, @Param("pageSize") int pageSize);


    //分页模糊查询总条数
    public int countFuzzyselect(@Param("supplierName") String supplierName);

    //无分页的模糊查询  非本派所用
    public List<SupplierPo> fuzzySelect(String supplierName);

    //ajax 验证是否存在 此平台
    public int selectYZ(String supplierName);





    List<SupplierPo> listTrueAll(@Param("name")String name, @Param("start") int start, @Param("pageSize") int pageSize);
    int listTrueAllCount( @Param("name")String name);

    List<SupplierPo> listHaveTrueAll(@Param("name")String name, @Param("start") int start, @Param("pageSize") int pageSize);

    int listHaveTrueAllCount( @Param("name")String name);

    public List<SupplierPo> listHaveAll();

    /////////////////////////////////////////////////////////////////////

    //分页需要
    public List<SupplierPo> pageAll(@Param("supplierName")String supplierName, @Param("start") int start, @Param("pageSize") int pageSize);


    //分页模糊查询总条数
    public int countAll(@Param("supplierName") String supplierName);

    public List<SupplierPo> HaveAll();

    public Integer bySupplier(Integer supplierID);
}
