package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.util.TimeTransformation;
import com.gx.vo.IndayVo;
import com.gx.vo.OrderDetailsVo;
import com.gx.vo.OrderTimeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import  com.gx.service.PlatformService;

import javax.jws.WebParam;
import java.sql.Timestamp;
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
          time2 = new SimpleDateFormat("yyyy-MM").format(time);
       }
        Page<FinancePo> vo=new Page<FinancePo>();
        vo.setCurrentPage(currentPage);
        FinancePo fp=new FinancePo();
        List<FinancePo> fpl=new ArrayList<FinancePo>();
        double sumPHP=0d;
        double sumCNY=0d;
        double booking=0d;
        Page<FinancePo> list=financeService.list(time2,vo);
        for (FinancePo f:list.getResult()) {
           sumPHP=sumPHP+f.getCount();
           sumCNY=sumCNY+f.getRMB();
        }
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
        Page<OrderTimeVo> list=orderService.selectRoomByTime(timestamp,vo);
        for (OrderTimeVo o :list.getResult() ) {//相同房间的空床
            if (o.getNumber()==null){//无人入住房
                coun.put(o.getRoomId(),-1);
            }else {
                if (coun.get(o.getRoomId())==null){//count还为空
                    coun.put(o.getRoomId(),o.getNumber());
                }else {
                    coun.put(o.getRoomId(),coun.get(o.getRoomId())+o.getNumber());
                }

            }

        }
        Map<Integer,Integer> key=new HashMap<Integer,Integer>();
        for (OrderTimeVo o :list.getResult() ) {
            if (coun.containsKey(o.getRoomId())){
                ov=new OrderTimeVo();
                if (!key.containsKey(o.getRoomId())) {//roomId相同
                    if (coun.get(o.getRoomId())==-1){
                        ov.setRemainingBeds(o.getRoomAmount());
                    }else if (coun.get(o.getRoomId())==0){
                        ov.setRemainingBeds(0);
                    }else {
                        ov.setRemainingBeds(o.getRoomAmount()-coun.get(o.getRoomId()));
                    }

                    ov.setOrderId(o.getOrderId());
                    ov.setRoomId(o.getRoomId());
                    ov.setSupplierName(o.getSupplierName());
                    ov.setRoomNumber(o.getRoomNumber());
                    ov.setRoomAmount(o.getRoomAmount());
                    olist.add(ov);
                    vo.setResult(olist);
                    key.put(o.getRoomId(),1);
                }
            }
        }

        List<SupplierPo> slist=supplierService.listHaveAll();//自有酒店
        List<AccountPo> alist=accountService.getAccount();//账户
        List<PlatformPo> plist=platformService.listAll();
        mv.addObject("list",vo);
        mv.addObject("slist",slist);
        mv.addObject("alist",alist);
        mv.addObject("plist",plist);
        return mv;
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
        roomAndTimeService.inserAll(roomAndTime);
        //return mv;
        Gson gson = new Gson();
        return gson.toJson(1);
    }

    //修改订单状态
    @RequestMapping("updateStatus")
    public ModelAndView updateStatus(String orderNumber,Integer status){
        ModelAndView mv=null;
        if (status==5){//入住
            mv=new ModelAndView("redirect:/Order/myorder.do");
        }else if (status==6){//退房
            mv=new ModelAndView("redirect:/Order/checkinorder.do");
        }
        orderService.updateStatus(orderNumber, status);
        OrderPo orderPo=orderService.selectByOrderNumber(orderNumber);//根据订单号查询订单
        RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
        if (status==6){//退房
            //退房就到账
            Timestamp d = new Timestamp(System.currentTimeMillis());
            orderService.updateMoney(orderPo.getId(),d);

          roomAndTimeService.deleteOrder(orderPo.getId());
          /*  String[] strNow = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString().split("-");
            Integer year = Integer.parseInt(strNow[0]);
            Integer month = Integer.parseInt(strNow[1]);
           *//* Integer day = Integer.parseInt(strNow[2]);*//*
            String time=year+"-"+month;//2020-01
              String time2=time.trim();*/
            Timestamp timestamp=new Timestamp(System.currentTimeMillis());
            String time2 = new SimpleDateFormat("yyyy-MM").format(timestamp).toString();
            int count=financeService.countFinanceM(time2,orderPo.getRoomId());
            if (count>=1){//修改
                FinancePo po=new FinancePo();
                FinancePo financePo=financeService.selectByyearM(time2,orderPo.getRoomId());
              if (orderPo.getCurrency()==1){//RMB
                  po.setRMB(financePo.getRMB()+orderPo.getMoney());
                po.setId(financePo.getId());
                financeService.updateRMB(po);
              }else if (orderPo.getCurrency()==2){//PHP
                  po.setPHP(financePo.getPHP()+orderPo.getMoney());
                  po.setId(financePo.getId());
                  financeService.updatePHP(po);
              }
            }else {//新增
            FinancePo financePo=new FinancePo();
            financePo.setRoomId(orderPo.getRoomId());
            financePo.setRoomNumber(roomSetPo.getRoomNumber());
            financePo.setSupplierId(roomSetPo.getSupplierID());
                if (orderPo.getCurrency()==1){//RMB
                    financePo.setRMB(orderPo.getMoney());
                    financePo.setYearM(time2);
                    financeService.insertAll(financePo);
                }else if (orderPo.getCurrency()==2){//PHP
                    financePo.setPHP(orderPo.getMoney());
                    financePo.setYearM(time2);
                    financeService.insertAll(financePo);
                }
            }
        }
        return mv;
    }



    //新增消费订单
    @RequestMapping("addFinance")
    public ModelAndView addFinance(FinancePo financePo){
        ModelAndView mv=null;
        mv=new ModelAndView();/*
        FinancePo po=financeService.selectByyearM(fin)*/
        financeService.updateRentById(financePo);
        return mv;
    }
    //新增日常消费
    @RequestMapping("dailyconsumption")
    public ModelAndView dailyconsumption(DailyconsumptionPo po){
        ModelAndView mv=null;
        mv=new ModelAndView();
        String[] strNow = new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString().split("-");
        Integer year = Integer.parseInt(strNow[0]);
        Integer month = Integer.parseInt(strNow[1]);
         Integer day = Integer.parseInt(strNow[2]);
        String time=year+"-"+month+"-"+day;//2020-01
        String time2=time.trim();
        po.setTime(time2);
        DailyconsumptionPo po1=dailyconsumptionService.selectByTimeAndRoom(po.getTime(),po.getRoomId(),po.getCid());
        if (po1==null){
            dailyconsumptionService.insertAll(po);
        }else {
            dailyconsumptionService.updateTimeRoom(po);
        }
        int id=po.getId();
        double sum=dailyconsumptionService.selectSumMoney(po.getTime(),po.getCid(),po.getRoomId(),po.getSupplierId());
        int count=financeService.slectCountRoom();
        double money=sum/count;
       /* if (po.getCid()==)*/
        return mv;
    }

    @RequestMapping("todaily")
    public ModelAndView todaily(int id){
        ModelAndView mv=null;
        mv=new ModelAndView("order/addDaily");
        List<ConsumptiontypePo> clist=consumptiontypeService.list();
        DailyconsumptionPo po1=dailyconsumptionService.selectById(id);
        mv.addObject("clist",clist);
        mv.addObject("po1",po1);
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
        List<IndayVo> count=orderService.checkinDay(strn, orderPo.getRoomId());
        RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
        int t=0;
        int ok=0;
        for (IndayVo i:count ) {
            t=t+i.getNumber();//现有住宿人
        }
        if (t<Integer.parseInt(roomSetPo.getRoomAmount())){//有床位
            if (orderPo.getCheckinNumber()<=t){//床位大于等于入住人数
                ok=1;
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

}
