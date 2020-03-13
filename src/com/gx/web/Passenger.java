package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.PassengerPo;
import com.gx.po.PlatformPo;
import com.gx.service.PassengerService;
import com.gx.service.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Passenger")
public class Passenger {
	
	@Autowired
	private PassengerService passengerService;
	@Autowired
	private PlatformService platformService;
	
	@RequestMapping("/tolist")
	public ModelAndView tolist(HttpServletRequest request, Integer currentPage, String txtname){
		ModelAndView mv=null;
		mv=new ModelAndView("/passenger/list");
		Page<PassengerPo> vo=new Page<PassengerPo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		if(txtname==null)
		{
			txtname="";
		}
		vo.setCurrentPage(currentPage);
		vo=this.passengerService.pageFuzzyselect(txtname, vo);
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		return mv;
	}
	
	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
	/*	List<AttributePo> listNation=attributeService.selectNation();                      //民族*/
	/*	List<AttributePo> listPassengerLevel=attributeService.selectPassengerLevel();      //旅客级别*/
		/*List<AttributePo> listEducationDegree=attributeService.selectEducationDegree();    //文化程度
		List<AttributePo> listPapers=attributeService.selectPapers();                      //证件类型
		List<AttributePo> listThingReason=attributeService.selectThingReason();            //事由*/
		List<PlatformPo> listP=platformService.listAll();
		mv=new ModelAndView("/passenger/add");
		/*mv.addObject("listNation",listNation);
		mv.addObject("listPassengerLevel",listPassengerLevel);
		mv.addObject("listEducationDegree",listEducationDegree);
		mv.addObject("listPapers",listPapers);
		mv.addObject("listThingReason",listThingReason);*/
		mv.addObject("listP",listP);
		return mv;
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id){
		ModelAndView mv=null;               //性别
		/*List<AttributePo> listNation=attributeService.selectNation();                      //民族
		List<AttributePo> listPassengerLevel=attributeService.selectPassengerLevel();      //旅客级别
		List<AttributePo> listEducationDegree=attributeService.selectEducationDegree();    //文化程度
		List<AttributePo> listPapers=attributeService.selectPapers();                      //证件类型
		List<AttributePo> listThingReason=attributeService.selectThingReason();            //事由*/
		PassengerPo list=passengerService.selectById(id);
		mv=new ModelAndView("/passenger/update");
	/*	mv.addObject("listNation",listNation);
		mv.addObject("listPassengerLevel",listPassengerLevel);
		mv.addObject("listEducationDegree",listEducationDegree);
		mv.addObject("listPapers",listPapers);
		mv.addObject("listThingReason",listThingReason);*/
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(PassengerPo passengerPo){
		ModelAndView mv=null;
		passengerPo.setTime(System.currentTimeMillis());
		passengerService.insertAll(passengerPo);
		mv=new ModelAndView("redirect:/Passenger/tolist.do");
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(PassengerPo passengerPo){
		ModelAndView mv=null;
		passengerService.updateById(passengerPo);
		mv=new ModelAndView("redirect:/Passenger/tolist.do");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(String id){
		ModelAndView mv=null;
		String[] FenGe=id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			passengerService.deleteById(Integer.parseInt(FenGe[i]));
		}
		mv=new ModelAndView("redirect:/Passenger/tolist.do");
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/YZ")
	public Object YZ(String name,String number){
		int YorN=passengerService.selectYZ(name,number);
		Gson gson =new Gson();
		return gson.toJson(YorN);
	}
//=======================================================================//

/*
	@RequestMapping("/orderDetails")
	public ModelAndView orderDetails(HttpServletRequest request, Integer currentPage, String codeNumber){
		ModelAndView mv=null;
		mv=new ModelAndView("/receivetarget/orderlist");
		if(codeNumber==null)
		{
			codeNumber="";
		}

		ReceiveTargetPo vo=this.receiveTargetService.selectOrderDetails(codeNumber);
		mv.addObject("list",vo);
		return mv;
	}
	@RequestMapping("/updateOrderStatus")
	public ModelAndView updateOrderStatus(String codeNumber,Integer orderStatus){
		ModelAndView mv=null;
		receiveTargetService.updateStatus(codeNumber,orderStatus);
		mv=new ModelAndView("redirect:/ReceiveTarget/tolist.do");
		return mv;
	}*/
}
