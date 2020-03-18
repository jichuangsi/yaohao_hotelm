package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.PlatformPo;
import com.gx.service.PlatformService;
import com.gx.vo.ResponseModel;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
@Controller
@RequestMapping("/Platform")
public class Platform {
    @Autowired
    private PlatformService platformService;
    //分页和模糊查询,produces="text/jsp;charset=UTF-8"

    @RequestMapping(value = "/tolist",produces="text/jsp;charset=UTF-8")
    public ModelAndView list(Integer currentPage, String txtname){
        ModelAndView mv=null;
       mv=new ModelAndView("/platform/merchantManagement");
        Page<PlatformPo> vo=new Page<PlatformPo>();
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
        vo=this.platformService.pageFuzzyselect(txtname, vo);
        List<PlatformPo> platforms=platformService.pageFuzzyselects(txtname,vo);
        int count=platformService.count(txtname);
        JSONArray data = JSONArray.fromObject(platforms);
        mv.addObject("list", vo);
      return mv;

    }



    @RequestMapping("/toadd")
    public ModelAndView toadd(){
        ModelAndView mv=null;
        mv=new ModelAndView("/platform/add");
        return mv;
    }
    @ResponseBody
    @RequestMapping("/add")
    public Object add(PlatformPo platformPo){
        ModelAndView mv=null;
        Integer count= platformService.insertAll(platformPo);
        /*mv=new ModelAndView("redirect:/Platform/tolist.do");
        return mv;*/
        Gson gson =new Gson();
        return gson.toJson(count);
    }

    @RequestMapping("/toupdate")
    public ModelAndView toupdate(int id){
        ModelAndView mv=null;
        PlatformPo platformPo=platformService.selectById(id);
        mv=new ModelAndView("/platform/update");
        mv.addObject("listPo",platformPo);
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(PlatformPo platformPo){
        ModelAndView mv=null;
        platformService.updateById(platformPo);
        mv=new ModelAndView("redirect:/Platform/tolist.do");
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(Integer id){
        ModelAndView mv=null;
        Integer pre=0;//predetermineService.selectPrePlatform(id);
        Integer sta=0;//stayRegisterService.selectStaPlatform(id);
        if (pre>0 || sta>0){
            mv=new ModelAndView("redirect:/Platform/tolist.do");
        }else {
            platformService.deleteById(id);
            mv=new ModelAndView("redirect:/Platform/tolist.do");
        }
        return mv;
    }
    @RequestMapping("/enabled")
    public ModelAndView enabled(Integer id){
        ModelAndView mv=null;
            platformService.enabledById(id);
        mv=new ModelAndView("redirect:/Platform/tolist.do");
        return mv;
    }
    @ResponseBody
    @RequestMapping(value="/YZ")
    public Object YZ(String name){
        int YorN=platformService.selectYZ(name);
        Gson gson =new Gson();
        return gson.toJson(YorN);
    }
}
