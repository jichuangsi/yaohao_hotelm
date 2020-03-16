package com.gx.vo;

import com.gx.po.AccountPo;
import com.gx.po.PlatformPo;
import com.gx.po.SupplierPo;

import java.util.ArrayList;
import java.util.List;

public class Model {

    List<SupplierPo> slist=new ArrayList<>();//自有酒店
    List<AccountPo> alist=new ArrayList<>();//账户
    List<PlatformPo> plist=new ArrayList<>();
    List<OrderTimeVo> list=new ArrayList<>();

    public List<SupplierPo> getSlist() {
        return slist;
    }

    public void setSlist(List<SupplierPo> slist) {
        this.slist = slist;
    }

    public List<AccountPo> getAlist() {
        return alist;
    }

    public void setAlist(List<AccountPo> alist) {
        this.alist = alist;
    }

    public List<PlatformPo> getPlist() {
        return plist;
    }

    public void setPlist(List<PlatformPo> plist) {
        this.plist = plist;
    }

    public List<OrderTimeVo> getList() {
        return list;
    }

    public void setList(List<OrderTimeVo> list) {
        this.list = list;
    }
}
