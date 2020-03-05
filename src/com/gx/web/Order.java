package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.OrderPo;
import com.gx.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Order")
public class Order {
    @Autowired
    private OrderService orderService;

    //分页和模糊查询
    @RequestMapping("/tolist")
    public ModelAndView list(HttpServletRequest request, Integer currentPage, String txtname) {
        ModelAndView mv = null;
        mv = new ModelAndView("/order/list");
        Page<OrderPo> vo = new Page<OrderPo>();
        if (currentPage == null) {
            currentPage = 1;
        } else if (currentPage == 0) {
            currentPage = 1;
        }
        if (txtname == null) {
            txtname = "";
        }
        vo.setCurrentPage(currentPage);
        vo = this.orderService.listAll(txtname, vo);
        mv.addObject("list", vo);
        mv.addObject("txtname", txtname);
        return mv;
    }


}
