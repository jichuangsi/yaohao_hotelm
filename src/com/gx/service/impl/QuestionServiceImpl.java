package com.gx.service.impl;

import com.gx.dao.QuestionDao;
import com.gx.page.Page;
import com.gx.po.AnserPo;
import com.gx.po.QuestionImgPo;
import com.gx.po.QuestionPo;
import com.gx.po.QuestionVideoPo;
import com.gx.service.QuestionService;
import com.gx.vo.QuestionAnserVo;
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


    @Override
    public Integer inserImg(QuestionImgPo po) {
        return questionDao.inserImg(po);
    }

    @Override
    public List<QuestionImgPo> imgByQid(Integer qid) {
        return questionDao.imgByQid(qid);
    }

    @Override
    public Integer delImg(Integer id) {
        return questionDao.delImg(id);
    }

    @Override
    public Integer updateImg(QuestionImgPo po) {
        return questionDao.updateImg(po);
    }

    @Override
    public Integer inserVideo(QuestionVideoPo po) {
        return questionDao.inserVideo(po);
    }

    @Override
    public List<QuestionVideoPo> videoByQid(Integer qid) {
        return questionDao.videoByQid(qid);
    }

    @Override
    public Integer delVideo(Integer id) {
        return questionDao.delVideo(id);
    }

    @Override
    public Integer updateVideo(QuestionVideoPo po) {
        return questionDao.updateVideo(po);
    }

    @Override
    public Integer delImgQid(Integer qid) {
        return questionDao.delImgQid(qid);
    }

    @Override
    public Integer delVideoQid(Integer qid) {
        return questionDao.delVideoQid(qid);
    }

    @Override
    public Page<QuestionAnserVo> listoage(String name, Page<QuestionAnserVo> vo) {

        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<QuestionAnserVo> list=questionDao.listoage(name,start, vo.getPageSize());
        vo.setResult(list);
        int count=questionDao.count(name);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public Page<AnserPo> listanser(Integer qid, Page<AnserPo> vo) {
        int start=0;
        if (vo.getCurrentPage()>1) {
            start=(vo.getCurrentPage()-1)*vo.getPageSize();
        }
        List<AnserPo> list=questionDao.listanser(qid,start, vo.getPageSize());
        vo.setResult(list);
        int count=questionDao.listansercount(qid);
        vo.setTotal(count);
        return vo;
    }

    @Override
    public QuestionVideoPo selectVideoByid(Integer id) {
        return questionDao.selectVideoByid(id);
    }

    @Override
    public QuestionImgPo selectImgByid(Integer id) {
        return questionDao.selectImgByid(id);
    }
}
