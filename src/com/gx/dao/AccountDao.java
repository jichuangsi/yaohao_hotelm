package com.gx.dao;

import com.gx.po.AccountPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountDao {
    public List<AccountPo> list();

    public int inserAll(AccountPo accountPo);
    public int updateStatus(@Param("id") int id,@Param("status") int status);

    public int deleteAccount(int id);
}
