package com.gx.service.impl;

import com.gx.dao.AccountDao;
import com.gx.po.AccountPo;
import com.gx.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service("AccountService")
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountDao accountDao;
    @Override
    public List<AccountPo> getAccount() {
        return accountDao.list();
    }

    @Override
    public int inserAll(AccountPo accountPo) {
        return accountDao.inserAll(accountPo);
    }

    @Override
    public int updateSatus(int id, int status) {
        return accountDao.updateStatus(id, status);
    }

    @Override
    public int delete(int id) {
        return accountDao.deleteAccount(id);
    }
}
