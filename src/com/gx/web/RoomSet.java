package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/RoomSet")
public class RoomSet {
	
	@Autowired
	private AttributeService attributeService;
	
	@Autowired
	private RoomSetService roomSetService;
	@Autowired
	private PredetermineService predetermineService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private BedRoomService bedRoomService;
	@Autowired
	private EmptyRoomSerivce emptyRoomSerivce;


	
	//分页和模糊查询
	@RequestMapping("/tolist")
	public ModelAndView list(HttpServletRequest request, Integer currentPage, String txtname,
							 Integer supplier, Integer user, Integer roomStateID
                            ,Integer guestRoomLevelID){
		ModelAndView mv=null;
		mv=new ModelAndView("/roomset/roomset");
		Page<RoomSetPo> vo=new Page<RoomSetPo>();
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

        vo=this.roomSetService.pageFuzzyAll(txtname,supplier,roomStateID,guestRoomLevelID, vo);
		List<AttributePo> listTwo=attributeService.selectRoomState();
		List<SupplierPo> slist=supplierService.listAll();
        List<AttributePo> listOne=attributeService.selectGuestRoomLevel();
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		mv.addObject("supplier",supplier);
		mv.addObject("slist",slist);
        mv.addObject("listOne",listOne);
		mv.addObject("listTwo",listTwo);
		mv.addObject("user",user);
		mv.addObject("roomStateID",roomStateID);
        mv.addObject("guestRoomLevelID",guestRoomLevelID);
		return mv;
	}

	//分页和模糊查询
	@RequestMapping("/toroomlist")
	public ModelAndView roomlist(HttpServletRequest request, String txtname,Integer currentPage, String timeOne,String timeTwo){
		ModelAndView mv=null;
		mv=new ModelAndView("/roomset/viewemptyrooms");
		Page<EmptyroomPo> vo=new Page<EmptyroomPo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}

		vo.setCurrentPage(currentPage);
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		 java.util.Date one1 = null;
		java.util.Date two2 = null;
		Date one=null;
		Date two=null;
		if (timeOne==null){
			timeOne="";
		}
		if (timeTwo==null){
			timeTwo="";
		}


		try {
			if(timeOne!="" && timeTwo!="" ){
				one1 =format1.parse(timeOne);
				two2 = format1.parse(timeTwo);
				one =new Date(one1.getTime());
				two=new Date(two2.getTime());
			}else if (timeOne!="" && timeTwo=="") {
				one1 = format1.parse(timeOne);
				one =new Date(one1.getTime());
			}else if (timeOne=="" && timeTwo!="" ){
				two2 = format1.parse(timeTwo);
				two=new Date(two2.getTime());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (one==null || two==null){
			vo=this.emptyRoomSerivce.listSelectAll(txtname, vo);
		}else {
			vo = this.emptyRoomSerivce.listAll(txtname, one, two, vo);
		}
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		mv.addObject("timeOne",timeOne);
		mv.addObject("timeTwo",timeTwo);
		return mv;
	}

	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		List<AttributePo> listOne=attributeService.selectGuestRoomLevel();
		List<AttributePo> listTwo=attributeService.selectRoomState();
		List<SupplierPo> slist=supplierService.listAll();
		mv=new ModelAndView("/roomset/add");
		mv.addObject("listOne",listOne);
		mv.addObject("listTwo",listTwo);
		mv.addObject("slist",slist);
		return mv;
	}
	
	@RequestMapping("/add")
	public ModelAndView add(RoomSetPo roomSetPo){
		ModelAndView mv=null;
		Timestamp d = new Timestamp(System.currentTimeMillis());
		roomSetPo.setTime(d);
		if (roomSetPo.getDiscount()==0 && roomSetPo.getDiscountPrice()==0){
			roomSetPo.setDiscount(10);
			roomSetPo.setDiscountPrice(roomSetPo.getStandardPrice());
		}
		roomSetService.insertAll(roomSetPo);
		RoomSetPo roomID=roomSetService.selectIDSupplierid(roomSetPo.getRoomNumber(),roomSetPo.getSupplierID());
		if (roomID.getIsBed()==0){
			BedroomPo bedroomPo=new BedroomPo();
			bedroomPo.setRoomid(roomID.getId());
			bedroomPo.setRoomAcount(roomID.getRoomAmount());
			bedroomPo.setSurplusAcount(Integer.valueOf(roomID.getRoomAmount()));
			bedroomPo.setPeople(0);
			bedRoomService.inserAll(bedroomPo);
		}

				//记录空房
				EmptyroomPo emptyroomPo=new EmptyroomPo();
				emptyroomPo.setRoomid(roomID.getId());
				emptyroomPo.setRoomNumber(roomID.getRoomNumber());
				emptyroomPo.setStayid(0);
				emptyroomPo.setPreid(0);
				emptyRoomSerivce.inserAll(emptyroomPo);



		mv=new ModelAndView("redirect:/RoomSet/tolist.do");
		return mv;
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id){
		ModelAndView mv=null;
		List<AttributePo> listOne=attributeService.selectGuestRoomLevel();
		List<AttributePo> listTwo=attributeService.selectRoomState();
		RoomSetPo listPo=roomSetService.selectById(id);
		mv=new ModelAndView("/roomset/update");
		mv.addObject("listOne",listOne);
		mv.addObject("listTwo",listTwo);
		mv.addObject("listPo",listPo);
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(RoomSetPo roomSetPo,Integer isBed2){
		ModelAndView mv=null;
		roomSetService.updateById(roomSetPo);
		if (isBed2==0 && roomSetPo.getIsBed()==0){
		}else if(isBed2==0 && roomSetPo.getIsBed()==1){
		bedRoomService.deleteRoomid(roomSetPo.getId());
		}else if(isBed2==1 && roomSetPo.getIsBed()==1){
		}else if(isBed2==1 && roomSetPo.getIsBed()==0){
			BedroomPo bedroomPo=new BedroomPo();
			bedroomPo.setRoomid(roomSetPo.getId());
			bedroomPo.setRoomAcount(roomSetPo.getRoomAmount());
			bedroomPo.setSurplusAcount(Integer.valueOf(roomSetPo.getRoomAmount()));
			bedroomPo.setPeople(0);
			bedRoomService.inserAll(bedroomPo);
		}

		mv=new ModelAndView("redirect:/RoomSet/tolist.do");
		return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(String id, HttpSession session){
		ModelAndView mv=null;
		String[] FenGe=id.split(",");
			for (int i = 0; i < FenGe.length; i++) {
				RoomSetPo po = roomSetService.selectById(Integer.parseInt(FenGe[i]));
				roomSetService.deleteById(Integer.parseInt(FenGe[i]));
				if (po.getIsBed() == 0) {//按床位出租
					bedRoomService.deleteRoomid(Integer.parseInt(FenGe[i]));
				}
				emptyRoomSerivce.deleteRoomid(Integer.parseInt(FenGe[i]));
			}
		mv=new ModelAndView("redirect:/RoomSet/tolist.do");
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/YZ")
	public Object YZ(String roomNumber,Integer supplierID){
		int YorN=roomSetService.selectYZ(roomNumber,supplierID);
		Gson gson =new Gson();
		return gson.toJson(YorN);
	}


	@RequestMapping(value="/roomdetail")
	public ModelAndView selectDetailById(Integer id,String roomNumber){
		PredeterminePo roomSet=predetermineService.selectDetailById(id);
		ModelAndView mv=null;
		mv=new ModelAndView("/roomset/xiugai");
		mv.addObject("roomSet",roomSet);
		mv.addObject("roomNumber",roomNumber);
		return mv;
	}

	@RequestMapping(value="/detail")
	public ModelAndView selectDetailByIds(Integer id){

		RoomSetPo roomSet=roomSetService.selectDetailByIds(id);
		ModelAndView mv=null;
		mv=new ModelAndView("/roomset/check");
		mv.addObject("roomSet",roomSet);
		return mv;
	}


}
