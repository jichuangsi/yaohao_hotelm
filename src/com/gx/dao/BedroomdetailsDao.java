package com.gx.dao;

import com.gx.po.BedroomdetailsPo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BedroomdetailsDao {

    public int inserAll(BedroomdetailsPo bedroomdetailsPo);

  /*  public int updatestatus(@Param("bedroomid")Integer bedroomid,@Param("islikai")Integer islikai);*/
    public int updatestatusstay(@Param("bedroomid")Integer bedroomid,@Param("stayid")Integer stayid);
    public int updatestatuspre(@Param("bedroomid")Integer bedroomid,@Param("predeid")Integer predeid);
    public int selectcount(@Param("bedroomid")Integer bedroomid);

    public Integer updateall(@Param("bedroomid")Integer bedroomid,@Param("predeid")Integer predeid,@Param("stayid")Integer stayid);

    public List<BedroomdetailsPo> selectAll(@Param("bedroomid")Integer bedroomid);
}
