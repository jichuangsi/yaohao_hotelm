package com.gx.web;

import com.alibaba.druid.sql.visitor.functions.If;
import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.vo.TeamPayVo;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/StayRegister")
public class StayRegister {
	
	@Autowired
	private AttributeService attributeService;
	
	@Autowired
	private RoomSetService roomSetService;
	
	@Autowired
	private StayRegisterService stayRegisterService;
	
	@Autowired
	private PassengerService passengerService;
	
	@Autowired
	private CommodityService commodityService;
	
	@Autowired
	private ReceiveTargetService receiveTargetService;
	@Autowired
	private PlatformService platformService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private BedRoomService bedRoomService;
	@Autowired
	private BedroomdetailsSerivce bedroomdetailsSerivce;
	@Autowired
	private PredetermineService predetermineService;
	@Autowired
	private EmptyRoomSerivce emptyRoomSerivce;
	
	int fangjianId=0;
	String lvkeName="";
	double zhuDianTianShu=0;                      //住店天数
    double shengZhuDianTianShu=0;                 //剩住店天数
	double zhuDianTianShuOne=0;                   //住店天数
    
	//散客的list查询
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request, Integer currentPage,
                               String txtname, Integer LvKeLeiXingId, Integer isBillID,Integer bed){
		ModelAndView mv=null;
		
		List<StayRegisterPo> listAll=stayRegisterService.selectAll();

		List<AttributePo> listOne=attributeService.selectIsPay();
		mv=new ModelAndView("/stayregister/list");
		if (isBillID==null) {
			isBillID=68;
		}
		if (LvKeLeiXingId==null) {
			LvKeLeiXingId=55;
		}
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		
		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		vo.setCurrentPage(currentPage);
		
		if(txtname==null)
		{
			txtname="";
		}
		vo=this.stayRegisterService.pageFuzzyselectOne(LvKeLeiXingId, isBillID, txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("listOne",listOne);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("isBillID",isBillID);
		mv.addObject("txtname",txtname);
		mv.addObject("bed",bed);
		return mv;
	}
	
	
	//团队的list查询
	@RequestMapping("/toteamlist")
	public ModelAndView toteamlist(HttpServletRequest request, Integer currentPage,
                                   String txtname, Integer LvKeLeiXingId, Integer isBillID, Integer tuanDuiID,
                                   String teamNameId, String teamCodeId, String principalId,
                                   String contactPhoneNUmberId, String registerTimeId){
		ModelAndView mv=null;
		List<StayRegisterPo> listTeam=null;
		List<StayRegisterPo> listAll=stayRegisterService.selectAll();
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		
		int id=0;
		long xiangChaTianShu;
		long days;
		long hours;
		String zhuSu="";
		double teamSumConst=0;
		for (int i = 0; i < listAll.size(); i++) {
			id=listAll.get(i).getId();                                                            //获取ID
			Timestamp registerTime=listAll.get(i).getRegisterTime();                              //获取登记时间
			zhuSu=listAll.get(i).getStayNumber();                                                 //获取登记时间
			
			xiangChaTianShu=timestamp.getTime()-registerTime.getTime();                           //当前时间-登记时间
			days=xiangChaTianShu/(1000 * 60 * 60 * 24);                                           //转化为天
			hours=xiangChaTianShu/(1000 * 60 * 60 )-days*24;                                              //转化为小时
			
			if (Long.parseLong(zhuSu)<=days) {
				if (hours>0) {
					stayRegisterService.updateRemind(id, 1);
				}
			}
		}
		List<AttributePo> listOne=attributeService.selectIsPay();
		mv=new ModelAndView("/stayregister/list");
		if (isBillID==null) {
			isBillID=68;
		}
		if (LvKeLeiXingId==null) {
			LvKeLeiXingId=56;
		}
		if (tuanDuiID==null) {
			listTeam=this.stayRegisterService.selectFormTeamIdTwo(isBillID);
		}else {
			listTeam=this.stayRegisterService.selectFormTeamId(tuanDuiID, isBillID);
		}
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		
		for (int i = 0; i < listTeam.size(); i++) {
			teamSumConst+=listTeam.get(i).getSumConst();
		}

		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		vo.setCurrentPage(currentPage);
		
		if(txtname==null)
		{
			txtname="";
		}
		if (tuanDuiID==null) {
			vo=this.stayRegisterService.pageFuzzyselectThree(isBillID, txtname, vo);
		}else {
			vo=this.stayRegisterService.pageFuzzyselectTwo(tuanDuiID, isBillID, txtname, vo);
		}
		mv.addObject("list",vo);
		mv.addObject("listOne",listOne);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("isBillID",isBillID);
		mv.addObject("txtname",txtname);
		mv.addObject("tuanDui",tuanDuiID);
		mv.addObject("teamNameId",teamNameId);
		mv.addObject("teamCodeId",teamCodeId);
		mv.addObject("principalId",principalId);
		mv.addObject("contactPhoneNUmberId",contactPhoneNUmberId);
		mv.addObject("registerTimeId",registerTimeId);
		mv.addObject("teamSumConst",teamSumConst);
		mv.addObject("order","no");
		return mv;
	}
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/ajaxSelectTeamSumcont")
	public Object ajaxSelectTeamSumcont(Integer tuanDuiID, Integer isBillID){
		double teamSumConst=0;
		List<StayRegisterPo> listTeam=this.stayRegisterService.selectFormTeamId(tuanDuiID, isBillID);
		for (int i = 0; i < listTeam.size(); i++) {
			teamSumConst+=listTeam.get(i).getSumConst();
		}
       Gson gson=new Gson();
       return gson.toJson(teamSumConst);
	}
	
	
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		mv=new ModelAndView("/stayregister/add");
		return mv;
	}

	
	
/*--------------------------------------- 登记 start------------------------------------------------------------------*/	
	
	//登记
	@RequestMapping("/toregister")
	public ModelAndView toregister(int id, String roomNumber, Integer LvKeLeiXingId,Integer predetermineID){
		ModelAndView mv=null;
		List<AttributePo> listGender=attributeService.selectGender();                      //性别

		List<PlatformPo> platformPoList =platformService.listAll();
		mv=new ModelAndView("/stayregister/register");
		mv.addObject("roomNumber",roomNumber);
		mv.addObject("stayRegisterId",id);
		mv.addObject("listGender",listGender);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("platformPoList",platformPoList);

		if (predetermineID!=null){
			String orderID=orderService.selectBypredetermineID(predetermineID);
			mv.addObject("orderID",orderID);
		}
		mv.addObject("predetermineID",predetermineID);
		return mv;
	}
	
	
	@RequestMapping("/register")
	public ModelAndView register(PassengerPo passengerPo, Integer LvKeLeiXingId,String codeNumber,Integer platformID,Integer predetermineID){
		Integer lvkeid=passengerPo.getLvKeID();
		if (lvkeid==null) {
			passengerService.insertAll(passengerPo);
			lvkeid=passengerPo.getId();
		}else {
			passengerPo.setId(passengerPo.getStayRegisterID());
			passengerService.updateById(passengerPo);
		}

		OrderPo opo =null;
		if (predetermineID!=null){
			PredeterminePo predeterminePo=predetermineService.findById(predetermineID);
			opo=orderService.selectStatua(codeNumber);
		/*	stayRegisterService.insertStayregisterdetails(passengerPo.getStayRegisterID(), lvkeid,codeNumber,opo.getPlatformId());*/
			if (predeterminePo.getRentOutTypeID()==72) {
				BedroomPo bpo = bedRoomService.selectroomid(predeterminePo.getRoomID());
				bedroomdetailsSerivce.updateall(bpo.getId(), predetermineID, passengerPo.getStayRegisterID());
			}
			emptyRoomSerivce.updatePre(predetermineID, passengerPo.getStayRegisterID());
		}else {
			stayRegisterService.insertStayregisterdetails(passengerPo.getStayRegisterID(), lvkeid,codeNumber,platformID);
			StayRegisterPo stayRegisterPo=stayRegisterService.selectById(passengerPo.getStayRegisterID());
			if (stayRegisterPo.getRentOutTypeID()==72){
				BedroomPo bpo=bedRoomService.selectroomid(stayRegisterPo.getRoomID());
				BedroomdetailsPo bepo=new BedroomdetailsPo();
				bepo.setIslikai(1);
				bepo.setPredeid(0);
				bepo.setStayid(passengerPo.getStayRegisterID());
				bepo.setBedroomid(bpo.getRoomid());
				bedroomdetailsSerivce.inserAll(bepo);
			}
		}
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		StayRegisterPo sta=new StayRegisterPo();
		sta.setRegisterTime(timestamp);
		sta.setId(passengerPo.getStayRegisterID());
		stayRegisterService.regiserTime(sta);
		int stayDetailsId=stayRegisterService.getID(codeNumber);
		if (predetermineID!=null){
			orderService.updateStatuaByCS(codeNumber,1,stayDetailsId);
		}else {
			orderService.inserAll(codeNumber,1,platformID,stayDetailsId,0);
		}

		ModelAndView mv=null;
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectPassenger")
	public Object selectPassenger(String txtname){
		if(txtname==null){
			txtname="";
		}
		List<PassengerPo> list=passengerService.selectAjaxList(txtname);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/confirmPassenger")
	public Object confirmPassenger(Integer id){
	  PassengerPo list=passengerService.selectById(id);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
/*--------------------------------------- 登记  end ------------------------------------------------------------------*/		
	
	
	
	
	
	
	
/*--------------------------------------- 安排房间 start------------------------------------------------------------------*/

	//安排房间
	@RequestMapping("/toarrangeroom")
	public ModelAndView toarrangeroom(Integer tuanDuiID, Integer LvKeLeiXingId){
		ModelAndView mv=null;
		List<PlatformPo> platformPoList =platformService.listAll();
		List<AttributePo> listGender=attributeService.selectGender();

		List<RoomSetPo> list=roomSetService.selectAll();
		List<AttributePo> listPassengerType=attributeService.selectPassengerType();     //旅客类别,Integer id
		List<AttributePo> listBillUnit=attributeService.selectBillUnit();              //结账单位
		List<AttributePo> listPayWay=attributeService.selectPayWay();                 //结账方式
		List<AttributePo> listRentOutType=attributeService.selectRentOutType();      //出租方式
		List<SupplierPo> slist=supplierService.listAll();
		mv=new ModelAndView("/stayregister/arrangeroom");
		mv.addObject("listPassengerType",listPassengerType);
		mv.addObject("listBillUnit",listBillUnit);
		mv.addObject("listPayWay",listPayWay);
		mv.addObject("listRentOutType",listRentOutType);
		mv.addObject("list",list);
		mv.addObject("tuanDuiID",tuanDuiID);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("slist",slist);
		mv.addObject("platformPoList",platformPoList);
		mv.addObject("listGender",listGender);
		return mv;
	}

	//安排房间和登记
	@RequestMapping("/arrangeroom")
	public ModelAndView arrangeroom(StayRegisterPo stayRegisterPo,Integer LvKeLeiXingId,Integer people){
		ModelAndView mv=null;
		int YorN = stayRegisterService.codeNumberYZ(stayRegisterPo.getCodeNumber());
		if (YorN>=1){
			mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
			return mv;
		}
		PassengerPo po1= passengerService.selectNameAndNumber(stayRegisterPo.getPname(),stayRegisterPo.getContactPhoneNUmber());
		int pid=0;
		PassengerPo po=new PassengerPo();
		if (po1==null){
			po.setName(stayRegisterPo.getPname());
			po.setGenderID(stayRegisterPo.getGenderID());
			po.setContactPhoneNumber(stayRegisterPo.getContactPhoneNUmber());
			passengerService.insertAll(po);
			pid=po.getId();
		}else {
			pid=po1.getId();
		}
		stayRegisterPo.setIsBillID(68);
		if (stayRegisterPo.getReceiveTargetID()==null) {
			stayRegisterPo.setReceiveTargetID(2);
		}

		int fangJianId=stayRegisterPo.getRoomID();
		RoomSetPo roomSetPo=roomSetService.selectById(fangJianId);                      //根据 房间ID 查询出唯一的数据
		int chuZuFangShiId=stayRegisterPo.getRentOutTypeID();                           //获取 出租方式

		stayRegisterPo.setSumConst(0);
		stayRegisterPo.setStayNumber("0");
		if (chuZuFangShiId==72){
			stayRegisterPo.setRenshu(people);
			BedroomPo bedroomPo=new BedroomPo();
			bedroomPo.setRoomid(stayRegisterPo.getRoomID());
			bedroomPo.setPeople(people);
			bedroomPo.setSurplusAcount(Integer.valueOf(roomSetPo.getRoomAmount())-people);
			bedroomPo.setRoomAcount(roomSetPo.getRoomAmount());
			bedRoomService.update(bedroomPo);

		}
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		if (stayRegisterPo.getIsdao()==2){
			stayRegisterPo.setPaymentdate(timestamp);

		}
		stayRegisterPo.setRegisterTime(timestamp);
		stayRegisterService.insertAll(stayRegisterPo);
		int id=stayRegisterPo.getId();
		stayRegisterPo.setDepositStayRegisterID(id);
		stayRegisterPo.setDepositRegisterTime(stayRegisterPo.getRegisterTime());
		stayRegisterService.insertDeposit(stayRegisterPo);
		StayRegisterPo s=stayRegisterService.selectById(id);
		stayRegisterService.insertStayregisterdetails(id,pid,stayRegisterPo.getCodeNumber(),stayRegisterPo.getPlatformID());

			orderService.inserAll(stayRegisterPo.getCodeNumber(),1,stayRegisterPo.getPlatformID(),id,0);
	if (chuZuFangShiId!=72) {//判断床位出租
		EmptyroomPo emptyroomPo = new EmptyroomPo();
		List<EmptyroomPo> list = emptyRoomSerivce.selectOneAndNull(stayRegisterPo.getRoomID());
		if (list.size() == 1 && list.get(0).getCheckin() == null) {//修改时间数据
			emptyroomPo.setId(list.get(0).getId());
			emptyroomPo.setRoomid(stayRegisterPo.getRoomID());
			emptyroomPo.setRoomNumber(list.get(0).getRoomNumber());
			emptyroomPo.setCheckin(stayRegisterPo.getCheckintime());
			emptyroomPo.setCheckout(stayRegisterPo.getCheckouttime());
			emptyroomPo.setStayid(id);
			emptyroomPo.setPreid(0);
			emptyroomPo.setSorp(1);
			emptyRoomSerivce.upadtecheck(emptyroomPo);
		} else {//新增订房记录
			emptyroomPo.setRoomid(stayRegisterPo.getRoomID());
			emptyroomPo.setRoomNumber(list.get(0).getRoomNumber());
			emptyroomPo.setCheckin(stayRegisterPo.getCheckintime());
			emptyroomPo.setCheckout(stayRegisterPo.getCheckouttime());
			emptyroomPo.setStayid(id);
			emptyroomPo.setPreid(0);
			emptyroomPo.setSorp(1);
			emptyRoomSerivce.inserAll(emptyroomPo);
		}
}


		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}
	
	
/*--------------------------------------- 安排房间  end ------------------------------------------------------------------*/	
	
	
	
	
	
	
	
/*--------------------------------------- 换房 start------------------------------------------------------------------*/	
	
	//换房
	@RequestMapping("/tochangroom")
	public ModelAndView tochangroom(Integer id, String lvKeName, Integer LvKeLeiXingId){
		ModelAndView mv=null;
		fangjianId=id;
		lvkeName=lvKeName;
		
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串

		List<StayRegisterPo> list=stayRegisterService.selectChangRoom(id);
		List<StayRegisterPo> listSource=stayRegisterService.selectMoney(id);

		Integer supplierid=null;
		for (StayRegisterPo po:list){
			Integer roomid=po.getRoomID();
			RoomSetPo rpo=roomSetService.selectById(roomid);
			supplierid=rpo.getSupplierID();
			if (rpo.getIsBed()==0){
				mv=new ModelAndView("/stayregister/changroombed");
			}else {
				mv=new ModelAndView("/stayregister/changroom");
			}
		}
		mv.addObject("lvKeName",lvKeName);
		mv.addObject("list",list);
		mv.addObject("stayId",id);
		mv.addObject("zhuDianTianShu",zhuDianTianShu);
		mv.addObject("timestamp",timestamp);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);

		/*List<SupplierPo> listS=supplierService.listAll();*/

		mv.addObject("supplierid",supplierid);
		/*mv.addObject("listS",listS);*/

		return mv;
	}
	
	
	@RequestMapping("/confirmChangRoom")
	public ModelAndView confirmChangRoom(Integer id, Integer roomId,
                                         Timestamp changRoomTime, Integer LvKeLeiXingId,
										 java.sql.Date checkin, java.sql.Date checkout){
		ModelAndView mv=null;

		String huanFangCiShu="";                    //换房次数
		Integer jiuFangJianId=0;                        //旧房间id


		List<StayRegisterPo> list=stayRegisterService.selectChangRoom(id);
		huanFangCiShu=list.get(0).getChangingRoomNumber();                             //获取换房次数
		jiuFangJianId=list.get(0).getRoomID();                                         //获取旧房间id


		if (huanFangCiShu==null || huanFangCiShu=="") {
			huanFangCiShu="1";
		}else{
			huanFangCiShu=String.valueOf(Integer.parseInt(huanFangCiShu)+1);
		}
		StayRegisterPo stayRegisterPo=new StayRegisterPo();
		RoomSetPo roomOne=new RoomSetPo();
		RoomSetPo roomTwo=new RoomSetPo();
		stayRegisterPo.setId(id);
		stayRegisterPo.setRoomID(roomId);
		stayRegisterPo.setSumConst(0);
		stayRegisterPo.setChangingRoomNumber(huanFangCiShu);
		stayRegisterPo.setChangRoomMoney(0);
		stayRegisterPo.setChangRoomTime(changRoomTime);
		roomOne.setId(jiuFangJianId);
		roomOne.setRoomStateID(1);
		roomTwo.setId(roomId);
		roomTwo.setRoomStateID(1);
		
		roomSetService.updateByIdToRoomState(roomOne);
		roomSetService.updateByIdToRoomState(roomTwo);
		stayRegisterService.updateChangRoom(stayRegisterPo);
		if (jiuFangJianId==roomId || jiuFangJianId.equals(roomId)){
		}else {

			List<EmptyroomPo> list1=emptyRoomSerivce.selectOneAndNull(jiuFangJianId);//旧房间
			if (list1.size()>1){
				EmptyroomPo em=new EmptyroomPo();
				em.setStayid(id);
				em.setRoomid(jiuFangJianId);
				emptyRoomSerivce.deleteByid(em);
			}else {
				EmptyroomPo e=new EmptyroomPo();
				e.setRoomid(jiuFangJianId);
				e.setCheckin(null);
				e.setCheckout(null);
				e.setSorp(0);
				emptyRoomSerivce.upadte(e);
			}
			List<EmptyroomPo> list2=emptyRoomSerivce.selectOneAndNull(roomId);//新房
			RoomSetPo ro=roomSetService.selectById(roomId);
			//List<EmptyroomPo> list3 = emptyRoomSerivce.selectOneAndNull(roomId);
			if (list2.size()>1){
				EmptyroomPo e2=new EmptyroomPo();
				e2.setCheckout(checkout);
				e2.setCheckin(checkin);
				e2.setRoomid(roomId);
				e2.setRoomNumber(ro.getRoomNumber());
				e2.setStayid(id);
				e2.setPreid(list.get(0).getPredetermineID());
				e2.setSorp(1);
				emptyRoomSerivce.inserAll(e2);
			}else {
				EmptyroomPo em2=new EmptyroomPo();
				em2.setPreid(list.get(0).getPredetermineID());
				em2.setRoomid(roomId);
				em2.setStayid(id);
				em2.setCheckin(checkin);
				em2.setCheckout(checkout);
				em2.setId(list2.get(0).getId());
				em2.setSorp(1);
				emptyRoomSerivce.upadtecheck(em2);
			}

		}
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}
		
	@ResponseBody
	@RequestMapping(value="/changRoomSelectPassenger")
	public Object changRoomSelectPassenger(String roomNumber,Integer supplier){
		List<RoomSetPo> list=null;
		if (roomNumber==null){
			roomNumber="";
		}
		if (roomNumber==""){
			roomNumber="";
		}
		list=roomSetService.selectInformationsRoomNumberSupplier(roomNumber,supplier);

       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
/*--------------------------------------- 换房  end ------------------------------------------------------------------*/		
	
	
	
	
	
	
	
/*--------------------------------------- 押金 start------------------------------------------------------------------*/	
	
	
	@RequestMapping("/todeposit")
	public ModelAndView todeposit(Integer id, String lvKeName, Integer LvKeLeiXingId){
		ModelAndView mv=null;
		fangjianId=id;
		lvkeName=lvKeName;
		List<StayRegisterPo> list=stayRegisterService.selectDepositById(id);
		List<AttributePo> list2=attributeService.selectPayWay();
		mv=new ModelAndView("/stayregister/deposit");
		mv.addObject("list",list);
		mv.addObject("listTwo",list2);
		mv.addObject("lvKeName",lvKeName);
		mv.addObject("stayId",id);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		return mv;
	}
	
	@RequestMapping("/deposit")
	public ModelAndView deposit(StayRegisterPo stayRegisterPo, Integer LvKeLeiXingId){
		ModelAndView mv=null;
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		stayRegisterPo.setDepositRegisterTime(timestamp);
		mv=new ModelAndView("redirect:/StayRegister/todeposit.do?id="+fangjianId);
        mv.addObject("lvKeName", lvkeName);
        mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		stayRegisterService.insertDeposit(stayRegisterPo);		
		return mv;
	}



	@RequestMapping("/updateDepoitStatus")
	public ModelAndView updateDepoit(Integer depID, Integer LvKeLeiXingId, Integer depoist){
		ModelAndView mv=null;
		mv=new ModelAndView("redirect:/StayRegister/todeposit.do?id="+depID);
		mv.addObject("lvKeName", lvkeName);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		stayRegisterService.updateDepoit(depID,depoist);
		return mv;
	}
	
/*--------------------------------------- 押金  end ------------------------------------------------------------------*/	

	
	
	

	
/*--------------------------------------- 消费明细 start------------------------------------------------------------------*/	
	
	@RequestMapping("/toconsumption")
	public ModelAndView toconsumption(Integer id, String lvKeName, Integer currentPage,
                                      Integer LvKeLeiXingId, Integer isBillID){
		ModelAndView mv=null;
		fangjianId=id;
		lvkeName=lvKeName;
		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		vo.setCurrentPage(currentPage);
		List<AttributePo> listOne=attributeService.selectCommodityType();
		vo=this.stayRegisterService.pageConsumption(id, vo);
		mv=new ModelAndView("/stayregister/consumption");
		mv.addObject("listOne",listOne);
		mv.addObject("stayId",id);
		mv.addObject("lvKeName",lvKeName);
		mv.addObject("list",vo);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("isBillID",isBillID);
		return mv;
	}
	
	//新增
	@RequestMapping("/consumption")
	public ModelAndView consumption(String id, String Number,
                                    int consumptionStayRegisterID, Integer LvKeLeiXingId){
		ModelAndView mv=null;
	    Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串

		String[] FenGeId=id.split(",");
		String[] FenGeNumber=Number.split(",");
		StayRegisterPo stayRegisterPo=new StayRegisterPo();
		for (int i = 0; i < FenGeId.length; i++) {
			CommodityPo commodityPo=commodityService.selectById(Integer.parseInt(FenGeId[i]));
			stayRegisterPo.setConsumptionCommodityID(Integer.parseInt(FenGeId[i]));
			stayRegisterPo.setConsumptionStayRegisterID(consumptionStayRegisterID);
			stayRegisterPo.setConsumptionNumber(FenGeNumber[i]);
			stayRegisterPo.setConsumptionTime(timestamp);
			double money=Integer.parseInt(FenGeNumber[i])*(Double.parseDouble(commodityPo.getSalePrice()));
			stayRegisterPo.setConsumptionMoney(money);
			stayRegisterService.insertConsumptiondetails(stayRegisterPo);
		}
		
		List<StayRegisterPo> listSource=stayRegisterService.selectMoney(consumptionStayRegisterID);
		int chuZuFangShiId=listSource.get(0).getRentOutTypeID();                                      //出租方式ID
		int zhuDianShiChang=Integer.parseInt(listSource.get(0).getStayNumber());                    //住店时长     
		double fangJiaTian=listSource.get(0).getRoomStandardPriceDay();                             //房价/天
		double fangJia=listSource.get(0).getRoomStandardPrice();                                    //房价/小时
		int zuiDaShiChang=Integer.parseInt(listSource.get(0).getRoomMaxDuration());                 //最大时长
		int shouDuanShiChang=Integer.parseInt(listSource.get(0).getRoomFirstDuration());            //首段时长
		double shouDuanJiaGe=listSource.get(0).getRoomFirstPrice();                                 //首段价格
		double xiaoFeiJiaGe=0;
		double zhuSuFei=0;
		if(chuZuFangShiId==26){
		    zhuSuFei=fangJiaTian*zhuDianShiChang;                                      //房价乘以天数得总费
		}else if(chuZuFangShiId==25){
			if (shouDuanShiChang >= zhuDianShiChang) { 
				zhuSuFei=shouDuanJiaGe;                              //首时段时长大于 他输入的钟点数     那么按 首段价格计算
			}else if (shouDuanShiChang <= zhuDianShiChang && zhuDianShiChang <= zuiDaShiChang) {
				int xiaoShi=zhuDianShiChang-shouDuanShiChang;                 //如果输入的钟点数 在 最大时长的范围之内
				zhuSuFei= shouDuanJiaGe+xiaoShi*fangJia;                   // 且大于等于首段时长 ，那么 计算出
			}else if(zhuDianShiChang>zuiDaShiChang){
				zhuSuFei=fangJiaTian;                                     //假如 输入的钟点数大于最大时长那么 按一天的价格计算
			}
		}
		for (int i = 0; i < listSource.size(); i++) {
			xiaoFeiJiaGe+=listSource.get(i).getConsumptionMoney();
		}
		double zongFeiYong=xiaoFeiJiaGe+zhuSuFei;
		stayRegisterService.updateSumConst(consumptionStayRegisterID, zongFeiYong);
		
		mv=new ModelAndView("redirect:/StayRegister/toconsumption.do?id="+fangjianId);
		mv.addObject("lvKeName",lvkeName);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		return mv;
	}
	
	
	//删除
	@RequestMapping("/consumptionDelete")
	public ModelAndView consumptionDelete(String id, int consumptionStayRegisterID){
		ModelAndView mv=null;
		String[] FenGeId=id.split(",");
		for (int i = 0; i < FenGeId.length; i++) {
			stayRegisterService.deleteConsumption(Integer.parseInt(FenGeId[i]));
		}
		mv=new ModelAndView("redirect:/StayRegister/toconsumption.do?id="+fangjianId);
		mv.addObject("lvKeName",lvkeName);
		
		List<StayRegisterPo> listSource=stayRegisterService.selectMoney(consumptionStayRegisterID);
		int chuZuFangShiId=listSource.get(0).getRentOutTypeID();                                      //出租方式ID
		int zhuDianShiChang=Integer.parseInt(listSource.get(0).getStayNumber());                    //住店时长     
		double fangJiaTian=listSource.get(0).getRoomStandardPriceDay();                             //房价/天
		double fangJia=listSource.get(0).getRoomStandardPrice();                                    //房价/小时
		int zuiDaShiChang=Integer.parseInt(listSource.get(0).getRoomMaxDuration());                 //最大时长
		int shouDuanShiChang=Integer.parseInt(listSource.get(0).getRoomFirstDuration());            //首段时长
		double shouDuanJiaGe=listSource.get(0).getRoomFirstPrice();                                 //首段价格
		double xiaoFeiJiaGe=0;
		double zhuSuFei=0;
		if(chuZuFangShiId==26){
		    zhuSuFei=fangJiaTian*zhuDianShiChang;                                      //房价乘以天数得总费
		}else if(chuZuFangShiId==25){
			if (shouDuanShiChang >= zhuDianShiChang) { 
				zhuSuFei=shouDuanJiaGe;                              //首时段时长大于 他输入的钟点数     那么按 首段价格计算
			}else if (shouDuanShiChang <= zhuDianShiChang && zhuDianShiChang <= zuiDaShiChang) {
				int xiaoShi=zhuDianShiChang-shouDuanShiChang;                 //如果输入的钟点数 在 最大时长的范围之内
				zhuSuFei= shouDuanJiaGe+xiaoShi*fangJia;                   // 且大于等于首段时长 ，那么 计算出
			}else if(zhuDianShiChang>zuiDaShiChang){
				zhuSuFei=fangJiaTian;                                     //假如 输入的钟点数大于最大时长那么 按一天的价格计算
			}
		}
		for (int i = 0; i < listSource.size(); i++) {
			xiaoFeiJiaGe+=listSource.get(i).getConsumptionMoney();
		}
		double zongFeiYong=xiaoFeiJiaGe+zhuSuFei;
		stayRegisterService.updateSumConst(consumptionStayRegisterID, zongFeiYong);
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/tianJiaShangPin")
	public Object tianJiaShangPin(String name,int cboid){
		if(name==null){
			name="";
		}
		List<CommodityPo> listAjax=commodityService.fuzzySelect(name, cboid);
       Gson gson=new Gson();
       return gson.toJson(listAjax);
	}
	
/*--------------------------------------- 消费明细  end ------------------------------------------------------------------*/	
	
	

	
	
/*--------------------------------------- 散客结账 start------------------------------------------------------------------*/		
	
	@RequestMapping("/topay")
	public ModelAndView topay(Integer id, String lvKeName){
		ModelAndView mv=null;
		fangjianId=id;
		lvkeName=lvKeName;
		
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		
		double shangPinXiaoFei=0;
		double yaJin=0;
		double huanFanFei=0;
		double zongFeiYong=0;
		double zhuSuFei=0;
		double yingBuJinE=0;
		
		List<StayRegisterPo> listDeposit=stayRegisterService.selectDepositById(id);
		List<StayRegisterPo> listShangPin=stayRegisterService.selectMoney(id);
		List<AttributePo> listOne=attributeService.selectPayWay();
		
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < listShangPin.size(); i++) {
			shangPinXiaoFei+=listShangPin.get(i).getConsumptionMoney();
		}
		if (listDeposit!=null){
			huanFanFei=listDeposit.get(0).getChangRoomMoney();
			zongFeiYong=listDeposit.get(0).getSumConst();
		}
		zhuSuFei=zongFeiYong-shangPinXiaoFei-huanFanFei;
		yingBuJinE=zongFeiYong-yaJin;
		
		mv=new ModelAndView("/stayregister/pay");
		mv.addObject("stayId",id);
		mv.addObject("lvKeName",lvKeName);
		mv.addObject("listDeposit",listDeposit);
		mv.addObject("listShangPin",listShangPin);
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("yaJin",yaJin);
		mv.addObject("shangPinXiaoFei",shangPinXiaoFei);
		mv.addObject("yingBuJinE",yingBuJinE);
		mv.addObject("timestamp",timestamp);
		mv.addObject("listOne",listOne);

		OrderPo orderPo=orderService.byID(id);
		mv.addObject("orderPo",orderPo);
		return mv;
	}
	

	//结账
	@RequestMapping("/pay")
	public ModelAndView pay(Integer id, String remarks, Timestamp payTime, Integer payWay, Integer roomId){
		ModelAndView mv=null;
		stayRegisterService.pay(id, remarks, payTime, payWay);
		RoomSetPo roomSetPo=new RoomSetPo();
		roomSetPo.setId(roomId);
		roomSetPo.setRoomStateID(1);
		roomSetService.updateByIdToRoomState(roomSetPo);
		String order =stayRegisterService.orderIDBystayid(id);
		orderService.updateStatua(order,3);//订单状态为结账（退房）

		StayRegisterPo spo=stayRegisterService.selectById(id);
		if (spo.getRentOutTypeID()==72) {//怕判断是否是安床位售出
			RoomSetPo rpo=roomSetService.selectById(spo.getRoomID());
			BedroomPo bpo = bedRoomService.selectroomid(spo.getRoomID());
			if (bpo.getPeople() == 0) {} else{
				bedRoomService.updateOne(spo.getRoomID());
				bedroomdetailsSerivce.updatestatusstay(bpo.getId(), id);
				BedroomPo bpo1=bedRoomService.selectroomid(spo.getRoomID());
				if (bpo1.getPeople()==-1){
					BedroomPo bpo2=new BedroomPo();
					bpo2.setSurplusAcount(Integer.valueOf(rpo.getRoomAmount()));
					bpo2.setRoomAcount(rpo.getRoomAmount());
					bpo2.setPeople(0);
					bpo2.setRoomid(spo.getRoomID());
					bpo2.setId(bpo1.getId());
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
			emptyroomPo.setStayid(spo.getId());
			emptyRoomSerivce.deleteByid(emptyroomPo);
		}else {
			EmptyroomPo emptyroomPo=new EmptyroomPo();
			emptyroomPo.setRoomid(spo.getRoomID());
			emptyroomPo.setRoomNumber(spo.getRoomNumber());
			emptyroomPo.setCheckin(null);
			emptyroomPo.setCheckout(null);
			emptyroomPo.setSorp(0);
			emptyRoomSerivce.upadte(emptyroomPo);
		}


		mv=new ModelAndView("redirect:/StayRegister/tolist.do?");
		return mv;
	}
	
/*--------------------------------------- 散客结账 end------------------------------------------------------------------*/		



	
	
/*--------------------------------------- 批量安排房间 start------------------------------------------------------------------*/			
	//批量安排房间
	@RequestMapping("/tovolumeroom")
	public ModelAndView tovolumeroom(Integer tuanDuiID, String teamName){
		ModelAndView mv=null;
		List<AttributePo> listPassengerType=attributeService.selectPassengerType();     //旅客类别
		List<AttributePo> listBillUnit=attributeService.selectBillUnit();              //结账单位
		List<AttributePo> listPayWay=attributeService.selectPayWay();                 //结账方式
		List<AttributePo> listRentOutType=attributeService.selectRentOutType();      //出租方式
		mv=new ModelAndView("/stayregister/volumeroom");
		mv.addObject("listPassengerType",listPassengerType);
		mv.addObject("listBillUnit",listBillUnit);
		mv.addObject("listPayWay",listPayWay);
		mv.addObject("listRentOutType",listRentOutType);
		mv.addObject("tuanDuiID",tuanDuiID);
		mv.addObject("teamName",teamName);
		return mv;
	}
	
	//批量安排房间
	@RequestMapping("/volumeroom")
	public ModelAndView volumeroom(String roomId, StayRegisterPo stayRegisterPo){
		ModelAndView mv=null;
		String[] FenGen=roomId.split(",");
		stayRegisterPo.setIsBillID(68);
		int chuZuFangShiId=stayRegisterPo.getRentOutTypeID();                           //获取 出租方式
		int tianShuOrZhongDian=Integer.parseInt(stayRegisterPo.getStayNumber());       //获取 住店天数/小时
		double yaJin=stayRegisterPo.getDeposit()/FenGen.length;
		stayRegisterPo.setDeposit(yaJin);
		RoomSetPo roomSetPoToRoomState=new RoomSetPo();
		roomSetPoToRoomState.setRoomStateID(65);                     //给新的 Po 赋房态的值
		
		for (int i = 0; i < FenGen.length; i++) {
			RoomSetPo roomSetPo=roomSetService.selectById(Integer.parseInt(FenGen[i]));                      //根据 房间ID 查询出唯一的数据
			if(chuZuFangShiId==26){
				double fagnJia=roomSetPo.getStandardPriceDay();                          //获取房价/天
				double sumConst=fagnJia*(tianShuOrZhongDian);                            //房价乘以天数得总费
				stayRegisterPo.setSumConst(sumConst);
			}else if(chuZuFangShiId==25){
				double fagnJia=roomSetPo.getStandardPrice();                                //获取房价/小时
				int zuiDaShiChang=Integer.parseInt(roomSetPo.getMaxDuration());              //获取最大时长
				int shouDuanShiChang=Integer.parseInt(roomSetPo.getFirstDuration());         //获取首段时长
				double shouDuanJiGe=roomSetPo.getFirstPrice();                              //获取首段价格
				if (shouDuanShiChang >= tianShuOrZhongDian) { 
					double sumConst=shouDuanJiGe;                                           //首时段时长大于 他输入的钟点数 
					stayRegisterPo.setSumConst(sumConst);                                    //那么按 首段价格计算
				}else if (shouDuanShiChang <= tianShuOrZhongDian && tianShuOrZhongDian <= zuiDaShiChang) {
					int xiaoShi=tianShuOrZhongDian-shouDuanShiChang;                 //如果输入的钟点数 在 最大时长的范围之内
					double sumConst= shouDuanJiGe+xiaoShi*fagnJia;                   // 且大于等于首段时长 ，那么 计算出
					stayRegisterPo.setSumConst(sumConst);                            // 首段价格 加上 钟点数乘以 多出的每小时价格
				}else if(tianShuOrZhongDian>zuiDaShiChang){
					stayRegisterPo.setSumConst(roomSetPo.getStandardPriceDay()); //假如 输入的钟点数大于最大时长那么 按一天的价格计算
				}
			}
			stayRegisterPo.setRoomID(Integer.parseInt(FenGen[i]));
			stayRegisterService.insertAll(stayRegisterPo);
			int id=stayRegisterPo.getId();
			stayRegisterPo.setDepositStayRegisterID(id);
			stayRegisterPo.setDepositRegisterTime(stayRegisterPo.getRegisterTime());
			stayRegisterService.insertDeposit(stayRegisterPo);
			roomSetPoToRoomState.setId(Integer.parseInt(FenGen[i]));                      //给新的 Po 赋房间ID的值
			roomSetService.updateByIdToRoomState(roomSetPoToRoomState);  //根据 房间ID 来修改 当前被选中的房间的房态
		}
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+56);
		return mv;
	}
	
	//ajax查询房间信息
	@ResponseBody
	@RequestMapping(value="/ajaxSelectRoom")
	public Object ajaxSelectRoom(String id){
	   List<RoomSetPo> list=new ArrayList<RoomSetPo>();
	   String[] fenGe=id.split(",");
	   for (int i = 0; i < fenGe.length; i++) {
		  RoomSetPo roomSetPo=roomSetService.selectById(Integer.parseInt(fenGe[i]));
		  list.add(roomSetPo);
	   }
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
/*--------------------------------------- 批量安排房间 end------------------------------------------------------------------*/		
	
	
	
	
	
	
	
	//团队押金
	@RequestMapping("/toteamdeposit")
	public ModelAndView toteamdeposit(){
		ModelAndView mv=null;
		mv=new ModelAndView("/stayregister/teamdeposit");
		return mv;
	}
	
	
	
	
	
	
/*--------------------------------------- 团队结账 start-----------------------------------------------------------------*/			
	
	//团队结账
	@RequestMapping("/toteampay")
	public ModelAndView toteampay(Integer tuanDuiID){
		ModelAndView mv=null;
		TeamPayVo teamPayVo=new TeamPayVo();
		double yaJin=0;
		double xiaoFei=0;
		double huanFangFei=0;
		double zongFeiYong=0;
		double zhuSuFei=0;
		double yingBuJinE=0;
		int fangJianShu=0;
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串
		List<AttributePo> listPayWay=attributeService.selectPayWay();                 //结账方式
		List<StayRegisterPo> listDeposit=stayRegisterService.selectTeamDeposit(tuanDuiID);
		List<StayRegisterPo> listConsumption=stayRegisterService.selectTeamConsumption(tuanDuiID);
		List<StayRegisterPo> list=stayRegisterService.selectFormTeamId(tuanDuiID, 68);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < list.size(); i++) {
			zongFeiYong+=list.get(i).getSumConst();
			huanFangFei+=list.get(i).getChangRoomMoney();
		}
		for (int i = 0; i < listConsumption.size(); i++) {
			xiaoFei+=listConsumption.get(i).getConsumptionMoney();
		}
		fangJianShu=list.size();
		zhuSuFei=zongFeiYong-huanFangFei-xiaoFei;
		yingBuJinE=zongFeiYong-yaJin;
		teamPayVo.setStayMoney(zhuSuFei);
		teamPayVo.setChangRoomMoney(huanFangFei);
		teamPayVo.setOtherMoney(xiaoFei);
		teamPayVo.setPayMoney(zongFeiYong);
		teamPayVo.setDepositMoney(yaJin);
		teamPayVo.setPayRepairMoney(yingBuJinE);
		mv=new ModelAndView("/stayregister/teampay");
		mv.addObject("listPayWay",listPayWay);
		mv.addObject("listConsumption",listConsumption);
		mv.addObject("teamPayVo",teamPayVo);
		mv.addObject("fangJianShu",fangJianShu);
		mv.addObject("timestamp",timestamp);
		mv.addObject("list",list);
		mv.addObject("tuanDuiID",tuanDuiID);
		return mv;
	}
	
	@RequestMapping("teamPay")
	public ModelAndView teamPay(String id, String remarks, Integer payWay, Timestamp payTime){
		ModelAndView mv=null;
		RoomSetPo roomSetPo=new RoomSetPo();
		roomSetPo.setRoomStateID(1);
		String[] FenGe=id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			stayRegisterService.pay(Integer.parseInt(FenGe[i]), remarks, payTime, payWay);
			StayRegisterPo stayRegisterPo=stayRegisterService.selectById(Integer.parseInt(FenGe[i]));
			roomSetPo.setId(stayRegisterPo.getRoomID());
			roomSetService.updateByIdToRoomState(roomSetPo);
			OrderPo order =orderService.byID(Integer.parseInt(FenGe[i]));
			orderService.updateStatua(order.getOrderID(),3);//状态已结账

			StayRegisterPo spo=stayRegisterService.selectById(Integer.parseInt(FenGe[i]));
			if (spo.getRentOutTypeID()==72){//怕判断是否是安床位售出
				RoomSetPo rpo=roomSetService.selectById(spo.getRoomID());
				BedroomPo bpo=bedRoomService.selectroomid(spo.getRoomID());
				if(bpo.getPeople()==0){}else {
					bedRoomService.updateOne(spo.getRoomID());
					bedroomdetailsSerivce.updatestatusstay(bpo.getId(), spo.getId());
					BedroomPo bpo1=bedRoomService.selectroomid(spo.getRoomID());
					if (bpo1.getPeople()==-1){
						BedroomPo bpo2=new BedroomPo();
						bpo2.setSurplusAcount(Integer.valueOf(rpo.getRoomAmount()));
						bpo2.setRoomAcount(rpo.getRoomAmount());
						bpo2.setPeople(0);
						bpo2.setRoomid(spo.getRoomID());
					/*	bpo2.setId(bpo1.getId());*/
						bedRoomService.update(bpo2);
					}
				}
			}
			EmptyroomPo emptyroomPo=null;
			List<EmptyroomPo> coun=emptyRoomSerivce.selectOneAndNull(spo.getRoomID());
			if (coun.size()>1){
			 emptyroomPo=new EmptyroomPo();
			emptyroomPo.setRoomid(stayRegisterPo.getRoomID());
			emptyroomPo.setRoomNumber(stayRegisterPo.getRoomNumber());
			emptyroomPo.setCheckin(stayRegisterPo.getCheckintime());
			emptyroomPo.setCheckout(stayRegisterPo.getCheckouttime());
			emptyRoomSerivce.deleteByid(emptyroomPo);
		}else {
			emptyroomPo=new EmptyroomPo();
			emptyroomPo.setRoomid(spo.getRoomID());
			emptyroomPo.setRoomNumber(spo.getRoomNumber());
			emptyroomPo.setCheckin(null);
			emptyroomPo.setCheckout(null);
			emptyroomPo.setSorp(0);
			emptyRoomSerivce.upadte(emptyroomPo);
		}
		}
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+56);
		return mv;
	}
	
	
	//ajax查询房间信息
	@ResponseBody
	@RequestMapping(value="/ajaxTeamSelectRoom")
	public Object ajaxTeamSelectRoom(String roomNumber,Integer receiveTargetID){
	   List<StayRegisterPo> list=new ArrayList<StayRegisterPo>();
	   list=stayRegisterService.ajaxSelectTeamRoom(receiveTargetID, roomNumber);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
	//ajax查询房间信息
	@ResponseBody
	@RequestMapping(value="/timeAjaxSelectRoomOne")
	public Object timeAjaxSelectRoomOne(Integer receiveTargetID,String datemin,String datemax){
	   datemin=datemin+" 00:00:00";
	   datemax=datemax+" 23:59:59";
	   Timestamp min=Timestamp.valueOf(datemin);
	   Timestamp max=Timestamp.valueOf(datemax);
	   List<StayRegisterPo> list=new ArrayList<StayRegisterPo>();
	   list=stayRegisterService.ajaxSelectTeamFormTime(receiveTargetID, min, max);
       Gson gson=new Gson();
       return gson.toJson(list);
	}
	
	//ajax查询房间信息
	@ResponseBody
	@RequestMapping(value="/timeAjaxSelectRoomTwo")
	public Object timeAjaxSelectRoomTwo(Integer receiveTargetID,String datemin,String datemax){
		TeamPayVo teamPayVo=new TeamPayVo();
		double yaJin=0;
		double xiaoFei=0;
		double huanFangFei=0;
		double zongFeiYong=0;
		double zhuSuFei=0;
		double yingBuJinE=0;
		int fangJianShu=0;
		datemin=datemin+" 00:00:00";
	    datemax=datemax+" 23:59:59";
	    Timestamp min=Timestamp.valueOf(datemin);
	    Timestamp max=Timestamp.valueOf(datemax);
	    
		List<StayRegisterPo> listDeposit=stayRegisterService.ajaxSelectTeamDeposit(receiveTargetID, min, max);
		List<StayRegisterPo> listConsumption=stayRegisterService.ajaxSelectTeamConsumption(receiveTargetID, min, max);
		List<StayRegisterPo> list=stayRegisterService.ajaxSelectTeamFormTime(receiveTargetID, min, max);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
			huanFangFei+=listDeposit.get(i).getChangRoomMoney();
		}
		for (int i = 0; i < list.size(); i++) {
			zongFeiYong+=list.get(i).getSumConst();
		}
		for (int i = 0; i < listConsumption.size(); i++) {
			xiaoFei+=listConsumption.get(i).getConsumptionMoney();
		}
		fangJianShu=listConsumption.size();
		zhuSuFei=zongFeiYong-huanFangFei-xiaoFei;
		yingBuJinE=zongFeiYong-yaJin;
		teamPayVo.setStayMoney(zhuSuFei);
		teamPayVo.setChangRoomMoney(huanFangFei);
		teamPayVo.setOtherMoney(xiaoFei);
		teamPayVo.setPayMoney(zongFeiYong);
		teamPayVo.setDepositMoney(yaJin);
		teamPayVo.setPayRepairMoney(yingBuJinE);
		Gson gson=new Gson();
		/*List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("canshu", "zhr");
		map.put("teamPayVo", teamPayVo);
		list.add(map);*/
       return gson.toJson(teamPayVo);
	}
	
	
	
	
	//ajax查询房间信息
		@ResponseBody
		@RequestMapping(value="/timeAjaxSelectRoomThree")
		public Object timeAjaxSelectRoomThree(String id,Double zhuSuFei,Double huanFangFei,
				Double qiTaXiaoFei,Double jieZhangJinE,Double yaJin,Double yingBuJinE){
			double ByaJin=0;
			double BxiaoFei=0;
			double BhuanFangFei=0;
			double BzongFeiYong=0;
			double BzhuSuFei=0;
			TeamPayVo teamPayVo=new TeamPayVo();
			String[] FenGeId=id.split(",");
			for (int i = 0; i < FenGeId.length; i++) {
				StayRegisterPo xiangQing=stayRegisterService.selectSumconst(Integer.parseInt(FenGeId[i]));
			    List<StayRegisterPo> yaJinList=stayRegisterService.selectDepositJinJianBan(Integer.parseInt(FenGeId[i]));
			    List<StayRegisterPo> xiaoFeiList=stayRegisterService.selectConsumptionJinJianBan(Integer.parseInt(FenGeId[i]));
			    for (int j = 0; j < yaJinList.size(); j++) {
					ByaJin+=yaJinList.get(j).getDeposit();
				}
			    for (int j = 0; j < xiaoFeiList.size(); j++) {
					BxiaoFei+=xiaoFeiList.get(j).getConsumptionMoney();
				}
			    if(i==0){
			    	BhuanFangFei+=xiangQing.getChangRoomMoney();
				    BzongFeiYong+=xiangQing.getSumConst();
			    }
			}
			
			BzhuSuFei=BzongFeiYong-BhuanFangFei-BxiaoFei;
			
			double JzhuSuFei=zhuSuFei-BzhuSuFei;
			double JhuanFangFei=huanFangFei-BhuanFangFei;
			double JqiTaXiaoFei=qiTaXiaoFei-BxiaoFei;
			double JjieZhangJinE=jieZhangJinE-BzongFeiYong;
			double JyaJin=yaJin-ByaJin;
			double JyingBuJinE=yingBuJinE-(BzongFeiYong-ByaJin);
			teamPayVo.setStayMoney(JzhuSuFei);
			teamPayVo.setChangRoomMoney(JhuanFangFei);
			teamPayVo.setOtherMoney(JqiTaXiaoFei);
			teamPayVo.setPayMoney(JjieZhangJinE);
			teamPayVo.setDepositMoney(JyaJin);
			teamPayVo.setPayRepairMoney(JyingBuJinE);
			Gson gson=new Gson();
			
	       return gson.toJson(teamPayVo);
		}
	
	
/*--------------------------------------- 团队结账 end------------------------------------------------------------------*/		
	
	
	
	
	
	
	
	
	
	
	//转为散客
	@RequestMapping("/toshiftpersonage")
	public ModelAndView toshiftpersonage(Integer id, Integer stayregisterdetailsId){
		ModelAndView mv=null;
		double zhuSuFei=0;
		double huanFangFei=0;
		double qiTaXiaoFei=0;
		double yaJin=0;
		double zongFeiYong=0;
		String txtname="";
		List<StayRegisterPo> listDeposit=stayRegisterService.selectDepositJinJianBan(id);
		List<StayRegisterPo> listXiaoFei=stayRegisterService.selectConsumptionJinJianBan(id);
		StayRegisterPo list=stayRegisterService.selectInformationXiangQingBan(stayregisterdetailsId);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < listXiaoFei.size(); i++) {
			qiTaXiaoFei+=listXiaoFei.get(i).getConsumptionMoney();
		}
		zongFeiYong=list.getSumConst();
		huanFangFei=list.getChangRoomMoney();
		zhuSuFei=zongFeiYong-huanFangFei-qiTaXiaoFei;
		mv=new ModelAndView("/stayregister/shiftpersonage");
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("qiTaXiaoFei",qiTaXiaoFei);
		mv.addObject("yaJin",yaJin);
		mv.addObject("list",list);
		mv.addObject("id",id);
		return mv;
	}
	
	//转入团队
	@RequestMapping("/toshiftteam")
	public ModelAndView toshiftteam(Integer id, Integer stayregisterdetailsId){
		ModelAndView mv=null;
		double zhuSuFei=0;
		double huanFangFei=0;
		double qiTaXiaoFei=0;
		double yaJin=0;
		double zongFeiYong=0;
		String txtname="";
		List<StayRegisterPo> listDeposit=stayRegisterService.selectDepositJinJianBan(id);
		List<StayRegisterPo> listXiaoFei=stayRegisterService.selectConsumptionJinJianBan(id);
		StayRegisterPo list=stayRegisterService.selectInformationXiangQingBan(stayregisterdetailsId);
		List<ReceiveTargetPo> listRT=receiveTargetService.ajaxSelect(txtname);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < listXiaoFei.size(); i++) {
			qiTaXiaoFei+=listXiaoFei.get(i).getConsumptionMoney();
		}
		zongFeiYong=list.getSumConst();
		huanFangFei=list.getChangRoomMoney();
		zhuSuFei=zongFeiYong-huanFangFei-qiTaXiaoFei;
		mv=new ModelAndView("/stayregister/shiftteam");
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("qiTaXiaoFei",qiTaXiaoFei);
		mv.addObject("yaJin",yaJin);
		mv.addObject("list",list);
		mv.addObject("listRT",listRT);
		mv.addObject("id",id);
		return mv;
	}
	
	//转为散客或转入团队
	@RequestMapping("/changOver")
	public ModelAndView changOver(Integer id, Integer receiveTargetID, Integer LvKeLeiXingId){
		ModelAndView mv=null;
		if (receiveTargetID==null) {
			receiveTargetID=2;
		}
		stayRegisterService.changOverTeam(id, receiveTargetID);
		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}




	//ajax 安排房间的房间
	@ResponseBody
	@RequestMapping(value="/guestRoomLevelSelectRoom",method=RequestMethod.POST)
	public Object guestRoomLevelSelectRoom(Integer guestRoomLevelID,Integer supplierid){
		List<RoomSetPo> list=null;
		if (guestRoomLevelID==0 && supplierid==null) {
			list=roomSetService.selectAll();
		}else if (guestRoomLevelID==0 && supplierid!=null){
			list=roomSetService.levelSelectSupplier(supplierid);
		}else if (guestRoomLevelID!=0 && supplierid!=null){
			list=roomSetService.levelSelectInformationAndsupplier(guestRoomLevelID,supplierid);
		}else {
			list=roomSetService.levelSelectInformation(guestRoomLevelID);
		}

		Gson gson=new Gson();
		return gson.toJson(list);
	}
	//ajax 安排房间的房间
	@ResponseBody
	@RequestMapping(value="/guestRoomLevelSelectBedRoom",method=RequestMethod.POST)
	public Object guestRoomLevelSelectBedRoom(Integer guestRoomLevelID,Integer supplierid,Integer rents){
		List<RoomSetPo> list=null;

		if (rents!=null && guestRoomLevelID==0 && supplierid==null){
			list=roomSetService.selectRentAll();
		}else if (rents!=null && guestRoomLevelID==0 && supplierid!=null){
			list=roomSetService.selectBedSupplierid(supplierid);
		}else if (rents!=null && guestRoomLevelID!=0 && supplierid!=null){
			list=roomSetService.levelSelectBedInformationAndsupplier(guestRoomLevelID,supplierid);
		}else if (rents!=null && guestRoomLevelID!=0 && supplierid==null){
			list=roomSetService.levelSelectBedInformation(guestRoomLevelID);
		}

		Gson gson=new Gson();
		return gson.toJson(list);
	}

	@RequestMapping(value="/roomConsumption")
	public ModelAndView roomConsumption(Integer id){
		ModelAndView mv=null;
		mv=new ModelAndView("/stayregister/roomlist");

		List<StayRegisterPo> listC=stayRegisterService.roomConsumption(id);
		mv.addObject("listC",listC);
		return mv;
	}

	//======================================================================================================================//

	@RequestMapping("/tolists")
	public ModelAndView lists(HttpServletRequest request, Integer currentPage, String ordernumber, Integer LvKeLeiXingId, Integer isBillID){
		ModelAndView mv=null;

		List<StayRegisterPo> listAll=stayRegisterService.selectAll();


		List<AttributePo> listOne=attributeService.selectIsPay();
		mv=new ModelAndView("/stayregister/list");
		if (isBillID==null) {
			isBillID=68;
		}
		if (LvKeLeiXingId==null) {
			LvKeLeiXingId=55;
		}
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}

		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		vo.setCurrentPage(currentPage);

		if(ordernumber==null)
		{
			ordernumber="";
		}
		vo=this.stayRegisterService.pageFuzzyselectOrder(LvKeLeiXingId, isBillID, ordernumber, vo);
		mv.addObject("list",vo);
		mv.addObject("listOne",listOne);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("isBillID",isBillID);
		mv.addObject("ordernumber",ordernumber);
		mv.addObject("order","order");
		return mv;
	}
	@RequestMapping("/orderDetails")
	public ModelAndView orderDetails(String orderID){
		ModelAndView mv=null;
		mv=new ModelAndView("/stayregister/orderlist");
		OrderPo orderPo=orderService.selectStatua(orderID);
		mv.addObject("orderPo",orderPo);
	return mv;
	}

	//团队的list查询
	@RequestMapping("/toteamlists")
	public ModelAndView toteamlists(HttpServletRequest request, Integer currentPage,
								   String orderID, Integer LvKeLeiXingId, Integer isBillID, Integer tuanDuiID,
								   String teamNameId, String teamCodeId, String principalId,
								   String contactPhoneNUmberId, String registerTimeId){
		ModelAndView mv=null;
		List<StayRegisterPo> listTeam=null;
		List<StayRegisterPo> listAll=stayRegisterService.selectAll();
		Date date=new Date();
		DateFormat dformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   //设置日期格式
		Timestamp timestamp=Timestamp.valueOf(dformat.format(date)) ;  //将当前时间转为字符串

		int id=0;
		long xiangChaTianShu;
		long days;
		long hours;
		String zhuSu="";
		double teamSumConst=0;
		List<AttributePo> listOne=attributeService.selectIsPay();
		mv=new ModelAndView("/stayregister/list");
		if (isBillID==null) {
			isBillID=68;
		}
		if (LvKeLeiXingId==null) {
			LvKeLeiXingId=56;
		}
		if (tuanDuiID==null) {
			listTeam=this.stayRegisterService.selectFormTeamIdTwo(isBillID);
		}else {
			listTeam=this.stayRegisterService.selectFormTeamId(tuanDuiID, isBillID);
		}
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}

		for (int i = 0; i < listTeam.size(); i++) {
			teamSumConst+=listTeam.get(i).getSumConst();
		}

		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		vo.setCurrentPage(currentPage);

		if(orderID==null)
		{
			orderID="";
		}
		if (tuanDuiID==null) {
			vo=this.stayRegisterService.pageFuzzyselectThree(isBillID, orderID, vo);
		}else {
			vo=this.stayRegisterService.pageFuzzyselectTwo(tuanDuiID, isBillID, orderID, vo);
		}
		mv.addObject("list",vo);
		mv.addObject("listOne",listOne);
		mv.addObject("LvKeLeiXingId",LvKeLeiXingId);
		mv.addObject("isBillID",isBillID);
		mv.addObject("orderID",orderID);
		mv.addObject("tuanDui",tuanDuiID);
		mv.addObject("teamNameId",teamNameId);
		mv.addObject("teamCodeId",teamCodeId);
		mv.addObject("principalId",principalId);
		mv.addObject("contactPhoneNUmberId",contactPhoneNUmberId);
		mv.addObject("registerTimeId",registerTimeId);
		mv.addObject("teamSumConst",teamSumConst);
		mv.addObject("order","order");
		return mv;
	}





	@ResponseBody
	@RequestMapping(value="/changRoomSelectPassengerBed")
	public Object changRoomSelectPassengerBed(String roomNumber,Integer supplier,Integer stayId){
		List<RoomSetPo> list=null;
		if (roomNumber==null){
			roomNumber="";
		}
		if (roomNumber==""){
			roomNumber="";
		}
		StayRegisterPo spo=stayRegisterService.selectById(stayId);
		Integer count=bedroomdetailsSerivce.selectcount(spo.getRoomID());
		list=roomSetService.selectInformationsRoomNumberSupplierBed(roomNumber,supplier,count);
		Gson gson=new Gson();
		return gson.toJson(list);
	}
	@RequestMapping("/confirmChangRoomBed")
	public ModelAndView confirmChangRoomBed(Integer id, Integer roomId,
										 Timestamp changRoomTime, Integer LvKeLeiXingId,Integer supplier){
		ModelAndView mv=null;

		String huanFangCiShu="";                    //换房次数
		int jiuFangJianId=0;                        //旧房间id
		int zhudianrenshu=0;                     //人数
		List<StayRegisterPo> list=stayRegisterService.selectChangRoom(id);
		RoomSetPo roomSetPo=roomSetService.selectById(roomId);
		List<StayRegisterPo> listShangPin=stayRegisterService.selectMoney(id);

		huanFangCiShu=list.get(0).getChangingRoomNumber();                             //获取换房次数
		jiuFangJianId=list.get(0).getRoomID();                                         //获取旧房间id

		if (huanFangCiShu==null || huanFangCiShu=="") {
			huanFangCiShu="1";
		}else{
			huanFangCiShu=String.valueOf(Integer.parseInt(huanFangCiShu)+1);
		}
		StayRegisterPo stayRegisterPo=new StayRegisterPo();
		RoomSetPo roomOne=new RoomSetPo();
		RoomSetPo roomTwo=new RoomSetPo();
		stayRegisterPo.setId(id);
		stayRegisterPo.setRoomID(roomId);
		stayRegisterPo.setSumConst(0);
		stayRegisterPo.setChangingRoomNumber(huanFangCiShu);
		stayRegisterPo.setChangRoomMoney(0);
		stayRegisterPo.setChangRoomTime(changRoomTime);
		roomOne.setId(jiuFangJianId);
		roomOne.setRoomStateID(1);
		roomTwo.setId(roomId);
		roomTwo.setRoomStateID(1);

		roomSetService.updateByIdToRoomState(roomOne);
		roomSetService.updateByIdToRoomState(roomTwo);
		stayRegisterService.updateChangRoom(stayRegisterPo);

		zhudianrenshu=list.get(0).getRenshu();

		if (list.get(0).getRoomID().equals(roomSetPo.getId())){//旧房====新房

		}else {
			BedroomPo bedroomPo=bedRoomService.selectroomid(list.get(0).getRoomID());
			//在原房间修改
			BedroomPo bpo=new BedroomPo();
			bpo.setRoomAcount(bedroomPo.getRoomAcount());
			Integer surp=Integer.valueOf(bedroomPo.getSurplusAcount())+zhudianrenshu;
			bpo.setSurplusAcount(surp);
			bpo.setPeople(bedroomPo.getPeople()-zhudianrenshu);
			bpo.setRoomid(list.get(0).getRoomID());
			bedRoomService.update(bpo);
			bedroomdetailsSerivce.updatestatusstay(bedroomPo.getId(),id);
			//新房修改
			BedroomPo bedroomPo2=bedRoomService.selectroomid(roomSetPo.getId());
			BedroomPo bpo2=new BedroomPo();
			Integer surp2=Integer.valueOf(bedroomPo2.getSurplusAcount())-zhudianrenshu;
			bpo2.setRoomAcount(roomSetPo.getRoomAmount());
			bpo2.setSurplusAcount(surp2);
			bpo2.setPeople(bedroomPo2.getPeople()+zhudianrenshu);
			bpo2.setRoomid(roomSetPo.getId());
			bedRoomService.update(bpo2);

				BedroomdetailsPo bedpo3=new BedroomdetailsPo();
				bedpo3.setBedroomid(bedroomPo2.getId());
				bedpo3.setStayid(id);
				if (list.get(0).getPredetermineID()==null){
					bedpo3.setPredeid(0);
				}else {
					bedpo3.setPredeid(list.get(0).getPredetermineID());
				}
				bedpo3.setIslikai(1);
				bedroomdetailsSerivce.inserAll(bedpo3);
		}


		mv=new ModelAndView("redirect:/StayRegister/tolist.do?LvKeLeiXingId="+LvKeLeiXingId);
		return mv;
	}


	@RequestMapping("/confirmReceipt")
	public  ModelAndView confirmReceipt(Integer id,Integer isdao){
		ModelAndView mv=null;
		mv=new ModelAndView("redirect:/StayRegister/tolist.do");
		stayRegisterService.confirmReceipt(id,isdao);
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="/codeNumberYZ")
	public Object codeNumberYZ(String codeNumber) {
		int YorN = stayRegisterService.codeNumberYZ(codeNumber);
		Gson gson = new Gson();
		return gson.toJson(YorN);
	}


}
