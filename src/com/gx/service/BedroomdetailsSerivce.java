package com.gx.service;

import com.gx.po.BedroomdetailsPo;

import java.util.List;

public interface BedroomdetailsSerivce {

    public int inserAll(BedroomdetailsPo bedroomdetailsPo);

    public int updatestatusstay(Integer bedroomid,Integer stayid);
    public int updatestatuspre(Integer bedroomid,Integer preid);

    public int selectcount(Integer bedroomid);

    public Integer updateall(Integer bedroomid,Integer predeid,Integer stayid);

    /*public BedroomdetailsPo selectAll(Integer bedroomid);*/
}
