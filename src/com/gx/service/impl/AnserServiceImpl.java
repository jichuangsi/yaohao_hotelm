package com.gx.service.impl;

import com.gx.dao.AnserDao;
import com.gx.po.AnserPo;
import com.gx.service.AnserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("AnserService")
public class AnserServiceImpl implements AnserService {
    @Autowired
    private AnserDao anserDao;
    @Override
    public List<AnserPo> listall(Integer questionId) {
        return anserDao.listall(questionId);
    }

    @Override
    public Integer insertAll(AnserPo po) {
        return anserDao.insertAll(po);
    }

    @Override
    public Integer updateById(AnserPo po) {
        return anserDao.updateById(po);
    }

    @Override
    public AnserPo questionById(Integer id) {
        return anserDao.questionById(id);
    }

    @Override
    public Integer delById(Integer id) {
        return anserDao.delById(id);
    }

    @Override
    public Integer delByquestionId(Integer questionId) {
        return anserDao.delByquestionId(questionId);
    }

    @Override
    public Integer selectByImg(String image) {
        return anserDao.selectByImg(image);
    }

    @Override
    public List<String> allAnser() {
        return anserDao.allAnser();
    }
}
