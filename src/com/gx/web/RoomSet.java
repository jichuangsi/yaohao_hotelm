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
		roomSetPo.setCreateTime(System.currentTimeMillis());
		RoomSetPo roomID=roomSetService.selectIDSupplierid(roomSetPo.getRoomNumber(),roomSetPo.getSupplierID());
		if (roomID==null){
			roomSetService.insertAll(roomSetPo);
		}
		/*mv=new ModelAndView("redirect:/RoomSet/tolist.do");
		return mv;*/
		Gson gson =new Gson();
		return gson.toJson(1);
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
	
	@RequestMapping("/update")
	public ModelAndView update(RoomSetPo roomSetPo){
		ModelAndView mv=null;
		/*RoomSetPo roomID=roomSetService.selectIDSupplierid(roomSetPo.getRoomNumber(),roomSetPo.getSupplierID());
		if (roomID==null) {

		}*/
		roomSetService.updateById(roomSetPo);
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


}
