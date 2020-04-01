package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.vo.RoomVo;
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
	private RoomSetService roomSetService;
	@Autowired
	private SupplierService supplierService;
	@Autowired
	private GuestRoomLevelService guestRoomLevelService;
	@Autowired
	private DailyconsumptionService dailyconsumptionService;
	@Autowired
	private FinanceService financeService;
	@Autowired
	private OrderService orderService;

///////////////////////////////////自有///////////////////////////////////////////////////

	//分页和模糊查询
	@RequestMapping("/tolist")
	public ModelAndView list(Integer currentPage, String txtname,Integer guestRoomLevelID){
		ModelAndView mv=null;
		mv=new ModelAndView("/roomset/roomManagement");
		Page<RoomVo> vo=new Page<RoomVo>();
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		/*if(txtname==null)
		{
			txtname="";
		}*/
		vo.setCurrentPage(currentPage);

        vo=this.roomSetService.haveRoom(txtname,guestRoomLevelID, vo);
		List<SupplierPo> slist=supplierService.listHaveAll();
		List<guestRoomLevelPo> glist=guestRoomLevelService.list();
		mv.addObject("list",vo);
		mv.addObject("txtname",txtname);
		mv.addObject("slist",slist);
        mv.addObject("glist",glist);
        mv.addObject("guestRoomLevelID",guestRoomLevelID);
		return mv;
	}


	@RequestMapping("/toadd")
	public ModelAndView toadd(){
		ModelAndView mv=null;
		List<SupplierPo> slist=supplierService.listAll();
		List<guestRoomLevelPo> glist=guestRoomLevelService.list();
		mv.addObject("slist",slist);
		mv.addObject("glist",glist);
		mv=new ModelAndView("/roomset/add");
		return mv;
	}


	@ResponseBody
	@RequestMapping("/add")
	public Object add(RoomSetPo roomSetPo){
		ModelAndView mv=null;
		Timestamp d = new Timestamp(System.currentTimeMillis());
		roomSetPo.setTime(System.currentTimeMillis());
		RoomSetPo roomID=roomSetService.selectIDSupplierid(roomSetPo.getRoomNumber(),roomSetPo.getSupplierID());
		int count=0;
		if (roomID==null){
			count=roomSetService.insertAll(roomSetPo);
		}
		/*mv=new ModelAndView("redirect:/RoomSet/tolist.do");
		return mv;*/
		Gson gson =new Gson();
		return gson.toJson(count);
	}
	
	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id){
		ModelAndView mv=null;
		List<SupplierPo> slist=supplierService.listAll();
		List<guestRoomLevelPo> glist=guestRoomLevelService.list();
		mv.addObject("slist",slist);
		mv.addObject("glist",glist);
		RoomSetPo listPo=roomSetService.selectById(id);
		mv=new ModelAndView("/order/update");
		mv.addObject("listPo",listPo);
		return mv;
	}
	@ResponseBody
	@RequestMapping("/update")
	public Object update(RoomSetPo roomSetPo){
		ModelAndView mv=null;
		Integer count=0;
		Integer roomA=orderService.roomAcountu(roomSetPo.getId());
		if (roomA==null){
			roomA=0;
		}
		if (roomA>Integer.parseInt(roomSetPo.getRoomAmount())){//入住人数小于修改床位数
			count=0;
		}else {
			count=roomSetService.updateById(roomSetPo);
			count=financeService.updateRoomNuberByRoomId(roomSetPo.getId(),roomSetPo.getRoomNumber());
			count=dailyconsumptionService.updateNumberByRoomId(roomSetPo.getId(),roomSetPo.getRoomNumber());
		}
		Gson gson=new Gson();
		return gson.toJson(count);
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(String id, HttpSession session){
		ModelAndView mv=null;
		String[] FenGe=id.split(",");
			for (int i = 0; i < FenGe.length; i++) {
				RoomSetPo po = roomSetService.selectById(Integer.parseInt(FenGe[i]));
				roomSetService.deleteById(Integer.parseInt(FenGe[i]));
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

	@RequestMapping(value="/detail")
	public ModelAndView selectDetailByIds(Integer id){
		RoomVo roomSet=roomSetService.selectDetailByIds(id);
		ModelAndView mv=null;
		mv=new ModelAndView("/roomset/check");
		mv.addObject("roomSet",roomSet);
		return mv;
	}

	/**
	 * 修改房量
	 * @param
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updateAcount")
	public Object updateAcount(int id,Integer roomAcount){
		ModelAndView mv=null;
		Integer count=0;
		Integer roomA=orderService.roomAcountu(id);
		if (roomA==null){
			roomA=0;
		}
		/*RoomSetPo roomSetPo=roomSetService.selectById(id);*/
		if (roomA>roomAcount){//入住人数小于修改床位数
			count=0;
		}else {
			count=roomSetService.roomAcountById(id, roomAcount);
		}
		Gson gson=new Gson();
		return gson.toJson(count);
	}
}
