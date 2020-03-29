package com.gx.service.impl;

import com.gx.dao.QuestionDao;
import com.gx.page.Page;
import com.gx.po.QuestionPo;
import com.gx.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("QuestionService")
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionDao questionDao;
 @Override
    public Page<QuestionPo> list(String name, Page<QuestionPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<QuestionPo> list=questionDao.list(name,start, vo.getPageSize());
        vo.setResult(list);
        int count=questionDao.count(name);
        vo.setTotal(count);
        return vo;
    }
  @Override
  public List<QuestionPo> listall(String name) {

      List<QuestionPo> list=questionDao.listall(name);

      return list;
  }
    @Override
    public Integer inserAll(QuestionPo po) {
        return questionDao.insertAll(po);
    }

    @Override
    public Integer updateById(QuestionPo po) {
        return questionDao.updateById(po);
    }

    @Override
    public QuestionPo questionById(Integer id) {
        return questionDao.questionById(id);
    }

    @Override
    public Integer deleteById(Integer id) {
        return questionDao.deleteById(id);
    }
}
