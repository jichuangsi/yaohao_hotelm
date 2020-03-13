/*
package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.vo.AddPassengerVo;
import com.gx.vo.EmptyroomVo;
import com.gx.vo.ViewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/Hotelm")
public class Hotelm {

    @Autowired
    private SupplierService supplierService;
    @Autowired
    private RoomSetService roomSetService;
    @Autowired
    private AttributeService attributeService;
    @Autowired
    private EmptyRoomSerivce emptyRoomSerivce;
    @Autowired
    private PassengerService passengerService;
    @Autowired
    private PredetermineService predetermineService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private PlatformService platformService;
    @Autowired
    private StayRegisterService stayRegisterService;
    @Autowired
    private RoomTimePoService roomTimePoService;

    //查询自有酒店
    @RequestMapping("/toHaveList")
    public ModelAndView toHaveList(Integer currentPage, String txtname){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/list");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        if(txtname==null)
        {
            txtname="";
        }
        Page<SupplierPo> vo=new Page<SupplierPo>();
        vo.setCurrentPage(currentPage);
        vo=this.supplierService.listHaveTrueAll(txtname,vo);
        mv.addObject("list",vo);
        return mv;
    }
    //查询酒店
    @RequestMapping("/toList")
    public ModelAndView tolist(Integer currentPage, String txtname){
        ModelAndView mv=null;
        //  List<PlatformPo> listAll=platformService.listTrueAll();
        mv=new ModelAndView("/hotelmCheckin/list");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        if(txtname==null)
        {
            txtname="";
        }
        Page<SupplierPo> vo=new Page<SupplierPo>();
        vo.setCurrentPage(currentPage);
        vo=this.supplierService.listTrueAll(txtname,vo);
        mv.addObject("list",vo);
        return mv;
    }

    //根据酒店查询房间
    @RequestMapping("/toRoomList")
    public ModelAndView toRoomList(Integer currentPage, int id){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/roomset");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<RoomSetPo> vo=new Page<RoomSetPo>();
        vo.setCurrentPage(currentPage);
        vo=this.roomSetService.pageRoomSupper(id,vo);
        List<AttributePo> listOne=attributeService.selectGuestRoomLevel();
        mv.addObject("listOne",listOne);
        mv.addObject("list",vo);
        mv.addObject("supper",id);
        return mv;
    }
    //根据酒店和房号查询房间
    @RequestMapping("/day")
    public ModelAndView day(Integer id,Integer supplierId){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/day");
        List<EmptyroomPo> vo=  emptyRoomSerivce.listByRoomId(id);
        mv.addObject("list",vo);
        mv.addObject("id",id);//房间id
        mv.addObject("supplierId",supplierId);//房间id

        return mv;
    }




  //根据酒店和房号查询房间
  */
/*  @RequestMapping("/toRoom")
    public ModelAndView toRoom(Integer currentPage, String supperId,String txtname,Integer guestRoomLevelID){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/roomset");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<RoomSetPo> vo=new Page<RoomSetPo>();
        vo.setCurrentPage(currentPage);
        vo=this.roomSetService.pageRoomSupperNumber(Integer.parseInt(supperId),txtname,guestRoomLevelID,vo);
        List<AttributePo> listOne=attributeService.selectGuestRoomLevel();
        mv.addObject("listOne",listOne);
        mv.addObject("list",vo);
        mv.addObject("supper",supperId);
        mv.addObject("guestRoomLevelID",guestRoomLevelID);
        return mv;
    }*//*



    //根据酒店和房号查询房间
    @ResponseBody
    @RequestMapping("/dayroom")
    public Object dayroom(Integer id, String timeOne, String timeTwo)throws ParseException {

        RoomTimePo roomTimePo=roomTimePoService.list();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
        Date timein = simpleDateFormat.parse(timeOne);
        Date timeout = simpleDateFormat.parse(timeTwo);
        List<EmptyroomPo> vo=  emptyRoomSerivce.listByRoomIdAndTime(id,timein,timeout);
        List<EmptyroomVo> vo2=new ArrayList<EmptyroomVo>();
        EmptyroomVo vo1=new EmptyroomVo();
        for (EmptyroomPo po:vo) {
            vo1 = new EmptyroomVo();
            vo1.setId(po.getId());
            vo1.setRoomid(po.getRoomid());
            vo1.setRoomNumber(po.getRoomNumber());
            vo1.setCheckin(po.getCheckin());
            vo1.setCheckout(po.getCheckout());
            vo1.setStayid(po.getStayid());
            vo1.setPreid(po.getPreid());
            vo1.setSorp(po.getSorp());
            vo1.setCheckouts(roomTimePo.getCheckout());
           // SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String dateString = simpleDateFormat.format(po.getCheckin());
            String dateString2 = simpleDateFormat.format(po.getCheckout());
            long time = (new SimpleDateFormat("yyyy-MM-dd")).parse(dateString, new ParsePosition(0)).getTime() / 1000;
            long time2 = (new SimpleDateFormat("yyyy-MM-dd")).parse(dateString2, new ParsePosition(0)).getTime() / 1000;
            vo1.setIn(time);
            vo1.setOut(time2);
            vo2.add(vo1);
        }
        Gson gson =new Gson();
        return gson.toJson(vo2);
    }


    @ResponseBody
    @RequestMapping(value="/addPass")
    public Object addPass(){
        List<PassengerPo> vo=passengerService.selectAll();
        Gson gson =new Gson();
        return gson.toJson(vo);
    }
    @RequestMapping("/toaddRoom")
    public ModelAndView toaddRoom(Integer id, String timeOne, Integer supperId){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/add");
        List<EmptyroomPo> vo=  emptyRoomSerivce.listByRoomId(id);
       SupplierPo supplierPo= supplierService.selectById(supperId);
        List<AttributePo> listOne=attributeService.selectPayWay();
        List<PlatformPo> listP=platformService.listAll();
        List<AttributePo> listGender=attributeService.selectGender();                      //性别
        mv.addObject("roomid",id);
        mv.addObject("roomNumber",vo.get(0).getRoomNumber());
        mv.addObject("checkin",timeOne);//房间id
        mv.addObject("supperId",supperId);//房间id
        mv.addObject("supperName",supplierPo.getSupplierName());//房间id
        mv.addObject("listOne",listOne);
        mv.addObject("listP",listP);
        mv.addObject("listGender",listGender);
        return mv;
    }

   */
/* @RequestMapping("/addRoom")
    public ModelAndView addRoom(AddPassengerVo vo){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/day");
        PassengerPo po=new PassengerPo();
       PassengerPo po1= passengerService.selectNameAndNumber(vo.getName(),vo.getContactPhoneNumber());
        int pid=0;
       if (po1==null){
           po.setName(vo.getName());
         *//*
*/
/*  po.setGenderID(vo.getGenderID());
           po.setContactPhoneNumber(vo.getContactPhoneNumber());*//*
*/
/*
           passengerService.insertAll(po);
         pid=po.getId();
       }else {
           pid=po1.getId();
       }
       PredeterminePo ppo=new PredeterminePo();
       ppo.setRenshu(1);
        ppo.setDeposit(0);                         //设po的押金
        ppo.setPredetermineStateID(66);                     //设置预订状态为未按排
        ppo.setPassengerID(pid);                         //给预订赋值旅客id
        ppo.setPredetermineTargetID(2);                 //设置团队id
        ppo.setRoomID(vo.getRoomid());      //给预订设置房间id
        ppo.setRentOutTypeID(26);//出租方式
        ppo.setCheckintime(vo.getCheckintime());
        ppo.setCheckouttime(vo.getCheckouttime());
        ppo.setIsdao(vo.getIsdao());
        ppo.setIsdicount(vo.getIsdicount());
        ppo.setPassengerID(pid);
        ppo.setAccountsreceivable(vo.getAccountsreceivable());
        ppo.setCurrency(vo.getCurrency());
        ppo.setPayWayID(vo.getPayWayID());
        if (vo.getIsdao()==2){
            Date date=new Date();
            DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
            Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
            ppo.setPaymentdate(timestamp);
        }

        predetermineService.insertAll(ppo);
        Integer preid=ppo.getId();

        orderService.inserAll(vo.getOrderID(),0,vo.getPlatformId(),0,preid);

        EmptyroomPo emptyroomPo=new EmptyroomPo();
        List<EmptyroomPo> list=emptyRoomSerivce.selectOneAndNull(vo.getRoomid());
        if (list.size()==1 && list.get(0).getCheckin()==null){//修改时间数据
            emptyroomPo.setRoomid(vo.getRoomid());
            emptyroomPo.setId(list.get(0).getId());
            emptyroomPo.setCheckin(vo.getCheckintime());
            emptyroomPo.setCheckout(vo.getCheckouttime());
            emptyroomPo.setPreid(preid);
            emptyroomPo.setStayid(0);
            emptyroomPo.setSorp(2);
            emptyRoomSerivce.upadtecheck(emptyroomPo);
        }else {//新增订房记录
            emptyroomPo.setRoomid(vo.getRoomid());
            emptyroomPo.setRoomNumber(list.get(0).getRoomNumber());
            emptyroomPo.setCheckin(vo.getCheckintime());
            emptyroomPo.setCheckout(vo.getCheckouttime());
            emptyroomPo.setPreid(preid);
            emptyroomPo.setStayid(0);
            emptyroomPo.setSorp(2);
            emptyRoomSerivce.inserAll(emptyroomPo);
        }
        List<EmptyroomPo> vvo=  emptyRoomSerivce.listByRoomId(vo.getRoomid());
        mv.addObject("list",vvo);
        mv.addObject("id",vo.getRoomid());//房间id
        mv.addObject("supplierId",vo.getSupperId());//房间id
        return mv;
    }*//*


    @ResponseBody
    @RequestMapping(value = "/viewRoom",produces="text/jsp;charset=UTF-8")
    public Object addRoom(Integer id){
      */
/*  ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/day");*//*

        RoomTimePo roomTimePo=roomTimePoService.list();
        EmptyroomPo vo=  emptyRoomSerivce.selectById(id);
        StayRegisterPo stayRegisterPo=null;
        //StayRegisterPo stayRegisterPos=null;
        PassengerPo passengerPo=null;
        PredeterminePo predeterminePo=null;
        ViewVo viewVo=new ViewVo();
        if (vo.getSorp()==1){//满
            //stayRegisterPo=stayRegisterService.selectById(vo.getStayid());
            stayRegisterPo=stayRegisterService.selectSP(vo.getStayid());
            if (stayRegisterPo!=null){
                passengerPo=passengerService.selectById(stayRegisterPo.getPassengerID());
            }
            viewVo.setStayid(vo.getPreid());
            viewVo.setIsdao(stayRegisterPo.getIsdao());
           // mv.addObject("preid",vo.getPreid());
        }else if (vo.getSorp()==2){//预定
            predeterminePo=predetermineService.findById(vo.getPreid());
            if (predeterminePo!=null){
                passengerPo=passengerService.selectById(predeterminePo.getPassengerID());
            }
            viewVo.setPreid(vo.getPreid());
            viewVo.setIsdao(predeterminePo.getIsdao());
            //mv.addObject("stayid",vo.getStayid());
        }
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateString = formatter.format(vo.getCheckin());
        String dateStrings = formatter.format(vo.getCheckout());
        long time = (new SimpleDateFormat("yyyy-MM-dd")).parse(dateString, new ParsePosition(0)).getTime() / 1000;
        long time2 = (new SimpleDateFormat("yyyy-MM-dd")).parse(dateStrings, new ParsePosition(0)).getTime() / 1000;
        viewVo.setSorp(vo.getSorp());
        viewVo.setPassenger(passengerPo.getName());
     */
/*   viewVo.setPhone(passengerPo.getContactPhoneNumber());*//*

        viewVo.setRoomNumber(vo.getRoomNumber());
        viewVo.setCheckin(vo.getCheckin());
        viewVo.setCheckout(vo.getCheckout());
        viewVo.setTime(time);
        viewVo.setTime2(time2);
        viewVo.setCheckouts(roomTimePo.getCheckout());
        Gson gson =new Gson();
        return gson.toJson(viewVo);
       */
/* mv.addObject("sorp",vo.getSorp());
        mv.addObject("passenger",passengerPo.getName());
        mv.addObject("phone",passengerPo.getContactPhoneNumber());
        mv.addObject("roomNumber",vo.getRoomNumber());
        mv.addObject("checkin",vo.getCheckin());
        mv.addObject("checkout",vo.getCheckout());
        mv.addObject("id",vo.getRoomid());//房间id
        mv.addObject("supplierId",supperId);
        return mv;*//*

    }


    */
/**
     * t退房
     * @param id
     * @param isdao
     * @param currency
     * @param roomid
     * @param supperId
     * @return
     *//*


   */
/* @RequestMapping(value = "/checkout",produces="text/jsp;charset=UTF-8")
    public ModelAndView checkout(Integer id,Integer isdao,Integer currency,Integer roomid,Integer supperId){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/day");
        EmptyroomPo emptyroomPo=emptyRoomSerivce.selectById(id);
        Timestamp timestamp=null;
      if (isdao==2){//到账
          Date date=new Date();
          DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
         timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
      }
        stayRegisterService.pay2(emptyroomPo.getStayid(), timestamp,currency);

        RoomSetPo roomSetPo=new RoomSetPo();
        roomSetPo.setId(emptyroomPo.getRoomid());
     *//*
*/
/*   roomSetPo.setRoomStateID(1);*//*
*/
/*
        roomSetService.updateByIdToRoomState(roomSetPo);

        String order =stayRegisterService.orderIDBystayid(id);
        orderService.updateStatua(order,3);//订单状态为结账（退房）
        List<EmptyroomPo> coun=emptyRoomSerivce.selectOneAndNull(emptyroomPo.getRoomid());
        if (coun.size()>1){
            EmptyroomPo emptyroomPo2=new EmptyroomPo();
            emptyroomPo2.setRoomid(emptyroomPo.getRoomid());
            emptyroomPo2.setRoomNumber(emptyroomPo.getRoomNumber());
            emptyroomPo2.setCheckin(emptyroomPo.getCheckin());
            emptyroomPo2.setCheckout(emptyroomPo.getCheckout());
            emptyRoomSerivce.deleteByid(emptyroomPo2);
        }else {
            EmptyroomPo emptyroomPo3=new EmptyroomPo();
            emptyroomPo3.setRoomid(emptyroomPo.getRoomid());
            emptyroomPo3.setRoomNumber(emptyroomPo.getRoomNumber());
            emptyroomPo3.setCheckin(null);
            emptyroomPo3.setCheckout(null);
            emptyroomPo3.setSorp(0);
            emptyRoomSerivce.upadte(emptyroomPo3);
        }
        mv.addObject("id",roomid);//房间id
        mv.addObject("supplierId",supperId);//房间id
        return mv;
    }*//*


    */
/**
     * 登记
     * @param id
     * @param roomid
     * @param supperId
     * @return
     *//*

   */
/* @RequestMapping(value = "/register",produces="text/jsp;charset=UTF-8")
    public ModelAndView register(Integer id,Integer roomid,Integer supperId){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/day");
        Date date=new Date();
        DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
        Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
        String codeNumber=null;
        EmptyroomPo emptyroomPo=emptyRoomSerivce.selectById(id);
        OrderPo  opo=null;
        OrderPo order=null;
        StayRegisterPo stayRegisterPo=new StayRegisterPo();
        if (emptyroomPo.getPreid()!=null &&emptyroomPo.getPreid()!=0 ){
            predetermineService.updatePredetermineStateID(emptyroomPo.getPreid());
            PredeterminePo predeterminePo=predetermineService.findById(emptyroomPo.getPreid());
           order=orderService.selectBypredeID(emptyroomPo.getPreid());
            codeNumber=order.getOrderID();
            opo=orderService.selectStatua(codeNumber);
            emptyRoomSerivce.updatePre(emptyroomPo.getPreid(),emptyroomPo.getStayid());
            StayRegisterPo stayDetailsId=stayRegisterService.getsID(codeNumber);
            if (stayDetailsId==null){
                stayRegisterPo.setRoomID(predeterminePo.getRoomID());                                        //设置房间id
                stayRegisterPo.setRentOutTypeID(26);
                stayRegisterPo.setPassengerTypeID(29);
                if (predeterminePo.getPassengerID()==0) {                              //判断是否为团队还是散客
                    stayRegisterPo.setBillUnitID(28);
                }else {
                    stayRegisterPo.setBillUnitID(27);
                }
                stayRegisterPo.setReceiveTargetID(predeterminePo.getPredetermineTargetID());
                stayRegisterPo.setIsBillID(68);
                stayRegisterPo.setRegisterTime(timestamp);
                stayRegisterPo.setStayNumber("0");
                if (predeterminePo.getIsdicount()==0){
                    stayRegisterPo.setSumConst(0);      //获取房价 乘以 住宿天数
                }else if (predeterminePo.getIsdicount()==1){
                    stayRegisterPo.setSumConst(0);      //获取房价 乘以 住宿天数
                }
                stayRegisterPo.setIsdicount(predeterminePo.getIsdicount());
                stayRegisterPo.setCheckintime(predeterminePo.getCheckintime());//入住时间
                stayRegisterPo.setCheckouttime(predeterminePo.getCheckouttime());//退房时间
                stayRegisterPo.setAccountsreceivable(predeterminePo.getAccountsreceivable());//应收账
                stayRegisterPo.setCurrency(predeterminePo.getCurrency());//货币类型
                stayRegisterPo.setIsdao(predeterminePo.getIsdao());//是否到账
                stayRegisterPo.setPaymentdate(predeterminePo.getPaymentdate());//到账时间
                stayRegisterPo.setRegisterTime(timestamp);
                stayRegisterService.insertAll(stayRegisterPo); //新增成功时，获取刚新增的id。
                Integer sid=stayRegisterPo.getId();
               order=orderService.selectBypredeID(emptyroomPo.getPreid());
                codeNumber=order.getOrderID();
                opo=orderService.selectStatua(codeNumber);
                stayRegisterService.insertStayregisterdetails(sid, predeterminePo.getPassengerID(),
                        codeNumber,opo.getPlatformId());

                emptyRoomSerivce.updateSta(sid,emptyroomPo.getPreid());
            }
        }else {
            StayRegisterPo stayRegisterPo2=stayRegisterService.selectById(emptyroomPo.getStayid());
            order=orderService.selectBypredeID(emptyroomPo.getPreid());
            codeNumber=order.getOrderID();
            opo=orderService.selectStatua(codeNumber);
            stayRegisterService.insertStayregisterdetails(emptyroomPo.getStayid(), stayRegisterPo2.getPassengerID(),
                    codeNumber,opo.getPlatformId());
        }

       *//*
*/
/* StayRegisterPo sta=new StayRegisterPo();
        sta.setRegisterTime(timestamp);
        sta.setId(emptyroomPo.getStayid());
        stayRegisterService.regiserTime(sta);*//*
*/
/*
        int stayDetailsId=stayRegisterService.getID(codeNumber);
        if (emptyroomPo.getPreid()!=null){
            orderService.updateStatuaByCS(codeNumber,1,stayDetailsId);
        }else {
            orderService.inserAll(codeNumber,1,opo.getPlatformId(),stayDetailsId,0);
        }
        mv.addObject("id",roomid);//房间id
        mv.addObject("supplierId",supperId);//房间id
        return mv;
    }*//*


    */
/**
     * 登记
     * @param id
     * @param roomid
     * @param supperId
     * @return
     *//*

   */
/* @RequestMapping(value = "/cancel",produces="text/jsp;charset=UTF-8")
    public ModelAndView cancel(Integer id,Integer roomid,Integer supperId){
        ModelAndView mv=null;
        mv=new ModelAndView("/hotelmCheckin/day");
        String codeNumber=null;
        EmptyroomPo emptyroomPo=emptyRoomSerivce.selectById(id);
       PredeterminePo predeterminePo=predetermineService.findById(emptyroomPo.getPreid());

        mv.addObject("id",roomid);//房间id
        mv.addObject("supplierId",supperId);//房间id
        return mv;
    }*//*

}
*/
