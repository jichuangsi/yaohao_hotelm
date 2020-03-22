package com.gx.web;

import com.google.gson.Gson;
import com.gx.page.Page;
import com.gx.po.*;
import com.gx.service.*;
import com.gx.util.TimeTransformation;
import com.gx.vo.*;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/Hotelm")
public class Hotelm {

    @Autowired
    private OrderService orderService;
    @Autowired
    private RoomSetService roomSetService;
    @Autowired
    private RoomRecordService roomRecordService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private FinanceService financeService;
    @Autowired
    private RoomAndTimeService roomAndTimeService;
    @Autowired
    private SupplierService supplierService;
    @Autowired
    private PassengerService passengerService;
    @Autowired
    private PlatformService platformService;
    @Autowired
    private DailyconsumptionService dailyconsumptionService;
    @Autowired
    private ConsumptiontypeService consumptiontypeService;
    @Autowired
    private PublicOrderService publicOrderService;

    ///自有公寓

    //自有已订单
    @RequestMapping(value = "/allorder",produces = "text/jsp;charset=UTF-8")
    public ModelAndView myorder(String orderNumber,String pname,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/public/accommodationaccount");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }

        //全部订单
        Page<PublicOrderPo> vo=new Page<PublicOrderPo>();
        vo.setCurrentPage(currentPage);
        vo=this.publicOrderService.list(orderNumber, pname,vo);
        mv.addObject("orderNumber",orderNumber);
        mv.addObject("pname",pname);
        mv.addObject("list",vo);
        return mv;
    }


    //自有已确认订单
    @RequestMapping(value = "/checkinorder",produces = "text/jsp;charset=UTF-8")
    public ModelAndView checkinorder(String time,String orderNumber,String pname,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/public/accommodationin");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        String time2=null;
        if (time==null ||time==""){//默认当前日
            Timestamp timestamp=new Timestamp(System.currentTimeMillis());
            time2= new SimpleDateFormat("yyyy-MM-dd").format(timestamp).toString();
        }else {//根据日查
            //time2 = new SimpleDateFormat("yyyy-MM-dd").format(time);
            time2=time;
        }
        //全部订单
        Page<PublicOrderPo> vo=new Page<PublicOrderPo>();
        vo.setCurrentPage(currentPage);
        vo=this.publicOrderService.selectInByTime(time2,orderNumber, pname,vo);
        mv.addObject("list",vo);
        mv.addObject("orderNumber",orderNumber);
        mv.addObject("pname",pname);
        return mv;
    }

    //订单明细
    @RequestMapping("/myorderStatistics")
    public ModelAndView myorderStatistics(Integer isdao,String orderNumber,String pname,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/public/finance1");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        //全部订单
        Page<PublicOrderPo> vo=new Page<PublicOrderPo>();
        vo.setCurrentPage(currentPage);
        vo=this.publicOrderService.selectOrder(isdao,orderNumber, pname,vo);
        mv.addObject("list",vo);
        mv.addObject("orderNumber",orderNumber);
        mv.addObject("pname",pname);
        return mv;
    }
    //财务报表
    @RequestMapping("/myfinance")
    public ModelAndView myfinance(String time,String orderNumber,String pname,Integer currentPage) {
        ModelAndView mv = null;
        mv = new ModelAndView("/public/finance2");
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        String time2=null;
        /*String time2=null;
        if (time==null ||time==""){//默认当前日
            Timestamp timestamp=new Timestamp(System.currentTimeMillis());
            time2= new SimpleDateFormat("yyyy-MM-dd").format(timestamp).toString();
        }else {//根据日查
            //time2 = new SimpleDateFormat("yyyy-MM-dd").format(time);
            time2=time;
        }*/
        time2=time;
        //全部订单
        Page<PublicOrderPo> vo=new Page<PublicOrderPo>();
        vo.setCurrentPage(currentPage);
        vo=this.publicOrderService.selectmyfinance(time2,orderNumber, pname,vo);
        mv.addObject("list",vo);
        mv.addObject("orderNumber",orderNumber);
        mv.addObject("pname",pname);
        mv.addObject("time",time);
        return mv;
    }

    //修改状态
      @ResponseBody
    @RequestMapping("/updateStatus")
    public Object updateStatus(int id,int status){
        ModelAndView mv = null;
        mv = new ModelAndView("redirect:/Hotelm/allorder.do");
          Integer count= publicOrderService.updateStatus(id, status);
        Gson gson = new Gson();
        return gson.toJson(count);
    }


    @ResponseBody
    @RequestMapping("/updaDao")
    public ModelAndView updaDao(int id){
        ModelAndView mv = null;
        mv = new ModelAndView("redirect:/Hotelm/allorder.do");
        Timestamp d = new Timestamp(System.currentTimeMillis());
        publicOrderService.updateDao(id,d);
        return mv;
    }



    //添加订单
    @ResponseBody
    @RequestMapping("/addOrder")
    public Object add(PublicOrderPo orderPo) {
        Timestamp d = new Timestamp(System.currentTimeMillis());
        orderPo.setStatus(1);//已确认

        //判断是否到账
        if (orderPo.getIsdao()==1){
            orderPo.setDaotime(null);
        }else if (orderPo.getIsdao()==2){
            orderPo.setDaotime(d);
        }
        orderPo.setTime(d);
        Integer count=publicOrderService.insertAll(orderPo);
        Gson gson = new Gson();
        return gson.toJson(count);
    }











    ////////////////////////////////////共有////////////////////////////////////////////////////////////////////////////

    //验证订单号是否存在
    @ResponseBody
    @RequestMapping("codeNumberYZ")
    public Object codeNumberYZ(String orderNumber){
        Integer count=publicOrderService.YZ(orderNumber);
        Gson gson = new Gson();
        return gson.toJson(count);
    }


    //到账
    @ResponseBody
    @RequestMapping("isdao")
    public Object isdao(int id){
        Timestamp d = new Timestamp(System.currentTimeMillis());
        Integer count= publicOrderService.updateDao(id,d);
        Gson gson = new Gson();
        return gson.toJson(count);
    }


    @ResponseBody
    @RequestMapping("checkinDay")
    public Object checkinDay(OrderPo orderPo){
        String strn = new SimpleDateFormat("yyyy-MM-dd").format(orderPo.getCheckinTime());
        List<IndayVo> count=orderService.checkinDay(strn, orderPo.getRoomId());
        RoomSetPo roomSetPo=roomSetService.selectById(orderPo.getRoomId());
        int t=0;
        int ok=0;
        for (IndayVo i:count ) {
            t=t+i.getNumber();//现有住宿人
        }
        if (t<Integer.parseInt(roomSetPo.getRoomAmount())){//有床位
            if (orderPo.getCheckinNumber()<=t){//床位大于等于入住人数
                ok=1;
            }
        }
        Gson gson = new Gson();
        return gson.toJson(ok);
    }



    ////////////////////////////////////导出exxcel
   /* //财务报表
    @ResponseBody
    @RequestMapping("/excel")
    public void excel(String time,String orderNumber,String pname,Integer currentPage) {
        ModelAndView mv = null;
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        String time2=null;
       time2=time;
        FinancePo fp=new FinancePo();
        Page<PublicOrderPo> vo=new Page<PublicOrderPo>();
        List<FinancePo> fpl=new ArrayList<FinancePo>();
        double sumPHP=0d;
        double sumCNY=0d;
        double PHP=0d;
        double RMB=0d;
        //全部订单
        List<PublicOrderPo> list=publicOrderService.selectfinance(time2,orderNumber, pname,currentPage,vo.getPageSize());


        *//*Integer count=stayRegisterService.countAll();*//*
        //创建excel表的表头
        String[] headers = {"序号", "平台", "订单号", "酒店","房间Room", "旅客 ", "电话 phone", "入住时间checkin"
                , "退房时间", "入住人数", "价格"};
        //创建Excel工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表sheet
        HSSFSheet sheet = workbook.createSheet();

        //字体
        // 1.生成字体对象
        Font font = workbook.createFont();
        font.setFontHeightInPoints((short) 11);
        font.setFontName("宋体");

        // 2.生成样式对象
        CellStyle style = workbook.createCellStyle();
        style.setFont(font); // 调用字体样式对象
        style.setWrapText(true);//自动换行


        //创建第一行
        HSSFRow row = sheet.createRow(0);
        //定义一个单元格,相当于在第一行插入了三个单元格值分别是

        HSSFCell cell = null;
        row.setHeightInPoints(30);//目的是想把行高设置成20px

        //插入第一行数据
        for (int i = 0; i < headers.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(style);
        }
        int cou = 0;
        //追加数据
        HSSFRow nextrow = null;
        for (int i = 1; i <= list.size(); i++) {
            cou++;

            if (list.get(i - 1).getCurrency() == 1) {
               sumCNY=sumCNY+list.get(i - 1).getMoney();
            } else if (list.get(i - 1).getCurrency() == 2) {
                sumPHP=sumPHP+list.get(i - 1).getMoney();
            }

            if (list.get(i - 1).getCurrency() == 1) {
                if (list.get(i - 1).getIsdao() == 2) {
                    RMB=RMB+list.get(i - 1).getMoney();
                }
            } else if (list.get(i - 1).getCurrency() == 2) {
                if (list.get(i - 1).getIsdao() == 1) {
                    if (list.get(i - 1).getIsdao() == 2) {
                        PHP=PHP+list.get(i - 1).getMoney();
                    }
                }
            }


            nextrow = sheet.createRow(i);
            HSSFCell cell2 = nextrow.createCell(0);
            // 3.单元格应用样式
            cell2.setCellStyle(style);
            cell2.setCellValue(i);
            cell2 = nextrow.createCell(1);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getPaltform());
            cell2 = nextrow.createCell(2);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getOrderNumber());
            cell2 = nextrow.createCell(3);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getHotelm());
            cell2 = nextrow.createCell(4);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getRoomNumber());
            cell2 = nextrow.createCell(5);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getPname());
            cell2 = nextrow.createCell(6);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getPhone());
            cell2 = nextrow.createCell(7);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getCheckintime());
            cell2 = nextrow.createCell(8);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getCheckouttime());
            cell2 = nextrow.createCell(9);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getCheckinNumber());
            cell2 = nextrow.createCell(10);
            cell2.setCellStyle(style);
            if (list.get(i - 1).getCurrency() == 1) {
                cell2.setCellValue("￥" + list.get(i - 1).getMoney());
            } else if (list.get(i - 1).getCurrency() == 2) {
                cell2.setCellValue("₱" + list.get(i - 1).getMoney());
            }
            cell2 = nextrow.createCell(11);


            sheet.setColumnWidth(i, 25 * 256);
            if (cou == list.size()) {
                nextrow = sheet.createRow(list.size()+1);
                cell2 = nextrow.createCell(7);
                cell2.setCellStyle(style);
                cell2.setCellValue("合计PHP");
                cell2 = nextrow.createCell(8);
                cell2.setCellStyle(style);
                cell2.setCellValue(sumPHP);

                cell2 = nextrow.createCell(9);
                cell2.setCellStyle(style);
                cell2.setCellValue("合计RMB");
                cell2 = nextrow.createCell(10);
                cell2.setCellStyle(style);
                cell2.setCellValue(sumCNY);

                nextrow = sheet.createRow(list.size()+2);
                cell2 = nextrow.createCell(7);
                cell2.setCellStyle(style);
                cell2.setCellValue("到账PHP");
                cell2 = nextrow.createCell(8);
                cell2.setCellStyle(style);
                cell2.setCellValue(PHP);

                cell2 = nextrow.createCell(9);
                cell2.setCellStyle(style);
                cell2.setCellValue("到账RMB");
                cell2 = nextrow.createCell(10);
                cell2.setCellStyle(style);
                cell2.setCellValue(RMB);



                sheet.setColumnWidth(cou+4, 20 * 256);
                sheet.setColumnWidth(cou+5, 20 * 256);
                sheet.setColumnWidth(cou+6, 20 * 256);
            }

        }

        //创建一个文件
        File file=null;
        String name=getFileName("d:/hotelm/",time2+"财务报表.xls",0);
        file = new File(name);

        try {
            file.createNewFile();
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        //将内容存盘
        FileOutputStream stream;
        try {
            stream = FileUtils.openOutputStream(file);
            workbook.write(stream);
            stream.close();
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
       *//* mv=new ModelAndView("redirect:/Order/financial.do");
        return mv;*//*
       *//* Gson gson = new Gson();
        return gson.toJson(1);*//*
    }*/


    /**
     * 如果某个路径下已经存在了与要保存的文件名重复了，则在新的文件后面加（1）。。。。
     * @param paths
     * @param filename
     * @param num
     * @return
     */
    public static String getFileName(String paths, String filename, int num) {
        File file = null;
        String[] filenameArr = filename.split("\\.");
        int length = filenameArr.length;
        String filenameStr="";
        //此处的目的是为了避免文件名称含有“.”的文件名重复时，出错，我们必须保证是在最后一个“.”的前面加上“(2)”
        for(int i=0;i<=length-2;i++){
            filenameStr = filenameStr+ filenameArr[i]+".";
        }
        if (num > 0) {
            file = new File(paths + "\\" + filenameStr.substring(0, filenameStr.length()-1) + "(" + String.valueOf(num == 1 ? 2 : num) + ")." + filenameArr[filenameArr.length - 1]);
        } else {
            file = new File(paths + "\\" + filename);
        }

        if (file.exists()) {
            return getFileName(paths, filename, ++num);
        } else {
            if (num > 0) {
                return paths + "\\" + filenameStr.substring(0, filenameStr.length()-1) + "(" + String.valueOf(num == 1 ? 2 : num) + ")." + filenameArr[filenameArr.length - 1];
            } else {
                return paths + "\\" + filename;
            }
        }
    }

    //财务报表
    @ResponseBody
    @RequestMapping("/excel2")
    public Object excel(String time,String orderNumber,String pname,Integer currentPage) {
        ModelAndView mv = null;
        if (currentPage==null) {
            currentPage=1;
        }else if (currentPage==0) {
            currentPage=1;
        }
        String time2=null;
        time2=time;
        FinancePo fp=new FinancePo();
        Page<PublicOrderPo> vo=new Page<PublicOrderPo>();
        List<FinancePo> fpl=new ArrayList<FinancePo>();
        double sumPHP=0d;
        double sumCNY=0d;
        double PHP=0d;
        double RMB=0d;
        //全部订单
        List<PublicOrderPo> list=publicOrderService.selectfinance(time2,orderNumber, pname,currentPage,vo.getPageSize());

        Gson gson=new Gson();
        return gson.toJson(list);
/*

        *//*Integer count=stayRegisterService.countAll();*//*
        //创建excel表的表头
        String[] headers = {"序号", "平台", "订单号", "酒店","房间Room", "旅客 ", "电话 phone", "入住时间checkin"
                , "退房时间", "入住人数", "价格"};
        //创建Excel工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表sheet
        HSSFSheet sheet = workbook.createSheet();

        //字体
        // 1.生成字体对象
        Font font = workbook.createFont();
        font.setFontHeightInPoints((short) 11);
        font.setFontName("宋体");

        // 2.生成样式对象
        CellStyle style = workbook.createCellStyle();
        style.setFont(font); // 调用字体样式对象
        style.setWrapText(true);//自动换行


        //创建第一行
        HSSFRow row = sheet.createRow(0);
        //定义一个单元格,相当于在第一行插入了三个单元格值分别是

        HSSFCell cell = null;
        row.setHeightInPoints(30);//目的是想把行高设置成20px

        //插入第一行数据
        for (int i = 0; i < headers.length; i++) {
            cell = row.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(style);
        }
        int cou = 0;
        //追加数据
        HSSFRow nextrow = null;
        for (int i = 1; i <= list.size(); i++) {
            cou++;

            if (list.get(i - 1).getCurrency() == 1) {
                sumCNY=sumCNY+list.get(i - 1).getMoney();
            } else if (list.get(i - 1).getCurrency() == 2) {
                sumPHP=sumPHP+list.get(i - 1).getMoney();
            }

            if (list.get(i - 1).getCurrency() == 1) {
                if (list.get(i - 1).getIsdao() == 2) {
                    RMB=RMB+list.get(i - 1).getMoney();
                }
            } else if (list.get(i - 1).getCurrency() == 2) {
                if (list.get(i - 1).getIsdao() == 1) {
                    if (list.get(i - 1).getIsdao() == 2) {
                        PHP=PHP+list.get(i - 1).getMoney();
                    }
                }
            }


            nextrow = sheet.createRow(i);
            HSSFCell cell2 = nextrow.createCell(0);
            // 3.单元格应用样式
            cell2.setCellStyle(style);
            cell2.setCellValue(i);
            cell2 = nextrow.createCell(1);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getPaltform());
            cell2 = nextrow.createCell(2);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getOrderNumber());
            cell2 = nextrow.createCell(3);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getHotelm());
            cell2 = nextrow.createCell(4);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getRoomNumber());
            cell2 = nextrow.createCell(5);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getPname());
            cell2 = nextrow.createCell(6);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getPhone());
            cell2 = nextrow.createCell(7);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getCheckintime());
            cell2 = nextrow.createCell(8);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getCheckouttime());
            cell2 = nextrow.createCell(9);
            cell2.setCellStyle(style);
            cell2.setCellValue(list.get(i - 1).getCheckinNumber());
            cell2 = nextrow.createCell(10);
            cell2.setCellStyle(style);
            if (list.get(i - 1).getCurrency() == 1) {
                cell2.setCellValue("￥" + list.get(i - 1).getMoney());
            } else if (list.get(i - 1).getCurrency() == 2) {
                cell2.setCellValue("₱" + list.get(i - 1).getMoney());
            }
            cell2 = nextrow.createCell(11);


            sheet.setColumnWidth(i, 25 * 256);
            if (cou == list.size()) {
                nextrow = sheet.createRow(list.size()+1);
                cell2 = nextrow.createCell(7);
                cell2.setCellStyle(style);
                cell2.setCellValue("合计PHP");
                cell2 = nextrow.createCell(8);
                cell2.setCellStyle(style);
                cell2.setCellValue(sumPHP);

                cell2 = nextrow.createCell(9);
                cell2.setCellStyle(style);
                cell2.setCellValue("合计RMB");
                cell2 = nextrow.createCell(10);
                cell2.setCellStyle(style);
                cell2.setCellValue(sumCNY);

                nextrow = sheet.createRow(list.size()+2);
                cell2 = nextrow.createCell(7);
                cell2.setCellStyle(style);
                cell2.setCellValue("到账PHP");
                cell2 = nextrow.createCell(8);
                cell2.setCellStyle(style);
                cell2.setCellValue(PHP);

                cell2 = nextrow.createCell(9);
                cell2.setCellStyle(style);
                cell2.setCellValue("到账RMB");
                cell2 = nextrow.createCell(10);
                cell2.setCellStyle(style);
                cell2.setCellValue(RMB);



                sheet.setColumnWidth(cou+4, 20 * 256);
                sheet.setColumnWidth(cou+5, 20 * 256);
                sheet.setColumnWidth(cou+6, 20 * 256);
            }

        }

        //创建一个文件
        File file=null;
        String name=getFileName("d:/hotelm/",time2+"财务报表.xls",0);
        file = new File(name);

        try {
            file.createNewFile();
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        //将内容存盘
        FileOutputStream stream;
        try {
            stream = FileUtils.openOutputStream(file);
            workbook.write(stream);
            stream.close();
        } catch (IOException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }*/
       /* mv=new ModelAndView("redirect:/Order/financial.do");
        return mv;*/
       /* Gson gson = new Gson();
        return gson.toJson(1);*/
    }
}
