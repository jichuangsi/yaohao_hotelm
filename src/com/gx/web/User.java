package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.AttributePo;
import com.gx.po.PassengerPo;
import com.gx.po.UserPo;
import com.gx.service.AttributeService;
import com.gx.service.PassengerService;
import com.gx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/User")
public class User {
    @Autowired
    private UserService userService;

    @RequestMapping("/tolist")

    public ModelAndView tolist(HttpServletRequest request, Integer currentPage, String txtname){
        ModelAndView mv=null;
        mv=new ModelAndView("/user/list");
        Page<UserPo> vo=new Page<UserPo>();
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
        vo=this.userService.pageFuzzyselect(txtname,vo);
        mv.addObject("list",vo);
        mv.addObject("txtname",txtname);
        return mv;
    }

    @RequestMapping("/toadd")
    public ModelAndView toadd(){
        ModelAndView mv=null;
        mv=new ModelAndView("/user/add");
        return mv;
    }

    @RequestMapping("/toupdate")
    public ModelAndView toupdate(int id){
        ModelAndView mv=null;
        mv=new ModelAndView("/user/update");
        UserPo list=userService.selectById(id);
        mv.addObject("list",list);
        return mv;
    }

    @RequestMapping("/add")
    public ModelAndView add(UserPo userPo){
        ModelAndView mv=null;
        userService.insertAll(userPo);
        mv=new ModelAndView("redirect:/User/tolist.do");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(UserPo userPo){
        ModelAndView mv=null;
        userService.updateById(userPo);
        mv=new ModelAndView("redirect:/User/tolist.do");
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(String id){
        ModelAndView mv=null;
        String[] FenGe=id.split(",");
        for (int i = 0; i < FenGe.length; i++) {
            userService.deleteById(Integer.parseInt(FenGe[i]));
        }
        mv=new ModelAndView("redirect:/User/tolist.do");
        return mv;
    }



    @ResponseBody
    @RequestMapping(value="/YZ")
    public Object YZ(String userName){
        int YorN=userService.selectYZ(userName);
        Gson gson =new Gson();
        return gson.toJson(YorN);
    }
}
