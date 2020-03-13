package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.CommodityPo;
import com.gx.service.CommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Commodity")
public class Commodity {

	@Autowired
	private CommodityService commodityService;

	
	//分页和模糊查询
		@RequestMapping("/tolist")
		public ModelAndView list(HttpServletRequest request, Integer currentPage, String txtname, Integer commodityTypeID,Integer user){
			ModelAndView mv=null;
			mv=new ModelAndView("/commodity/list");
			Page<CommodityPo> vo=new Page<CommodityPo>();
			if (commodityTypeID==null) {
				commodityTypeID=16;
			}
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
			vo=this.commodityService.pageFuzzyselect(txtname,commodityTypeID, vo);
			mv.addObject("list",vo);
			mv.addObject("txtname",txtname);
			mv.addObject("commodityType",commodityTypeID);
			mv.addObject("user",user);
			return mv;
		}
		
		
		@RequestMapping("/toadd")
		public ModelAndView toadd(){
			ModelAndView mv=null;
			mv=new ModelAndView("/commodity/add");
			return mv;
		}
		
		@RequestMapping("/add")
		public ModelAndView add(CommodityPo commodityPo){
			ModelAndView mv=null;
			commodityService.insertAll(commodityPo);
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		@RequestMapping("/toupdate")
		public ModelAndView toupdate(int id){
			ModelAndView mv=null;
			CommodityPo commodityPo=commodityService.selectById(id);
			mv=new ModelAndView("/commodity/update");
			mv.addObject("listPo",commodityPo);
			return mv;
		}
		
		@RequestMapping("/update")
		public ModelAndView update(CommodityPo commodityPo){
			ModelAndView mv=null;
			commodityService.updateById(commodityPo);
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		@RequestMapping("/delete")
		public ModelAndView delete(String id){
			ModelAndView mv=null;
			String[] FenGe=id.split(",");
			for (int i = 0; i < FenGe.length; i++) {
				commodityService.deleteById(Integer.parseInt(FenGe[i]));
			}
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		
		
		
		@RequestMapping("/openwindow")
		public ModelAndView openwindow(){
			ModelAndView mv=null;
			mv=new ModelAndView("/commodity/commoditytype");
			return mv;
		}
		
		@RequestMapping("/newadd")
		public ModelAndView newadd(String txtname){
			ModelAndView mv=null;
			int newid=3;
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		@RequestMapping("/newdelete")
		public ModelAndView newdelete(String id){
			ModelAndView mv=null;
			String[] FenGe=id.split(",");
			for (int i = 0; i < FenGe.length; i++) {
			}
			mv=new ModelAndView("redirect:/Commodity/tolist.do");
			return mv;
		}
		
		
		@ResponseBody
		@RequestMapping(value="/YZ")
		public Object YZ(String commodityName){
			int YorN=commodityService.selectYZ(commodityName);
			Gson gson =new Gson();
			return gson.toJson(YorN);
		}

	//commdityroom


	/*//根据商品Id查询房间号
	@RequestMapping("/commdityroom")
	public ModelAndView list(HttpServletRequest request, Integer id){
		ModelAndView mv=null;
		List<String> listRoome=this.commodityService.selectRoomNumber(id);
		mv=new ModelAndView("/commodity/roomlist");

		mv.addObject("listRoome",listRoome);
		return mv;
	}*/
}
