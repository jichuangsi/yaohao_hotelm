package com.gx.po;

public class SupplierPo {

    private Integer id;
    private String supplierName;
    private Integer isenabled;//1启用 2禁用
    private Integer have;//是否为自有  1是 2不是


    public Integer getHave() {
        return have;
    }

    public void setHave(Integer have) {
        this.have = have;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public Integer getIsenabled() {
        return isenabled;
    }

    public void setIsenabled(Integer isenabled) {
        this.isenabled = isenabled;
    }
}
