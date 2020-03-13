package com.gx.web;

import com.gx.po.UserPo;
import com.gx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/Login")
public class Login {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/tologin")
	public String tologin(){
		return "/login/login";
	}

	@RequestMapping("/tomain")
	public ModelAndView tomain(UserPo user){
		ModelAndView mv=null;
		double zongFeiYongOne=0;
		double zongFeiYongTwo=0;
		UserPo u=userService.selectLogin(user);
		
		if (u!=null) {
			mv=new ModelAndView("/main/main");
			mv.addObject("user",u.getGrade());

		}else {
			mv=new ModelAndView("/login/login");
		}
		mv.addObject("zongFeiYongOne",zongFeiYongOne);
		mv.addObject("zongFeiYongTwo",zongFeiYongTwo);
		return mv;
	}
	/*@RequestMapping("/exit")
	public String exit(HttpSession session){
		session.clear();
		return "/login/login";
	}*/
}
