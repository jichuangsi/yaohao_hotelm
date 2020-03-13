package com.gx.web;

import com.gx.service.*;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
@Component
public class TimerTask {

    @Autowired
    private RoomSetService roomSetService;
    @Autowired
    private OrderService orderService;


    //定时结账
    /*@Scheduled(cron = "0 0 1 * * ?")
    public void payTime(){
        Date currentDate = new java.sql.Date(System.currentTimeMillis());

        List<StayRegisterPo> slist=stayRegisterService.selectPayTime();
        if (slist.size()>0){
            for (StayRegisterPo s: slist ) {
                if (s.getPassengerName()!=null){
                    boolean samedate = DateUtils.isSameDay(currentDate, s.getCheckouttime());
                    if (samedate==true){
                        Timestamp d = new Timestamp(System.currentTimeMillis());
                        stayRegisterService.pay(s.getId(), s.getRemarks(),d, 21);
                        RoomSetPo roomSetPo=new RoomSetPo();
                        roomSetPo.setId(s.getRoomID());
                        roomSetPo.setRoomStateID(1);
                        roomSetService.updateByIdToRoomState(roomSetPo);
                        String order =stayRegisterService.orderIDBystayid(s.getId());
                        orderService.updateStatua(order,3);//订单状态为结账（退房）

                        StayRegisterPo spo=stayRegisterService.selectById(s.getId());
                        if (spo.getRentOutTypeID()==72) {//怕判断是否是安床位售出
                            RoomSetPo rpo=roomSetService.selectById(spo.getRoomID());
                            BedroomPo bpo = bedRoomService.selectroomid(spo.getRoomID());
                            if (bpo.getPeople() == 0) {} else{
                                bedRoomService.updateOne(spo.getRoomID());
                                bedroomdetailsSerivce.updatestatusstay(bpo.getId(), s.getId());
                                BedroomPo bpo1=bedRoomService.selectroomid(spo.getRoomID());
                                if (bpo1.getPeople()==-1){
                                    BedroomPo bpo2=new BedroomPo();
                                    bpo2.setSurplusAcount(Integer.valueOf(rpo.getRoomAmount()));
                                    bpo2.setRoomAcount(rpo.getRoomAmount());
                                    bpo2.setPeople(0);
                                    bpo2.setRoomid(spo.getRoomID());
                                    bedRoomService.update(bpo2);
                                }
                            }
                        }
                        List<EmptyroomPo> coun=emptyRoomSerivce.selectOneAndNull(spo.getRoomID());
                        if (coun.size()>1){
                            EmptyroomPo emptyroomPo=new EmptyroomPo();
                            emptyroomPo.setRoomid(spo.getRoomID());
                            emptyroomPo.setRoomNumber(spo.getRoomNumber());
                            emptyroomPo.setCheckin(spo.getCheckintime());
                            emptyroomPo.setCheckout(spo.getCheckouttime());
                            emptyRoomSerivce.deleteByid(emptyroomPo);
                        }else {
                            EmptyroomPo emptyroomPo=new EmptyroomPo();
                            emptyroomPo.setRoomid(spo.getRoomID());
                            emptyroomPo.setRoomNumber(spo.getRoomNumber());
                            emptyroomPo.setCheckin(null);
                            emptyroomPo.setCheckout(null);
                            emptyRoomSerivce.upadte(emptyroomPo);
                        }
                    }
                }
            }
        }

    }*/
}
