package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.util.TimeTransformation;
import com.gx.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import  com.gx.service.PlatformService;

import java.io.File;
import java.sql.Timestamp;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

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
    @Autowired
    private AnserService anserService;


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

    //分页订单
    @ResponseBody
    @RequestMapping("/pageorder")
    public Object pageorder(String orderNumber,Integer passengerId,Integer currentPage,Integer status) {
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        if (status==0){//已确认
            vo=this.orderService.list(orderNumber, passengerId,vo);
        }else if (status==1){//已入住
            vo=this.orderService.checkinorder(orderNumber, passengerId,vo);
        }else if (status==2){//已退房
            vo=this.orderService.checkoutorder(orderNumber, passengerId,vo);
        }else if (status==3){//已到账
            vo=this.orderService.myaccount(orderNumber, passengerId,vo);
        }

        Gson gson=new Gson();
        return gson.toJson(vo);
    }


    @RequestMapping("/pageorders")
    public ModelAndView pageorders(String orderNumber,Integer passengerId,Integer currentPage,Integer status) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/accommodation");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<OrderDetailsVo> vo=new Page<OrderDetailsVo>();
        vo.setCurrentPage(currentPage);
        if (status==0){//已确认
            vo=this.orderService.list(orderNumber, passengerId,vo);
            mv.addObject("status",0);
        }else if (status==1){//已入住
            vo=this.orderService.checkinorder(orderNumber, passengerId,vo);
            mv.addObject("status",1);
        }else if (status==2){//已退房
            vo=this.orderService.checkoutorder(orderNumber, passengerId,vo);
            mv.addObject("status",2);
        }else if (status==3){//已到账
            vo=this.orderService.myaccount(orderNumber, passengerId,vo);
            mv.addObject("status",3);
        }
        mv.addObject("lists",vo);
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
    public ModelAndView myfinance(String time,Integer currentPage)throws Exception {
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
           SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");//注意月份是MM
           Date date = simpleDateFormat.parse(time);
           time2= simpleDateFormat.format(date).toString();
       }
      /*  Page<FinancePo> vo=new Page<FinancePo>();
        vo.setCurrentPage(currentPage);*/
        List<Object> name=new ArrayList<Object>();
        FinancePo fp=new FinancePo();
        List<FinancePo> fpl=new ArrayList<FinancePo>();
        double sumPHP=0d;
        double sumCNY=0d;
        double booking=0d;
      /*  Page<FinancePo> list=financeService.list(time2,vo);*/
        List<FinancePo> list=financeService.list(time2);
        if (list.size()==0){//无数据
            mv.addObject("time",time2);
            mv.addObject("da",0);
            return mv;
        }
        BookingcommissionPo book=bookingcommissionService.selectMoney(time2);//按月查
        if (book==null){
            booking=0d;
        }else {
            booking=book.getBooking();
        }
        List<ConsumptiontypePo> type=consumptiontypeService.list();
        Map<String,Double> day=new HashMap<String,Double>();
        List<DailyconsumptionPo> dlist=null;
        double dsum=0;
        double dsums=0d;
        for (FinancePo f:list) {
            dsums=0d;
            fp=new FinancePo();
            dlist=  new ArrayList<DailyconsumptionPo>();
            for (ConsumptiontypePo t:type) {
                dsum=0;
                DailyconsumptionPo po = dailyconsumptionService.financesum(f.getRoomId(), time2 + "-01",t.getId());
                if (po!=null){
                    dsums=dsums+po.getMm();
                    dsum=dsum+po.getMm();
                    day.put(t.getName(),po.getMm());
                    DailyconsumptionPo d=new DailyconsumptionPo();
                    d.setMm(dsum);
                    d.setName(t.getName());
                    d.setMoney(po.getMm());
                    d.setCid(t.getId());
                    dlist.add(d);
                }else {
                    day.put(t.getName(),0d);
                    DailyconsumptionPo d=new DailyconsumptionPo();
                    d.setMm(0);
                    d.setName(t.getName());
                    d.setMoney(0d);
                    d.setCid(t.getId());
                    dlist.add(d);
                }
            }
            f.setCount(f.getCount()-dsums);
            fp=f;
            fp.setDlist(dlist);
            fpl.add(fp);
            sumPHP = sumPHP + f.getCount();
            sumCNY = sumCNY + f.getRMB();
        }


        sumPHP=sumPHP-booking;

        name.add("序号");
        name.add("房号");
        name.add("订单输入(PHP)");
        name.add("订单输入(RMB)");
        name.add("房租");
        name.add("水费");
        name.add("电费");
      /*  name.add("维修费");*/
        name.add("网络");
        name.add("大厦管理费");
        if (list.size()!=0) {
            for (DailyconsumptionPo d : list.get(0).getDlist()) {
                name.add(d.getName());
            }
        }
      /*  for (String key:day.keySet()){
            name.add(key);
        }*/
        name.add("小计");
        mv.addObject("sumPHP",sumPHP);
        mv.addObject("sumCNY",sumCNY);
        mv.addObject("booking",booking);
        mv.addObject("time",time2);
        mv.addObject("list",list);
        mv.addObject("name",name);
        mv.addObject("size",name.size());
        mv.addObject("da",1);
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

        //根据分页查出分页房间
        Page<OrderTimeVo> rlist=orderService.selectRoomPage(vo);
        for (OrderTimeVo v:rlist.getResult()){
            allid.add(v.getRoomId());
        }
        List<OrderTimeVo> olist2=orderService.selectRoomByTimes(timestamp,allid);//查出入住房间
        for (OrderTimeVo o:olist2){
            id.add(o.getRoomId());
        }
        List<OrderTimeVo> olist3=null;
        List<OrderTimeVo> olist4=null;
        OrderTimeVo orderTimeVo=null;
        if (id.size()==0){//判断入住是否为空
            olist3=orderService.selectRoomByins(allid);//全空房
        }else {
            olist3=orderService.selectRoomByin(id,allid);//全空房
        }
        for (OrderTimeVo v:olist3){//得到全空房的剩余床位
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

        for (OrderTimeVo o :olist2 ) {//得到去重后的已有人入住房间俺的剩余床位
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
        //根据roomID排序
        Collections.sort(olist, new Comparator<OrderTimeVo>() {
            @Override
            public int compare(OrderTimeVo o1, OrderTimeVo o2) {
                //升序
                return o1.getRoomId().compareTo(o2.getRoomId());
            }

        });
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

        List<OrderTimeVo> rlist=orderService.selectRoom();
        for (OrderTimeVo v:rlist){
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
        //根据roomID排序
        Collections.sort(olist, new Comparator<OrderTimeVo>() {
            @Override
            public int compare(OrderTimeVo o1, OrderTimeVo o2) {
                //升序
                return o1.getRoomId().compareTo(o2.getRoomId());
            }
        });

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
        Integer counts=0;
        counts= orderService.updateStatus(orderNumber, status);
        OrderPo orderPo=orderService.selectByOrderNumber(orderNumber);//根据订单号查询订单
        RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
        if (status==6){//退房
            String satrt=time.substring(0,time.lastIndexOf("-"));
            String end=time.substring(time.lastIndexOf("-")+1,time.length());
            if (satrt.trim().length()>0 && end.trim().length()>0){
                counts=orderService.updateInEnd(satrt,end,orderPo.getId());
            }
            //退房就到账
         /*   Timestamp d = new Timestamp(System.currentTimeMillis());
            counts=orderService.updateMoney(orderPo.getId(),d);*/
            Timestamp timestamp=new Timestamp(System.currentTimeMillis());
            String time2=null;
            if (orderPo.getOrderTime()==null){
               time2 = new SimpleDateFormat("yyyy-MM").format(timestamp).toString();
            }else {
             time2 = new SimpleDateFormat("yyyy-MM").format(orderPo.getOrderTime()).toString();
            }

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
        Timestamp d = new Timestamp(System.currentTimeMillis());
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
            po.setCreateTime(d);
            counst=dailyconsumptionService.insertAll(po);
        }else {
            po.setId(po1.getId());
            po.setCreateTime(d);
            counst= dailyconsumptionService.updateTimeRoom(po);
        }
        FinancePo financePo=financeService.selectByyearM(y,po.getRoomId());
        if (financePo==null){
            FinancePo po2=new FinancePo();
            po2.setYearM(y);
            po2.setRoomId(po.getRoomId());
            po2.setRoomNumber(r.getRoomNumber());
            financeService.insertAll(po2);
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

//日程消费列表
    @RequestMapping("todaily")
    public ModelAndView todaily(String time,Integer currentPage){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/addDaily");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        Page<DailyconsumptionPo> vo=new Page<DailyconsumptionPo>();
        vo.setCurrentPage(currentPage);

        List<ConsumptiontypePo> clist=consumptiontypeService.listAll();
        /*DailyconsumptionPo po1=dailyconsumptionService.selectById(id);*/
        List<DailyconsumptionPo> dlist=dailyconsumptionService.list();
        Page<DailyconsumptionPo> list=dailyconsumptionService.listpage(time,vo);
        List<SupplierPo> slist=supplierService.listHaveAll();
        List<RoomSetPo> rlist=roomSetService.selectHave();
        List<ConsumptiontypePo> typelist=consumptiontypeService.listAll();
        mv.addObject("clist",clist);/*
        mv.addObject("po1",po1);*/
        mv.addObject("list",dlist);
        mv.addObject("lists",list);
        mv.addObject("slist",slist);
        mv.addObject("rlist",rlist);
        mv.addObject("typelist",typelist);
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

    //新增消费类型
    @ResponseBody
    @RequestMapping("addType")
    public Object addType(ConsumptiontypePo po){
        ModelAndView mv=null;
        mv=new ModelAndView();
        Integer count=0;
       ConsumptiontypePo c=consumptiontypeService.nameYZ(po.getName());
       if (c==null){//新增
           count= consumptiontypeService.inserAll(po);
       }else {//不做处理
           count=1;
       }
        Gson gson=new Gson();
        return gson.toJson(count);
    }

    //新增消费类型
    @ResponseBody
    @RequestMapping("updateType")
    public Object updateType(Integer id,Integer status){
        /*Integer count=consumptiontypeService.updateStatus(status, id);*/
        Integer count=consumptiontypeService.delete(id);
        Gson gson=new Gson();
        return gson.toJson(count);
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
            int day = calendar.get(Calendar.DATE) ;
            time= year + "-" + ( month<10 ? "0" + month : month)+"-"+day;
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

    //查询问题
    @RequestMapping("question")
    public ModelAndView question(String name,Integer currentPage){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/questions");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        List<QuestionAnserVo> lists=new ArrayList<QuestionAnserVo>();
        QuestionAnserVo questionPo=new QuestionAnserVo();
        List<AnserPo> alist=new ArrayList<AnserPo>();
        AnserPo anserPo=new AnserPo();
        List<QuestionPo> list=questionService.listall(name);
        for (QuestionPo p:list){
            questionPo=new QuestionAnserVo();
            questionPo.setQid(p.getId());
            questionPo.setHotelm(p.getHotelm());
            questionPo.setTitle(p.getTitle());
            questionPo.setTime(p.getCreateTime());
            List<AnserPo> alists=anserService.listall(p.getId());
            questionPo.setAlist(alists);
            lists.add(questionPo);
        }
        mv.addObject("list",lists);
        return mv;
    }

    //新增问题
    @ResponseBody
    @RequestMapping("addquestion")
    public Object addquestion(String title){
        ModelAndView mv=null;
        mv=new ModelAndView("/order/question");
        QuestionPo questionPo=new QuestionPo();
        questionPo.setHotelm(1);
        questionPo.setTitle(title);
        questionPo.setCreateTime(System.currentTimeMillis());
        Integer count=0;
        if (title!=null && title!=" " && title.length()!=0){
            count=questionService.inserAll(questionPo);
        }
        Gson gson=new Gson();
        return gson.toJson(count);
       // return mv;
    }
    //根据id查询问题
    @ResponseBody
    @RequestMapping("getquestion")
    public Object getquestion(Integer id){
        QuestionPo questionPo=questionService.questionById(id);
        Gson gson=new Gson();
        return gson.toJson(questionPo);
    }

    //修改问题
    @ResponseBody
    @RequestMapping("upquestion")
    public Object upquestion(QuestionPo po){
        po.setCreateTime(System.currentTimeMillis());
        Integer count=0;
        if (po.getId()!=null){
            count=questionService.updateById(po);
        }
        Gson gson=new Gson();
        return gson.toJson(count);
        // return mv;
    }
    //删除问题
    @ResponseBody
    @RequestMapping("deleteQuestions")
    public Object deleteQuestions(Integer id){
        Integer count=0;
        count=questionService.deleteById(id);
        count=anserService.delByquestionId(id);
        Gson gson=new Gson();
        return gson.toJson(count);
    }


    //新增/修改问题回答
    @ResponseBody
    @RequestMapping("getAnser")
    public Object getAnser(Integer id){
        AnserPo po=anserService.questionById(id);
        Gson gson=new Gson();
        return gson.toJson(po);
    }

    //新增问题回答
    @ResponseBody
    @RequestMapping("addAnser")
    public Object addAnser(String title,Integer questionId){
        AnserPo po=new AnserPo();
        Timestamp timestamp=new Timestamp(System.currentTimeMillis());
        po.setTime(timestamp);
        po.setAnswer(title);
        po.setQuestionId(questionId);
        Integer count=anserService.insertAll(po);
        Gson gson=new Gson();
        return gson.toJson(count);
    }
    //修改问题回答
    @ResponseBody
    @RequestMapping("upanser")
    public Object upanser(AnserPo po){
        Integer count=anserService.updateById(po);
        Gson gson=new Gson();
        return gson.toJson(count);
    }

    //删除问题回答
    @ResponseBody
    @RequestMapping("deleteAnser")
    public Object deleteAnser(Integer id){
        Integer count=anserService.delById(id);
        Gson gson=new Gson();
        return gson.toJson(count);
    }


    //点击消费显示消费详情(订单)
    @ResponseBody
    @RequestMapping("financeDatil")
    public Object financeDatil(String time,Integer roomId){
        List<OrderDetailsVo> list=orderService.fianceorder(roomId);
        Gson gson=new Gson();
        return gson.toJson(list);
    }
    //点击其他消费显示消费详情(订单)
    @ResponseBody
    @RequestMapping("otherDatil")
    public Object financeDatil(Integer roomId,Integer cid){
        List<DailyconsumptionPo> list=dailyconsumptionService.dailydateil(roomId,cid);
        Gson gson=new Gson();
        return gson.toJson(list);
    }
    //根据id查询消费
    @ResponseBody
    @RequestMapping("dayById")
    public Object selelcDay(Integer id){
        DailyconsumptionPo da=dailyconsumptionService.selectById(id);
        Gson gson=new Gson();
        return gson.toJson(da);
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
    public Object isdao(Integer id){
        Timestamp d = new Timestamp(System.currentTimeMillis());
       Integer count= orderService.updateMoney(id,d);
        Gson gson = new Gson();
        return gson.toJson(count);
    }








    @ResponseBody
    @RequestMapping("checkinDay")
    public Object checkinDay(OrderPo orderPo){
        String strn = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckinTime());
        List<IndayVo> count=orderService.checkinDay(strn, orderPo.getRoomId());//查询是否有人住
        RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
        int t=0;
        int ok=0;
        for (IndayVo i:count ) {//入住时间到其他订单退房时间内的入住人数
            if (i.getCount()>0){
                t=t+i.getNumber();//现有住宿人
            }
        }
        if (t==0){
            if (orderPo.getCheckinNumber()<=Integer.parseInt(roomSetPo.getRoomAmount())){//床位大于等于入住人数
                ok=1;
            }
        }else {
            if (t<Integer.parseInt(roomSetPo.getRoomAmount())){//有床位  入住人====》床位
                if (orderPo.getCheckinNumber()<=Integer.parseInt(roomSetPo.getRoomAmount())-t){//床位大于等于入住人数
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
    @ResponseBody
    @RequestMapping("/excel2")
        public Object list(String time){
        String time2=null;
        if (time==null ||time==""){//默认当前月
            Timestamp timestamp=new Timestamp(System.currentTimeMillis());
            time2= new SimpleDateFormat("yyyy-MM").format(timestamp).toString();
        }else {//根据月查
            time2 = time;
        }

        List<Object> name=new ArrayList<Object>();
        FinancePo fp=new FinancePo();
        List<FinancePo> fpl=new ArrayList<FinancePo>();
        FinanceVo financeVo=new FinanceVo();
        List<FinanceVo> lists=new ArrayList<FinanceVo>();
        double sumPHP=0d;//php
        double sumCNY=0d;//人民币
        double booking=0d;//提成
        List<FinancePo> list=financeService.list(time2);
        if (list.size()==0){
            Gson gson=new Gson();
            return gson.toJson(financeVo);
        }
     /*   financeVo.setList(list);*/
        BookingcommissionPo book=bookingcommissionService.selectMoney(time2);//按月查
        if (book==null){
            booking=0d;
            financeVo.setBooking(booking);
        }else {
            booking=book.getBooking();
            financeVo.setBooking(booking);
        }
        List<ConsumptiontypePo> type=consumptiontypeService.list();
        Map<String,Double> day=new HashMap<String,Double>();
        List<DailyconsumptionPo> dlist=null;
        double dsum=0;
        double dsums=0d;
        for (FinancePo f:list) {
            dsums=0d;
            fp=new FinancePo();
            dlist=  new ArrayList<DailyconsumptionPo>();
            for (ConsumptiontypePo t:type) {
                dsum=0;
                DailyconsumptionPo po = dailyconsumptionService.financesum(f.getRoomId(), time2 + "-01",t.getId());
                if (po!=null){
                    dsums=dsums+po.getMm();
                    dsum=dsum+po.getMm();
                    day.put(t.getName(),po.getMm());
                    DailyconsumptionPo d=new DailyconsumptionPo();
                    d.setMm(dsum);
                    d.setName(t.getName());
                    d.setMoney(po.getMm());
                    d.setCid(t.getId());
                    dlist.add(d);
                }else {
                    day.put(t.getName(),0d);
                    DailyconsumptionPo d=new DailyconsumptionPo();
                    d.setMm(0);
                    d.setName(t.getName());
                    d.setMoney(0d);
                    d.setCid(t.getId());
                    dlist.add(d);
                }
            }
            f.setCount(f.getCount()-dsums);
            fp=f;
            fp.setDlist(dlist);
            fpl.add(fp);
            sumPHP = sumPHP + f.getCount();
            sumCNY = sumCNY + f.getRMB();
        }


        sumPHP=sumPHP-booking;

        name.add("序号");
        name.add("房号");
        name.add("订单输入(PHP)");
        name.add("订单输入(RMB)");
        name.add("房租");
        name.add("水费");
        name.add("电费");
     /*   name.add("维修费");*/
        name.add("网络");
        name.add("大厦管理费");
        if (list.size()!=0) {
            for (DailyconsumptionPo d : list.get(0).getDlist()) {
                name.add(d.getName());
            }
        }
      /*  for (String key:day.keySet()){
            name.add(key);
        }*/
        name.add("小计");

        financeVo.setSumPHP(sumPHP);
        financeVo.setSumCNY(sumCNY);
        financeVo.setList(fpl);
        financeVo.setName(name);
      /*  lists.add(financeVo);*/
        Gson gson=new Gson();
        return gson.toJson(financeVo);
       /* return lists;*/
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
    @ResponseBody
    @RequestMapping("testf")
    public Object testf(){
        Timestamp timestamp=new Timestamp(System.currentTimeMillis());
        String time2= new SimpleDateFormat("yyyy-MM").format(timestamp).toString();
        List<FinancePo> p=financeService.list(time2);
        Gson gson=new Gson();
        return gson.toJson(p);
    }


}
