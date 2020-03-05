package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.PlatformPo;
import com.gx.service.PlatformService;
import com.gx.service.PredetermineService;
import com.gx.service.StayRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller
@RequestMapping("/Platform")
public class Platform {
    @Autowired
    private PlatformService platformService;
    @Autowired
    private PredetermineService predetermineService;
    @Autowired
    private StayRegisterService stayRegisterService;

    //分页和模糊查询
    @RequestMapping("/tolist")
    public ModelAndView list(HttpServletRequest request, Integer currentPage, String txtname){
        ModelAndView mv=null;
        mv=new ModelAndView("/platform/list");
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
        mv.addObject("list",vo);
        mv.addObject("txtname",txtname);
        return mv;
    }


    @RequestMapping("/toadd")
    public ModelAndView toadd(){
        ModelAndView mv=null;
        mv=new ModelAndView("/platform/add");
        return mv;
    }

    @RequestMapping("/add")
    public ModelAndView add(PlatformPo platformPo){
        ModelAndView mv=null;
        platformService.insertAll(platformPo);
        mv=new ModelAndView("redirect:/Platform/tolist.do");
        return mv;
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
        Integer pre=predetermineService.selectPrePlatform(id);
        Integer sta=stayRegisterService.selectStaPlatform(id);
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
