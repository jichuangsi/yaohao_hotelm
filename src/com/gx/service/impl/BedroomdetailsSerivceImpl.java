package com.gx.service.impl;

import com.gx.dao.BedroomdetailsDao;
import com.gx.po.BedroomdetailsPo;
import com.gx.service.BedroomdetailsSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service(value="BedroomdetailsSerivce")
public class BedroomdetailsSerivceImpl implements BedroomdetailsSerivce {
    @Autowired
    private BedroomdetailsDao bedroomdetailsDao;

    @Override
    public int inserAll(BedroomdetailsPo bedroomdetailsPo) {
        return bedroomdetailsDao.inserAll(bedroomdetailsPo);
    }

    @Override
    public int selectcount(Integer bedroomid) {
        return bedroomdetailsDao.selectcount(bedroomid);
    }

   /* @Override
    public int updatestatus(Integer bedroomid, Integer islikai) {
        return bedroomdetailsDao.updatestatus(bedroomid,islikai);
    }*/

    @Override
    public int updatestatuspre(Integer bedroomid, Integer preid) {
        return bedroomdetailsDao.updatestatuspre(bedroomid, preid);
    }

    @Override
    public int updatestatusstay(Integer bedroomid, Integer stayid) {
        return bedroomdetailsDao.updatestatusstay(bedroomid, stayid);
    }

    @Override
    public Integer updateall(Integer bedroomid, Integer predeid, Integer stayid) {
        return bedroomdetailsDao.updateall(bedroomid, predeid, stayid);
    }

    /*@Override
    public List<BedroomdetailsPo> selectAll(Integer bedroomid) {
        return bedroomdetailsDao.selectAll(bedroomid);
    }*/
}
