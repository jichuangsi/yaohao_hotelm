package com.gx.service;

import com.gx.po.AccountPo;

import java.util.List;

public interface AccountService {

    public List<AccountPo> getAccount();

    public int inserAll(AccountPo accountPo);
    public int updateSatus(int id,int status);

    public int delete(int id);
}
