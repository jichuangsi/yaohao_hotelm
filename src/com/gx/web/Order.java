package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.util.TimeTransformation;
import com.gx.vo.*;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import  com.gx.service.PlatformService;

import javax.jws.WebParam;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/Order")
public class Order {
    @Autowired
    private OrderService orderService;
    @Autowired
    private RoomSetService roomSetService;
    @Autowired
    private RoomRecordService roomRecordService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private FinanceService financeService;
    @Autowired
    private RoomAndTimeService roomAndTimeService;
    @Autowired
    private SupplierService supplierService;
    @Autowired
    private PassengerService passengerService;
    @Autowired
    private PlatformService platformService;
    @Autowired
    private DailyconsumptionService dailyconsumptionService;
    @Autowired
    private ConsumptiontypeService consumptiontypeService;
    @Autowired
    private BookingcommissionService bookingcommissionService;
    @Autowired
    private  QuestionService questionService;


    ///自有公寓

    //自有已订单
    @RequestMapping("/myorder")
    public ModelAndView myorder(String orderNumber,Integer passengerId,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodation");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        //已入住
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=this.orderService.list(orderNumber, passengerId,vo);
        mv.addObject("list",vo);
        //已入住
        Page<OrderDetailsVo> vo1=new Page<OrderDetailsVo>();
        vo1.setCurrentPage(currentPage);
        vo1=this.orderService.checkinorder(orderNumber, passengerId,vo1);
        mv.addObject("listr",vo1);
        //已退房
        Page<OrderDetailsVo> vo2=new Page<OrderDetailsVo>();
        vo2.setCurrentPage(currentPage);
        vo2=this.orderService.checkoutorder(orderNumber, passengerId,vo2);
        mv.addObject("listt",vo2);
        //已到账
        Page<OrderDetailsVo> vo3=new Page<OrderDetailsVo>();
        vo3.setCurrentPage(currentPage);
        vo3=this.orderService.myaccount(orderNumber, passengerId,vo3);
        mv.addObject("listd",vo3);
        return mv;
    }
    //已入住
    @RequestMapping("/checkinorder")
    public ModelAndView checkinorder(String orderNumber,Integer passengerId,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodationin");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=this.orderService.checkinorder(orderNumber, passengerId,vo);
        mv.addObject("list",vo);
        return mv;
    }
    //已退房
    @RequestMapping("/checkoutorder")
    public ModelAndView checkoutorder(String orderNumber,Integer passengerId,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodationout");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=this.orderService.checkoutorder(orderNumber, passengerId,vo);
        mv.addObject("list",vo);
        return mv;
    }
    //已到账
    @RequestMapping("/myaccount")
    public ModelAndView myaccount(String orderNumber,Integer passengerId,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodationaccount");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=this.orderService.myaccount(orderNumber, passengerId,vo);
        mv.addObject("list",vo);
        return mv;
    }

    //订单明细
    @RequestMapping("/myorderStatistics")
    public ModelAndView myorderStatistics(String orderNumber,Integer passengerId,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/finance1");
       /* if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=this.orderService.list(orderNumber, passengerId,vo);
        List<AccountPo> alist=accountService.getAccount();
        mv.addObject("list",vo);
        mv.addObject("lista",alist);*/
        return mv;
    }
    //财务报表
    @RequestMapping("/myfinance")
    public ModelAndView myfinance(String time,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/finance2");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        String time2=null;
       if (time==null ||time==""){//默认当前月
           Timestamp timestamp=new Timestamp(System.currentTimeMillis());
           time2= new SimpleDateFormat("yyyy-MM").format(timestamp).toString();
       }else {//根据月查
          time2 =time;
       }
      /*  Page<FinancePo> vo=new Page<FinancePo>();
        vo.setCurrentPage(currentPage);*/
        FinancePo fp=new FinancePo();
        List<FinancePo> fpl=new ArrayList<FinancePo>();
        double sumPHP=0d;
        double sumCNY=0d;
        double booking=0d;
      /*  Page<FinancePo> list=financeService.list(time2,vo);*/
        List<FinancePo> list=financeService.list(time2);
        BookingcommissionPo book=bookingcommissionService.selectMoney(time2);//按月查
        if (book==null){
            booking=0d;
        }else {
            booking=book.getBooking();
        }

        for (FinancePo f:list) {
           sumPHP=sumPHP+f.getCount();
           sumCNY=sumCNY+f.getRMB();
        }
        sumPHP=sumPHP-booking;
        mv.addObject("sumPHP",sumPHP);
        mv.addObject("sumCNY",sumCNY);
        mv.addObject("booking",booking);
        mv.addObject("time",time2);
        mv.addObject("list",list);
        return mv;
    }

    //入住情况
    @RequestMapping("occupancy")
    public ModelAndView getTimeSelectRoom(String time,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodationfinance");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Timestamp timestamp=null;
        if (time==null){
            timestamp = new Timestamp(System.currentTimeMillis());
        }else {
            timestamp=TimeTransformation.stringTimestamp(time);
        }

        Map<Integer,Integer> coun=new HashMap<Integer, Integer>();
        Page<OrderTimeVo> vo=new Page<OrderTimeVo>();
        List<OrderTimeVo> olist=new ArrayList<OrderTimeVo>();
        OrderTimeVo ov=new OrderTimeVo();
        vo.setCurrentPage(currentPage);
        List<Integer> id=new ArrayList<Integer>();//入住房间id
        List<Integer> allid=new ArrayList<Integer>();//全部房间id
        Map<Integer,Integer> key=new HashMap<Integer,Integer>();

        Page<OrderTimeVo> rlist=orderService.selectRoom(vo);
        for (OrderTimeVo v:rlist.getResult()){
            allid.add(v.getRoomId());
        }
        List<OrderTimeVo> olist2=orderService.selectRoomByTimes(timestamp,allid);//入住
        for (OrderTimeVo o:olist2){
            id.add(o.getRoomId());
        }
        List<OrderTimeVo> olist3=null;
        if (id.size()==0){
            olist3=orderService.selectRoomByins(allid);//全空房
        }else {
            olist3=orderService.selectRoomByin(id,allid);//全空房
        }
        for (OrderTimeVo v:olist3){
            ov=new OrderTimeVo();
            ov.setRoomId(v.getRoomId());
            ov.setRoomNumber(v.getRoomNumber());
            ov.setSupplierName(v.getSupplierName());
            ov.setRemainingBeds(v.getRoomAmount());
            olist.add(ov);
        }

        //判断入住房间全部入住人数
        for (OrderTimeVo o :olist2) {//相同房间的空床
                if (coun.get(o.getRoomId())==null){//count还为空
                    coun.put(o.getRoomId(),o.getCheckinNumber());
                }else {
                    coun.put(o.getRoomId(),coun.get(o.getRoomId())+o.getCheckinNumber());
                }
        }

        for (OrderTimeVo o :olist2 ) {
            if (coun.containsKey(o.getRoomId())){
                ov=new OrderTimeVo();
                if (!key.containsKey(o.getRoomId())) {//去重
                    ov.setRemainingBeds(o.getRoomAmount()-coun.get(o.getRoomId()));
                    ov.setOrderId(o.getOrderId());
                    ov.setRoomId(o.getRoomId());
                    ov.setSupplierName(o.getSupplierName());
                    ov.setRoomNumber(o.getRoomNumber());
                    ov.setRoomAmount(o.getRoomAmount());
                    olist.add(ov);
                    key.put(o.getRoomId(),1);
                }
            }
        }
        vo.setResult(olist);
        List<SupplierPo> slist=supplierService.listHaveAll();//自有酒店
        List<AccountPo> alist=accountService.getAccount();//账户
        List<PlatformPo> plist=platformService.listAll();
        mv.addObject("list",vo);
        mv.addObject("slist",slist);
        mv.addObject("alist",alist);
        mv.addObject("plist",plist);
        return mv;
    }

    //入住情况
    @ResponseBody
    @RequestMapping("joccupancy")
    public Object joccupancy(String time,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodationfinance");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Timestamp timestamp=null;
        if (time==null){
            timestamp = new Timestamp(System.currentTimeMillis());
        }else {
            timestamp=TimeTransformation.stringTimestamp(time);
        }

        Map<Integer,Integer> coun=new HashMap<Integer, Integer>();
        Page<OrderTimeVo> vo=new Page<OrderTimeVo>();
        List<OrderTimeVo> olist=new ArrayList<OrderTimeVo>();
        OrderTimeVo ov=new OrderTimeVo();
        vo.setCurrentPage(currentPage);
        List<Integer> id=new ArrayList<Integer>();//入住房间id
        List<Integer> allid=new ArrayList<Integer>();//全部房间id
        Map<Integer,Integer> key=new HashMap<Integer,Integer>();

        Page<OrderTimeVo> rlist=orderService.selectRoom(vo);
        for (OrderTimeVo v:rlist.getResult()){
            allid.add(v.getRoomId());
        }
        List<OrderTimeVo> olist2=orderService.selectRoomByTimes(timestamp,allid);//入住
        for (OrderTimeVo o:olist2){
            id.add(o.getRoomId());
        }
        List<OrderTimeVo> olist3=null;
        if (id.size()==0){
            olist3=orderService.selectRoomByins(allid);//全空房
        }else {
            olist3=orderService.selectRoomByin(id,allid);//全空房
        }

        for (OrderTimeVo v:olist3){
            ov=new OrderTimeVo();
            ov.setRoomId(v.getRoomId());
            ov.setRoomNumber(v.getRoomNumber());
            ov.setSupplierName(v.getSupplierName());
            ov.setRemainingBeds(v.getRoomAmount());
            olist.add(ov);
        }

        //判断入住房间全部入住人数
        for (OrderTimeVo o :olist2) {//相同房间的空床
            if (coun.get(o.getRoomId())==null){//count还为空
                coun.put(o.getRoomId(),o.getCheckinNumber());
            }else {
                coun.put(o.getRoomId(),coun.get(o.getRoomId())+o.getCheckinNumber());
            }
        }

        for (OrderTimeVo o :olist2 ) {
            if (coun.containsKey(o.getRoomId())){
                ov=new OrderTimeVo();
                if (!key.containsKey(o.getRoomId())) {//去重
                    ov.setRemainingBeds(o.getRoomAmount()-coun.get(o.getRoomId()));
                    ov.setOrderId(o.getOrderId());
                    ov.setRoomId(o.getRoomId());
                    ov.setSupplierName(o.getSupplierName());
                    ov.setRoomNumber(o.getRoomNumber());
                    ov.setRoomAmount(o.getRoomAmount());
                    olist.add(ov);
                    key.put(o.getRoomId(),1);
                }
            }
        }
        vo.setResult(olist);
        List<SupplierPo> slist=supplierService.listHaveAll();//自有酒店
        List<AccountPo> alist=accountService.getAccount();//账户
        List<PlatformPo> plist=platformService.listAll();
        Model model=new Model();
        model.setList(vo.getResult());
        model.setAlist(alist);
        model.setPlist(plist);
        model.setSlist(slist);
        Gson gson = new Gson();
        return gson.toJson(model);
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
       /* if (continuedRoom==1){//续房
            orderPo.setStatus(5);//已入住
        }else {
            orderPo.setStatus(2);//已确认
        }*/
        Timestamp d = new Timestamp(System.currentTimeMillis());
        orderPo.setStatus(2);//已确认
       //自有房的订单
            orderPo.setType(1);
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
        orderService.inserAll(orderPo);
        int oid=orderPo.getId();
        //int oid=
        RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
        //添加住房明细
        RoomAndTime roomAndTime=new RoomAndTime();
        roomAndTime.setOrderId(oid);
        roomAndTime.setRoomId(orderPo.getRoomId());
        roomAndTime.setRoomNumber(roomSetPo.getRoomNumber());
        roomAndTime.setNumber(orderPo.getCheckinNumber());
        roomAndTime.setIntime(orderPo.getCheckinTime());
        roomAndTime.setOuttime(orderPo.getCheckoutTime());
        roomAndTime.setIsout(1);//未退房
        Integer counts=  roomAndTimeService.inserAll(roomAndTime);
        //return mv;
        Gson gson = new Gson();
        return gson.toJson(counts);
    }

    //修改订单状态
    @ResponseBody
    @RequestMapping("updateStatus")
    public Object updateStatus(String orderNumber,Integer status,String time){
        ModelAndView mv=null;
        Integer counts=0;
        if (status==5){//入住
            mv=new ModelAndView("redirect:/Order/myorder.do");
        }else if (status==6){//退房
            mv=new ModelAndView("redirect:/Order/checkinorder.do");
        }
        counts= orderService.updateStatus(orderNumber, status);
        OrderPo orderPo=orderService.selectByOrderNumber(orderNumber);//根据订单号查询订单
        RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
        if (status==6){//退房
            String satrt=time.substring(0,time.lastIndexOf("-"));
            String end=time.substring(time.lastIndexOf("-")+1,time.length());
            if (satrt!=null && satrt!="" ||end!=null && end!=""){
                counts=orderService.updateInEnd(satrt,end,orderPo.getId());
            }

            //退房就到账
            Timestamp d = new Timestamp(System.currentTimeMillis());
            counts=orderService.updateMoney(orderPo.getId(),d);

        /*  roomAndTimeService.deleteOrder(orderPo.getId());*/
            Timestamp timestamp=new Timestamp(System.currentTimeMillis());
            String time2 = new SimpleDateFormat("yyyy-MM").format(timestamp).toString();
            int count=financeService.countFinanceM(time2,orderPo.getRoomId());
            if (count>=1){//修改
                FinancePo po=new FinancePo();
                FinancePo financePo=financeService.selectByyearM(time2,orderPo.getRoomId());
              if (orderPo.getCurrency()==1){//RMB
                  po.setRMB(financePo.getRMB()+orderPo.getMoney());
                po.setId(financePo.getId());
                  counts=financeService.updateRMB(po);
              }else if (orderPo.getCurrency()==2){//PHP
                  po.setPHP(financePo.getPHP()+orderPo.getMoney());
                  po.setId(financePo.getId());
                  counts=financeService.updatePHP(po);
              }
            }else {//新增
            FinancePo financePo=new FinancePo();
            financePo.setRoomId(orderPo.getRoomId());
            financePo.setRoomNumber(roomSetPo.getRoomNumber());
            if (roomSetPo.getSupplierID()==null) {
                financePo.setSupplierId(roomSetPo.getSupplierId());
            }else {
                financePo.setSupplierId(roomSetPo.getSupplierID());
            }
                if (orderPo.getCurrency()==1){//RMB
                    financePo.setRMB(orderPo.getMoney());
                    financePo.setYearM(time2);
                    financePo.setTime(timestamp);
                    counts=financeService.insertAll(financePo);
                }else if (orderPo.getCurrency()==2){//PHP
                    financePo.setPHP(orderPo.getMoney());
                    financePo.setYearM(time2);
                    counts=financeService.insertAll(financePo);
                }
            }
        }
      Gson gson=new Gson();
        return gson.toJson(counts);
    }

    //新增消费订单
    @RequestMapping("toaddfinance")
    public ModelAndView toaddfinance(Integer id,String time){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/addfinance");
        mv.addObject("id",id);
        mv.addObject("time",time);
        return mv;
    }

    //新增消费订单
    @ResponseBody
    @RequestMapping("addFinance")
    public Object addFinance(FinancePo financePo){
        ModelAndView mv=null;
        mv=new ModelAndView();/*
        FinancePo po=financeService.selectByyearM(fin)*/
        Integer count= financeService.updateRentById(financePo);
      /*  return mv;*/
        Gson gson = new Gson();
            return gson.toJson(count);
    }
    //新增日常消费
    @ResponseBody
    @RequestMapping("dailyconsumption")
    public Object dailyconsumption(DailyconsumptionPo po){
        ModelAndView mv=null;
        mv=new ModelAndView();
        String y=po.getTime().substring(0,po.getTime().lastIndexOf('-'));
        RoomVo r=roomSetService.selectDetailByIds(po.getRoomId());
        if (r!=null){
            po.setSupplierId(r.getSupplierId());
            po.setSupplierName(r.getSupplierName());
            po.setRoomNumber(r.getRoomNumber());
        }
        DailyconsumptionPo po1=dailyconsumptionService.selectByTimeAndRoom(po.getTime(),po.getRoomId(),po.getCid());
        Integer counst=0;
        if (po1==null){
            counst=dailyconsumptionService.insertAll(po);
        }else {
            po.setId(po1.getId());
            counst= dailyconsumptionService.updateTimeRoom(po);
        }
        double sum=dailyconsumptionService.selectSumMoney(po.getTime(),po.getCid(),po.getRoomId(),po.getSupplierId());
        FinancePo po2=financeService.selectByyearM(y,po.getRoomId());
        if (po2!=null) {
            po2.setYearM(y);
            if (po.getCid() == 1) {//被子清理费
                po2.setLinenCleaningfee(sum);

            } else if (po.getCid() == 2) {//日常
                po2.setDailySupplies(sum);
            } else if (po.getCid() == 3) {//其他
                po2.setOtherExpenses(sum);
            }
            counst = financeService.updateOtherById(po2);
        }else {//添加
            FinancePo ppo=new FinancePo();
            ppo.setYearM(y);
            ppo.setRoomId(po.getRoomId());
            ppo.setSupplierId(po.getSupplierId());
            ppo.setRoomNumber(r.getRoomNumber());
            if (po.getCid() == 1) {//被子清理费
                ppo.setLinenCleaningfee(sum);

            } else if (po.getCid() == 2) {//日常
                ppo.setDailySupplies(sum);
            } else if (po.getCid() == 3) {//其他
                ppo.setOtherExpenses(sum);
            }
            counst=financeService.insertAll(ppo);
        }
        Gson gson=new Gson();
        return gson.toJson(counst);
    }


    //新增提成
    @ResponseBody
    @RequestMapping("booking")
    public Object booking(BookingcommissionPo po){
        ModelAndView mv=null;
        mv=new ModelAndView();
        Integer count=0;
        RoomVo r=roomSetService.selectDetailByIds(po.getRoomId());
        if (r!=null){
            po.setSupplierId(r.getSupplierId());
        }
        BookingcommissionPo po1=bookingcommissionService.select(po);
        if (po1==null){
            count=bookingcommissionService.inserAll(po);
        }else {
            po.setId(po1.getId());
            count= bookingcommissionService.updateTimeRoom(po);
        }
        /*  return mv;*/
        Gson gson=new Gson();
        return gson.toJson(count);
    }
    @RequestMapping("bookinglist")
    public ModelAndView bookinglist(String name,Integer currentPage){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/booking");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<BookingcommissionPo> vo=new Page<BookingcommissionPo>();
        vo.setCurrentPage(currentPage);
        Page<BookingcommissionPo> list=bookingcommissionService.listall(name,vo);
        mv.addObject("list",list);
        List<RoomSetPo> rlist=roomSetService.selectHave();
        mv.addObject("rlist",rlist);
        return mv;
    }


    @RequestMapping("todaily")
    public ModelAndView todaily(String time){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/addDaily");
        List<ConsumptiontypePo> clist=consumptiontypeService.list();/*
        DailyconsumptionPo po1=dailyconsumptionService.selectById(id);*/
        List<DailyconsumptionPo> dlist=dailyconsumptionService.list();
        List<SupplierPo> slist=supplierService.listHaveAll();
        List<RoomSetPo> rlist=roomSetService.selectHave();
        mv.addObject("clist",clist);/*
        mv.addObject("po1",po1);*/
        mv.addObject("list",dlist);
        mv.addObject("slist",slist);
        mv.addObject("rlist",rlist);
        return mv;
    }
    //修改日常消费
    @RequestMapping("upconsumption")
    public ModelAndView upconsumption(DailyconsumptionPo po){
        ModelAndView mv=null;
        mv=new ModelAndView("");
        DailyconsumptionPo po1=dailyconsumptionService.selectById(po.getId());
        if (po1==null){
            dailyconsumptionService.insertAll(po);
        }else {
            dailyconsumptionService.updateTimeRoom(po);
        }

        return mv;
    }


    //按月显示每天有几个人
    @ResponseBody
    @RequestMapping("monthRoom")
    public Object monthRoom(String time,Integer roomId)throws Exception{
        ModelAndView mv=new ModelAndView();
        if (time==null){
            Calendar calendar = Calendar.getInstance();
            int year = calendar.get(Calendar.YEAR);
            int month = calendar.get(Calendar.MONTH) + 1;
            time= year + "-" + ( month<10 ? "0" + month : month);
        }
        List<DayRoomNumberVo> dayList=new ArrayList<DayRoomNumberVo>();
        DayRoomNumberVo vo=new DayRoomNumberVo();

        SimpleDateFormat sdfs = new SimpleDateFormat("yyyy-MM-dd");
        Date date2 = sdfs.parse(time);
        List<String> day=TimeTransformation.getMonthFullDay(date2);//今天起30天后的日期
        long times=0;
        for (String s:day){
            List<DayRoomNumberVo> vlist=orderService.selectDayRoom(s,roomId);
           if (vlist.size()==0){
               RoomVo roomSet=roomSetService.selectDetailByIds(roomId);
                 vo = new DayRoomNumberVo();
                 vo.setRoomId(roomSet.getId());
                 vo.setRoomNumber(roomSet.getRoomNumber());
                 vo.setRoomAmount(roomSet.getRoomAmount());
                 vo.setSupplierId(roomSet.getSupplierID());
                 vo.setSupplierName(roomSet.getSupplierName());
               times = (new SimpleDateFormat("yyyy-MM-dd")).parse(s, new ParsePosition(0)).getTime() / 1000;
                 vo.setTimes(times);
                 dayList.add(vo);
           }else {
               Integer count=0;//剩余床位
                for (DayRoomNumberVo v:vlist){
                    count=count+v.getCheckinNumber();//入住人数
                }
               vo = new DayRoomNumberVo();
               vo.setRoomId(vlist.get(0).getRoomId());
               vo.setRoomNumber(vlist.get(0).getRoomNumber());
               vo.setRoomAmount(String.valueOf(Integer.parseInt(vlist.get(0).getRoomAmount())-count));//剩余床位
               vo.setSupplierId(vlist.get(0).getSupplierId());
               vo.setSupplierName(vlist.get(0).getSupplierName());
               times = (new SimpleDateFormat("yyyy-MM-dd")).parse(s, new ParsePosition(0)).getTime() / 1000;
               vo.setTimes(times);
               dayList.add(vo);
           }
        }
        Gson gson=new Gson();
        return gson.toJson(dayList);
        //return mv;
    }




    //////////////////////////////////////////合约///////////////////////////////////////////////////////////////////////////////

    //添加合约订单
    @RequestMapping("/addContractOrder")
    public ModelAndView addContract(OrderPo orderPo,String name,Integer genderName,String phoneNumber) {
        ModelAndView mv = null;
        mv = new ModelAndView("/public/accommodation");
        int count=passengerService.selectYZ(name,phoneNumber);
        int paId=1;
        if (count>0){//有用户
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
        //自有房的订单
        orderPo.setType(2);
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
        orderService.inserAll(orderPo);
        return mv;
    }

    //显示所有状态订单
    @RequestMapping("/allContractOrder")
    public ModelAndView allContractOrder(String name,String orderNumber,Integer currentPage){
        ModelAndView mv=null;
        mv=new ModelAndView("/public/accommodation2");
        return mv;
    }

    //获取已确认订单，默认显示当天数据
    @RequestMapping("checkin")
    public ModelAndView listChekin(String orderNumber,Integer passengerId,long time,Integer currentPage){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/accommodation2");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=this.orderService.selectCheckinList(orderNumber, passengerId,time,vo);
        mv.addObject("list",vo);
        return mv;
    }

    //获取订单明细
    @RequestMapping("orderDetail")
    public ModelAndView selectOrderDetail(String orderNumber,Integer currentPage){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/finance1");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
       /* Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        vo=this.orderService.selectOrderDetail(orderNumber,vo);*/
       // mv.addObject("list",vo);
        return mv;
    }

    //财务报表
    @RequestMapping("financial")
    public ModelAndView financial(String startTime, Integer currentPage){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/finance2");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        if (startTime==null){

        }
       // Timestamp time = Timestamp.valueOf(startTime);
        Page<FinancePo> vo=new Page<FinancePo>();
        vo.setCurrentPage(currentPage);
        vo=this.financeService.list(startTime,vo);
        mv.addObject("list",vo);
        return mv;
    }

    //查询问题
    @RequestMapping("question")
    public ModelAndView question(String name,Integer currentPage){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/question");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        List<QuestionPo> list=questionService.listall(name);
        mv.addObject("list",list);
        return mv;
    }

    //查询问题
    @ResponseBody
    @RequestMapping("addquestion")
    public Object addquestion(QuestionPo questionPo){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/question");

        questionPo.setCreateTime(System.currentTimeMillis());
        Integer count=questionService.inserAll(questionPo);
        Gson gson=new Gson();
        return gson.toJson(count);
       // return mv;
    }

    ////////////////////////////////////共有////////////////////////////////////////////////////////////////////////////

    //验证订单号是否存在
    @ResponseBody
    @RequestMapping("codeNumberYZ")
    public Object codeNumberYZ(String orderNumber){
        Integer count=orderService.codeNumberYZ(orderNumber);
        Gson gson = new Gson();
        return gson.toJson(count);
    }

    //获取账户
    @RequestMapping("getAccount")
    public ModelAndView getAccount(){
        ModelAndView mv=null;
        mv=new ModelAndView("order/accommodation");
        List<AccountPo> alist=accountService.getAccount();
        mv.addObject("lista",alist);
        return mv;

    }

   /* @ResponseBody
    @RequestMapping("checkinDay")
    public Object checkinDay(String time,int roomId,int number){
        List<IndayVo> count=orderService.checkinDay(time, roomId);
        RoomSetPo roomSetPo=roomSetService.selectById(roomId);
        int t=0;
        int ok=0;
        for (IndayVo i:count ) {
            t=t+i.getNumber();//现有住宿人
        }
        if (t<Integer.parseInt(roomSetPo.getRoomAmount())){//有床位
            if (number<=t){//床位大于等于入住人数
                ok=1;
            }
        }
        Gson gson = new Gson();
        return gson.toJson(ok);
    }
*/


    //到账
    @ResponseBody
    @RequestMapping("isdao")
    public Object isdao(int id){
        Timestamp d = new Timestamp(System.currentTimeMillis());
        orderService.updateMoney(id,d);
        Gson gson = new Gson();
        return gson.toJson(1);
    }








    @ResponseBody
    @RequestMapping("checkinDay")
    public Object checkinDay(OrderPo orderPo){
        String strn = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckinTime());
        List<IndayVo> count=orderService.checkinDay(strn, orderPo.getRoomId());//查询是否有人住
        RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
        int t=0;
        int ok=0;
        for (IndayVo i:count ) {
            t=t+i.getNumber();//现有住宿人
        }
        if (t==0){
            if (orderPo.getCheckinNumber()<=Integer.parseInt(roomSetPo.getRoomAmount())){//床位大于等于入住人数
                ok=1;
            }
        }else {
            if (t<Integer.parseInt(roomSetPo.getRoomAmount())){//有床位
                if (orderPo.getCheckinNumber()<t){//床位大于等于入住人数
                    ok=1;
                }
            }
        }

        Gson gson = new Gson();
        return gson.toJson(ok);
    }
  @RequestMapping("test")
    public ModelAndView test(){
        ModelAndView mv=null;
        mv=new ModelAndView("order/accommodation");
      OrderPo orderPo=new OrderPo();
      String s1="2020-03-09 14:29:55";
      String s2="2020-03-12 14:29:55";
      Timestamp t1= Timestamp.valueOf(s1);
      Timestamp t2= Timestamp.valueOf(s2);
      orderPo.setCheckinTime(t1);
      orderPo.setCheckoutTime(t2);
      //判断入住天数
      String strn = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckinTime());
      String strn2 = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckoutTime());
      int day=TimeTransformation.nDaysBetweenTwoDate(strn,strn2);
        return mv;
    }




    ///////////////导出excel////////////////////

    //财务报表
    @ResponseBody
    @RequestMapping("/excel")
    public Object excel(String time) {
        ModelAndView mv = null;
        String time2=null;
        if (time==null ||time==""){//默认当前月
            Timestamp timestamp=new Timestamp(System.currentTimeMillis());
            time2= new SimpleDateFormat("yyyy-MM").format(timestamp).toString();
        }else {//根据月查
            time2 = time;
        }
        FinancePo fp=new FinancePo();
        List<FinancePo> fpl=new ArrayList<FinancePo>();
        double sumPHP=0d;
        double sumCNY=0d;
        double booking=0d;
        List<FinancePo> list=financeService.list(time2);
        BookingcommissionPo book=bookingcommissionService.selectMoney(time2);//按月查
        if (book==null){
            booking=0d;
        }else {
            booking=book.getBooking();
        }

        for (FinancePo f:list) {
            sumPHP=sumPHP+f.getCount();
            sumCNY=sumCNY+f.getRMB();
        }
        sumPHP=sumPHP-booking;

        /*Integer count=stayRegisterService.countAll();*/
        //创建excel表的表头
        String[] headers = {"序号", "房间Room", "订单收入Order revenue（PHP）", "订单收入Order revenue（CNY）",
                "房租rent（PHP）", "水费Charge for water", "电费Electricity fees", "维修费maintenance cost"
                , "网络network", "大厦管理费Building management fee", "被铺清洗费Linen Cleaning fee"
                , "日常用品Daily supplies", "其他费用Other expenses", "小计Subtotal"};
        //创建Excel工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表sheet
        HSSFSheet sheet = workbook.createSheet();

        //字体
        // 1.生成字体对象
        Font font = workbook.createFont();
        font.setFontHeightInPoints((short) 11);
        font.setFontName("宋体");

        // 2.生成样式对象
        CellStyle style = workbook.createCellStyle();
        style.setFont(font); // 调用字体样式对象
        style.setWrapText(true);//自动换行


        //创建第一行
        HSSFRow row = sheet.createRow(0);
        //定义一个单元格,相当于在第一行插入了三个单元格值分别是

        HSSFCell cell = null;
        row.setHeightInPoints(40);//目的是想把行高设置成20px

        //插入第一行数据
        for (int i = 0; i < headers.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(style);
        }
        int cou = 0;
        //追加数据
        HSSFRow nextrow = null;
        for (int i = 1; i <= list.size(); i++) {
            cou++;
            nextrow = sheet.createRow(i);
            nextrow.setHeightInPoints(40);
          /*  nextrow.setHeight((short) 40);              //设置行高*/
            HSSFCell cell2 = nextrow.createCell(0);
            // 3.单元格应用样式
            cell2.setCellStyle(style);
            cell2.setCellValue(i);
            cell2 = nextrow.createCell(1);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getRoomNumber());
            cell2 = nextrow.createCell(2);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getPHP());
            cell2 = nextrow.createCell(3);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getRMB());
            cell2 = nextrow.createCell(4);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getRent());
            cell2 = nextrow.createCell(5);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getWater());
            cell2 = nextrow.createCell(6);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getElectricity());
            cell2 = nextrow.createCell(7);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getMaintenanceCost());
            cell2 = nextrow.createCell(8);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getNetwork());
            cell2 = nextrow.createCell(9);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getBuildingManagementFee());
            cell2 = nextrow.createCell(10);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getLinenCleaningfee());
            cell2 = nextrow.createCell(11);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getDailySupplies());
            cell2 = nextrow.createCell(12);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getOtherExpenses());
            cell2 = nextrow.createCell(13);
            double summ=list.get(i - 1).getPHP()-list.get(i - 1).getRent()-list.get(i - 1).getWater()-list.get(i - 1).getElectricity()
                    -list.get(i - 1).getMaintenanceCost()-list.get(i - 1).getNetwork()-list.get(i - 1).getBuildingManagementFee()
                    -list.get(i - 1).getLinenCleaningfee()-list.get(i - 1).getDailySupplies()-list.get(i - 1).getOtherExpenses();
            cell2.setCellStyle(style);
            cell2.setCellValue(summ);
            cell2 = nextrow.createCell(14);


            sheet.setColumnWidth(i, 25 * 256);
            if (cou == list.size()) {
                nextrow = sheet.createRow(list.size()+1);
                nextrow.setHeightInPoints(50);
                cell2 = nextrow.createCell(12);
                cell2.setCellStyle(style);
                cell2.setCellValue("接单提成walk in guest dapfasom");
                cell2 = nextrow.createCell(13);
                cell2.setCellStyle(style);
                cell2.setCellValue(booking);

                nextrow = sheet.createRow(list.size()+2);
                nextrow.setHeightInPoints(40);
                cell2 = nextrow.createCell(1);
                cell2.setCellStyle(style);
                cell2.setCellValue("合计");
                cell2 = nextrow.createCell(12);
                cell2.setCellStyle(style);
                cell2.setCellValue("合计Total（PHP）");
                cell2 = nextrow.createCell(13);
                cell2.setCellStyle(style);
                cell2.setCellValue(sumPHP);

                nextrow = sheet.createRow(list.size()+3);
                nextrow.setHeightInPoints(40);
                cell2 = nextrow.createCell(12);
                cell2.setCellStyle(style);
                cell2.setCellValue("合计Total（CNY）" );
                cell2 = nextrow.createCell(13);
                cell2.setCellStyle(style);
                cell2.setCellValue(sumCNY);

                sheet.setColumnWidth(cou+4, 20 * 256);
                sheet.setColumnWidth(cou+5, 20 * 256);
                sheet.setColumnWidth(cou+6, 20 * 256);
            }

        }

        //创建一个文件
        File file=null;
            String name=getFileName("d:/hotelm/",time2+"财务报表.xls",0);
            file = new File(name);

        try {
            file.createNewFile();
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        //将内容存盘
        FileOutputStream stream;
        try {
            stream = FileUtils.openOutputStream(file);
            workbook.write(stream);
            stream.close();
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
       /* mv=new ModelAndView("redirect:/Order/financial.do");
        return mv;*/
        Gson gson = new Gson();
        return gson.toJson(1);
    }


    /**
     * 如果某个路径下已经存在了与要保存的文件名重复了，则在新的文件后面加（1）。。。。
     * @param paths
     * @param filename
     * @param num
     * @return
     */
    public static String getFileName(String paths, String filename, int num) {
        File file = null;
        String[] filenameArr = filename.split("\\.");
        int length = filenameArr.length;
        String filenameStr="";
        //此处的目的是为了避免文件名称含有“.”的文件名重复时，出错，我们必须保证是在最后一个“.”的前面加上“(2)”
        for(int i=0;i<=length-2;i++){
            filenameStr = filenameStr+ filenameArr[i]+".";
        }
        if (num > 0) {
            file = new File(paths + "\\" + filenameStr.substring(0, filenameStr.length()-1) + "(" + String.valueOf(num == 1 ? 2 : num) + ")." + filenameArr[filenameArr.length - 1]);
        } else {
            file = new File(paths + "\\" + filename);
        }

        if (file.exists()) {
            return getFileName(paths, filename, ++num);
        } else {
            if (num > 0) {
                return paths + "\\" + filenameStr.substring(0, filenameStr.length()-1) + "(" + String.valueOf(num == 1 ? 2 : num) + ")." + filenameArr[filenameArr.length - 1];
            } else {
                return paths + "\\" + filename;
            }
        }
    }


   /* @RequestMapping("date")
    public ModelAndView hhh(){

        Date date=new Date("2020-3-19");
     Date s=TimeTransformation.getDate(date,19);
        return null;
    }*/


}
