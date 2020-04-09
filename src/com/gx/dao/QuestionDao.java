package com.gx.dao;

import com.gx.po.AnserPo;
import com.gx.po.QuestionImgPo;
import com.gx.po.QuestionPo;
import com.gx.po.QuestionVideoPo;
import com.gx.vo.QuestionAnserVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionDao {

    public List<QuestionPo> list(@Param("title") String title,@Param("start")int start,@Param("pageSize")  int pageSize);
    public List<QuestionPo> listall(@Param("title") String title);
    public Integer count(@Param("title") String title);
    public Integer insertAll(QuestionPo po);

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

    public List<QuestionAnserVo> listoage(@Param("name")String name,@Param("start")int start,@Param("pageSize")  int pageSize);

    public List<AnserPo> listanser(@Param("qid")Integer qid, @Param("start")int start, @Param("pageSize")  int pageSize);
    public Integer listansercount(@Param("qid")Integer qid);

    public QuestionVideoPo selectVideoByid(Integer id);
    public QuestionImgPo selectImgByid(Integer id);
}
