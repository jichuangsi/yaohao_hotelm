package com.gx.service;

import com.gx.page.Page;
import com.gx.po.AnserPo;
import com.gx.po.QuestionImgPo;
import com.gx.po.QuestionPo;
import com.gx.po.QuestionVideoPo;
import com.gx.vo.QuestionAnserVo;

import java.util.List;

public interface QuestionService {

    public Page<QuestionAnserVo> listoage(String name, Page<QuestionAnserVo> vo);

    public Page<QuestionPo> list(String name,Page<QuestionPo> vo);

    public List<QuestionPo> listall(String name);

    public Integer inserAll(QuestionPo po);

    public Integer updateById(QuestionPo po);

   public QuestionPo questionById(Integer id);

    public Integer deleteById(Integer id);

    public Integer inserImg(QuestionImgPo po);
    public List<QuestionImgPo> imgByQid(Integer qid);
    public Integer delImg(Integer id);
    public Integer updateImg(QuestionImgPo po);
    public Integer inserVideo(QuestionVideoPo po);
    public List<QuestionVideoPo> videoByQid(Integer qid);
    public Integer delVideo(Integer id);
    public Integer updateVideo(QuestionVideoPo po);

    public Integer delImgQid(Integer qid);
    public Integer delVideoQid(Integer qid);

    public Page<AnserPo> listanser(Integer qid, Page<AnserPo> vo);

    public QuestionVideoPo selectVideoByid(Integer id);
    public QuestionImgPo selectImgByid(Integer id);
}
