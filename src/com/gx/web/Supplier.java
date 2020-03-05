package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.RoomSetPo;
import com.gx.po.SupplierPo;
import com.gx.service.PredetermineService;
import com.gx.service.RoomSetService;
import com.gx.service.StayRegisterService;
import com.gx.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Supplier")
public class Supplier {
    @Autowired
    private SupplierService supplierService;

    @Autowired
    private RoomSetService roomSetService;
    @Autowired
    private PredetermineService predetermineService;
    @Autowired
    private StayRegisterService stayRegisterService;

    //分页和模糊查询
    @RequestMapping("/tolist")
    public ModelAndView list(HttpServletRequest request, Integer currentPage, String txtname){
        ModelAndView mv=null;
        mv=new ModelAndView("/supplier/list");
        Page<SupplierPo> vo=new Page<SupplierPo>();
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
        vo=this.supplierService.pageFuzzyselect(txtname, vo);
        mv.addObject("list",vo);
        mv.addObject("txtname",txtname);
        return mv;
    }


    @RequestMapping("/toadd")
    public ModelAndView toadd(){
        ModelAndView mv=null;
        mv=new ModelAndView("/supplier/add");
        return mv;
    }

    @RequestMapping("/add")
    public ModelAndView add(SupplierPo supplierPo){
        ModelAndView mv=null;
        supplierService.insertAll(supplierPo);
        mv=new ModelAndView("redirect:/Supplier/tolist.do");
        return mv;
    }

    @RequestMapping("/toupdate")
    public ModelAndView toupdate(int id){
        ModelAndView mv=null;
        SupplierPo supplierPo=supplierService.selectById(id);
        mv=new ModelAndView("/supplier/update");
        mv.addObject("listPo",supplierPo);
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView update(SupplierPo supplierPo){
        ModelAndView mv=null;
        supplierService.updateById(supplierPo);
        mv=new ModelAndView("redirect:/Supplier/tolist.do");
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView delete(Integer id){
        ModelAndView mv=null;
            Integer precount=predetermineService.selectPreSupplier(id);
            Integer stacount=stayRegisterService.selectStaCount(id);
            if (precount>0 || stacount>0){
                mv=new ModelAndView("redirect:/Supplier/tolist.do");
            }else {
                supplierService.deleteById(id);//删除供应商，禁用isenabled=1
                mv=new ModelAndView("redirect:/Supplier/tolist.do");
            }

        return mv;
    }
    @RequestMapping("/enabled")
    public ModelAndView enabled(Integer id){
        ModelAndView mv=null;
            supplierService.enabledById(id);//删除供应商，禁用isenabled=1
        mv=new ModelAndView("redirect:/Supplier/tolist.do");
        return mv;
    }
    @ResponseBody
    @RequestMapping(value="/YZ")
    public Object YZ(String name){
        int YorN=supplierService.selectYZ(name);
        Gson gson =new Gson();
        return gson.toJson(YorN);
    }
}
