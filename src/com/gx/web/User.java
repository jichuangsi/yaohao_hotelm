package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.UserPo;
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

    public ModelAndView tolist(HttpServletRequest request, Integer currentPage, String name){
        ModelAndView mv=null;
        mv=new ModelAndView("/user/userManagement");
        Page<UserPo> vo=new Page<UserPo>();
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        if(name==null)
        {
            name="";
        }
        vo.setCurrentPage(currentPage);
        List<UserPo> list=userService.fuzzyselect(name);
        vo=this.userService.pageFuzzyselect(name,vo);
        mv.addObject("list",list);
        mv.addObject("name",name);
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
    @ResponseBody
    @RequestMapping("/add")
    public Object add(UserPo userPo){
        ModelAndView mv=null;
       int count= userService.insertAll(userPo);
        mv=new ModelAndView("redirect:/User/tolist.do");
        //return mv;
        Gson gson=new Gson();
       return gson.toJson(count);
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
