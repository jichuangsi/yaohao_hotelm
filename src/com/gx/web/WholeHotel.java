package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.util.TimeTransformation;
import com.gx.vo.DayRoomNumberVo;
import com.gx.vo.OrderDetailsVo;
import com.gx.vo.RoomVo;
import com.gx.vo.WholeOrderRoomVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/WholeHotel")
public class WholeHotel {

    @Autowired
    private OrderService orderService;
    @Autowired
    private RoomSetService roomSetService;
    @Autowired
    private GuestRoomLevelService guestRoomLevelService;
    @Autowired
    private SupplierService supplierService;
    @Autowired
    private PlatformService platformService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private PassengerService passengerService;

    @RequestMapping("/homeType")
    public ModelAndView homeType(String hometype,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/whole/hometypeManagement");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
       /* List<SupplierPo> rlist=supplierService.listHaveAll();*/
        Page<guestRoomLevelPo> vo=new Page<guestRoomLevelPo>();
        vo.setCurrentPage(currentPage);
        Page<guestRoomLevelPo> list=guestRoomLevelService.pagelistwhole(hometype,vo);
        String name=null;
        List<guestRoomLevelPo> glist=guestRoomLevelService.listwhole(name);
       /* List<guestRoomLevelPo> list=guestRoomLevelService.listwhole(hometype);*/
        List<PlatformPo> plist=platformService.listAll();
        List<AccountPo> alist=accountService.getAccount();//账户
        mv.addObject("plist",plist);
        mv.addObject("list",list);
        mv.addObject("glist",glist);
       /* mv.addObject("slist",rlist);*/
        mv.addObject("hometype",hometype);
        mv.addObject("alist",alist);
        return mv;
    }

    @ResponseBody
    @RequestMapping("/addType")
    public Object addType(guestRoomLevelPo po) {
        po.setStatus(2);
        Integer count=guestRoomLevelService.inser(po);
        Gson gson=new Gson();
        return gson.toJson(count);
    }
    @ResponseBody
    @RequestMapping("/updateType")
    public Object updateType(guestRoomLevelPo po) {
        ModelAndView mv = null;
        Integer count=guestRoomLevelService.updateType(po);
        Gson gson=new Gson();
        return gson.toJson(count);
    }
    @RequestMapping("/roomByType")
    public ModelAndView roomByType(Integer id,String roomNumber,Integer currentPage){
        ModelAndView mv = null;
        mv = new ModelAndView("/whole/room");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
       //根据房型插房间
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=orderService.selectRoomByType(id,roomNumber,vo);
        List<SupplierPo> slist=supplierService.listHaveAll();
        guestRoomLevelPo po=guestRoomLevelService.selectById(id);
        mv.addObject("glist",po);
        mv.addObject("slist",slist);
        mv.addObject("list",vo);
        mv.addObject("roomNumber",roomNumber);
        return mv;
    }

    //按月显示每天有几个人
    @ResponseBody
    @RequestMapping("monthRoom")
    public Object monthRoom(String time,Integer typeid)throws Exception{
        if (time==null){
            Calendar calendar = Calendar.getInstance();
            int year = calendar.get(Calendar.YEAR);
            int month = calendar.get(Calendar.MONTH) + 1;
            int day = calendar.get(Calendar.DATE) ;
            time= year + "-" + ( month<10 ? "0" + month : month)+"-"+day;
        }
        List<DayRoomNumberVo> dayList=new ArrayList<DayRoomNumberVo>();
        DayRoomNumberVo vo=new DayRoomNumberVo();

        SimpleDateFormat sdfs = new SimpleDateFormat("yyyy-MM-dd");
        Date date2 = sdfs.parse(time);
        List<String> day=TimeTransformation.getMonthFullDay(date2);//今天起30天后的日期
        long times=0;
       //全空
        List<RoomSetPo> list=orderService.selectEmptyRoom(typeid);
        /*//查询空房
        List<RoomSetPo> lists=orderService.selectEmptyRoomByOrder(typeid);
        for (RoomSetPo r:lists){
            list.add(r);
        }*/
        Integer sum=orderService.countRoomByType(typeid);//总房间数
        for (String s:day) {
        Timestamp ts=TimeTransformation.stringTimestamp(s);
            //不全空
            List<DayRoomNumberVo> vlist = orderService.selectDayRoomType(ts, typeid);

           if (vlist.size()>0){//有入住
               vo = new DayRoomNumberVo();
               vo.setSurplus(sum-vlist.size());
               times = (new SimpleDateFormat("yyyy-MM-dd")).parse(s, new ParsePosition(0)).getTime() / 1000;
               vo.setTimes(times);
               dayList.add(vo);
           }else{//无入住
               vo = new DayRoomNumberVo();
               if (sum>0){
                   vo.setSurplus(sum);
               }else {
                   vo.setSurplus(0);
               }
                times = (new SimpleDateFormat("yyyy-MM-dd")).parse(s, new ParsePosition(0)).getTime() / 1000;
               vo.setTimes(times);
               dayList.add(vo);
           }
        }
        Gson gson=new Gson();
        return gson.toJson(dayList);
        //return mv;
    }
//==============================================================================================================//
    @ResponseBody
    @RequestMapping("/nameYZ")
    public Object nameYZ(guestRoomLevelPo po) {
        ModelAndView mv = null;
        Integer count=guestRoomLevelService.nameYZ(po);
        Gson gson=new Gson();
        return gson.toJson(count);
    }

    @ResponseBody
    @RequestMapping("/YZ")
    public Object YZ(String name) {
        ModelAndView mv = null;
        Integer count=guestRoomLevelService.YZ(name);
        Gson gson=new Gson();
        return gson.toJson(count);
    }


    @ResponseBody
    @RequestMapping("/room")
    public Object room(Integer guestId) {
        ModelAndView mv = null;
       List<WholeOrderRoomVo> tlist=roomSetService.selectSupplierByGuest(guestId);
        Gson gson=new Gson();
        return gson.toJson(tlist);
    }
    @ResponseBody
    @RequestMapping("/YZdau")
    public Object YZdau(OrderPo orderPo) {
        String checkinTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(orderPo.getCheckinTime());
        String checkoutTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(orderPo.getCheckoutTime());
        List<String> list=TimeTransformation.cutDate("M",checkinTime,checkoutTime);
        ModelAndView mv = null;
        Integer count=0;
        for (String s:list){
            count=orderService.YZDay(s,orderPo.getRoomId());
            if (count>0){
                break;
            }
        }
        Gson gson=new Gson();
        return gson.toJson(count);
    }

    @ResponseBody
    @RequestMapping("/rommByHotelAndGuest")
    public Object rommByHotel(Integer supplierId,Integer guestId) {
        List<RoomSetPo> list=roomSetService.roomByHotelAndGuest(guestId,supplierId);
        Gson gson=new Gson();
        return gson.toJson(list);
    }
    //添加订单
    @ResponseBody
    @RequestMapping("addOrder")
    public Object add(OrderPo orderPo,Integer continuedRoom,String name,Integer genderName,String phoneNumber) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodation");
        int count=passengerService.selectYZ(name,phoneNumber);
        int paId=1;
        if (count==0){//无用户
            if (genderName==null ||genderName==0){
                genderName=31;
            }
            PassengerPo po=new PassengerPo();
            po.setName(name);
            po.setGenderName(genderName);
            po.setPhoneNumber(phoneNumber);
            po.setTime(new Date().getTime());
            passengerService.insertAll(po);
            paId=po.getId();
        }else {
            PassengerPo po=passengerService.selectNameAndNumber(name,phoneNumber);
            paId=po.getId();
        }
        orderPo.setPassengerId(paId);
        Timestamp d = new Timestamp(System.currentTimeMillis());
        orderPo.setStatus(1);//已确认
       /* //自有房的订单
        orderPo.setType(1);*/
        //判断是否到账
        if (orderPo.getIsdao()==1){
            orderPo.setDaoTime(null);
        }else if (orderPo.getIsdao()==2){
            orderPo.setDaoTime(d);
        }
        //判断入住天数
        String strn = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckinTime());
        String strn2 = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckoutTime());
        int day=TimeTransformation.nDaysBetweenTwoDate(strn,strn2);
        orderPo.setCheckinDay(day);
        orderPo.setOrderTime(d);
        if (orderPo.getHotelmId()==null){
            RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
            if (roomSetPo.getSupplierID()==null){
                orderPo.setHotelmId(roomSetPo.getSupplierId());
            }else {
                orderPo.setHotelmId(roomSetPo.getSupplierID());
            }
        }
        Integer counts=orderService.inserAll(orderPo);
        Gson gson = new Gson();
        return gson.toJson(counts);
    }
    @ResponseBody
    @RequestMapping("/update")
    public Object update(RoomSetPo roomSetPo){
        ModelAndView mv=null;
        if (roomSetPo.getSupplierID()==null){
            roomSetPo.setSupplierID(roomSetPo.getSupplierId());
        }
        Integer count=roomSetService.updateById(roomSetPo);

        Gson gson=new Gson();
        return gson.toJson(count);
    }
}
