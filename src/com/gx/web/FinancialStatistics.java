package com.gx.web;

import com.gx.page.Page;
import com.gx.po.StayRegisterPo;
import com.gx.service.StayRegisterService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/FinancialStatistics")
public class FinancialStatistics {
	
	@Autowired
	private StayRegisterService stayRegisterService;
	
	@RequestMapping("/tolist")
	public ModelAndView tolist(String datemin, String datemax, Integer currentPage){
		ModelAndView mv=null;
		int chuZuFangJianShu=0;
		int zhuSuRenShu=0;
		double xiaoFeiJinE=0;
		double accountsReceived=0;
		double fxiaoFeiJinE=0;
		double faccountsReceived=0;
		
		if (currentPage==null) {
			currentPage=1;
		}else if (currentPage==0) {
			currentPage=1;
		}
		mv=new ModelAndView("/financialstatistics/financialstatistics");
		Page<StayRegisterPo> vo=new Page<StayRegisterPo>();
		vo.setCurrentPage(currentPage);
		
		if (datemin=="" || datemax=="" || datemin==null || datemax==null) {
			List<StayRegisterPo> listJinE=this.stayRegisterService.selectPayJingJianBanNot();
			for (int i = 0; i < listJinE.size(); i++) {
				chuZuFangJianShu++;
				accountsReceived+=listJinE.get(i).getAccountsreceivable();//已到账人民币
			}
			List<StayRegisterPo> flistJinE=this.stayRegisterService.selectPayJingJianBanNotf();
			for (int i = 0; i < flistJinE.size(); i++) {
				chuZuFangJianShu++;
				faccountsReceived+=flistJinE.get(i).getAccountsreceivable();//已到账菲律宾币
			}
			
			List<StayRegisterPo> listRenShu=this.stayRegisterService.selectPayStayNumberNot();
			for (int i = 0; i < listRenShu.size(); i++) {
				zhuSuRenShu++;//住店人数
			}
			
			List<StayRegisterPo> listXiaoFei=this.stayRegisterService.selectPayXiaoFeiNot();
			for (int i = 0; i < listXiaoFei.size(); i++) {
				xiaoFeiJinE+=listXiaoFei.get(i).getAccountsreceivable();//总账人民币
			}
			List<StayRegisterPo> flistXiaoFei=this.stayRegisterService.selectPayXiaoFeiNotf();
			for (int i = 0; i < flistXiaoFei.size(); i++) {
				fxiaoFeiJinE+=flistXiaoFei.get(i).getAccountsreceivable();//总账菲律宾币
			}
			vo=this.stayRegisterService.pageFuzzyselectFour(vo);
		}else {
			String dateminString=datemin+" 00:00:00";
		    String datemaxString=datemax+" 23:59:59";
		    Timestamp min=Timestamp.valueOf(dateminString);
		    Timestamp max=Timestamp.valueOf(datemaxString);
			
			List<StayRegisterPo> listJinE=this.stayRegisterService.selectPayJingJianBan(min,max);
			for (int i = 0; i < listJinE.size(); i++) {
				chuZuFangJianShu++;
				accountsReceived+=listJinE.get(i).getAccountsreceivable();//已到账人民币
			}
			List<StayRegisterPo> flistJinE=this.stayRegisterService.selectPayJingJianBanf(min,max);
			for (int i = 0; i < flistJinE.size(); i++) {
				chuZuFangJianShu++;
				faccountsReceived+=flistJinE.get(i).getAccountsreceivable();//已到账菲律宾币
			}
			List<StayRegisterPo> listRenShu=this.stayRegisterService.selectPayStayNumber(min,max);
			for (int i = 0; i < listRenShu.size(); i++) {
				zhuSuRenShu++;//住店人数
			}
			
			List<StayRegisterPo> listXiaoFei=this.stayRegisterService.selectPayXiaoFei(min,max);
			for (int i = 0; i < listXiaoFei.size(); i++) {
				xiaoFeiJinE+=listXiaoFei.get(i).getAccountsreceivable();//总账
			}
			List<StayRegisterPo> flistXiaoFei=this.stayRegisterService.selectPayXiaoFeif(min,max);
			for (int i = 0; i < flistXiaoFei.size(); i++) {
				fxiaoFeiJinE+=flistXiaoFei.get(i).getAccountsreceivable();//总账
			}
			vo=this.stayRegisterService.pageFuzzyselectFive(min, max, vo);
		}
		mv.addObject("list",vo);
		mv.addObject("chuZuFangJianShu",chuZuFangJianShu);
		mv.addObject("zhuSuRenShu",zhuSuRenShu);
		mv.addObject("xiaoFeiJinE",xiaoFeiJinE);
		mv.addObject("accountsReceived",accountsReceived);
		mv.addObject("unpaidAccounts",xiaoFeiJinE-accountsReceived);
		mv.addObject("fxiaoFeiJinE",fxiaoFeiJinE);
		mv.addObject("faccountsReceived",faccountsReceived);
		mv.addObject("funpaidAccounts",fxiaoFeiJinE-faccountsReceived);
		mv.addObject("min",datemin);
		mv.addObject("max",datemax);
		return mv;
	}
	
	@RequestMapping("/toinformation")
	public ModelAndView toinformation(Integer id, Integer stayregisterdetailsId, String min, String max,Timestamp registerTime){
		ModelAndView mv=null;
		double zhuSuFei=0;
		double huanFangFei=0;
		double qiTaXiaoFei=0;
		double yaJin=0;
		double zongFeiYong=0;
		List<StayRegisterPo> listDeposit=stayRegisterService.selectDepositById(id);
		List<StayRegisterPo> listXiaoFei=stayRegisterService.selectXiaoFeiMingXi(id);
		List<StayRegisterPo> list=stayRegisterService.selectAllInformation(stayregisterdetailsId);
		StayRegisterPo stay=stayRegisterService.selectByStayId(id);
		for (int i = 0; i < listDeposit.size(); i++) {
			yaJin+=listDeposit.get(i).getDeposit();
		}
		for (int i = 0; i < listXiaoFei.size(); i++) {
			qiTaXiaoFei+=listXiaoFei.get(i).getConsumptionMoney();
		}
		zongFeiYong=list.get(0).getSumConst();
		huanFangFei=list.get(0).getChangRoomMoney();
		zhuSuFei=zongFeiYong-huanFangFei-qiTaXiaoFei;
		mv=new ModelAndView("/financialstatistics/particulars");
		mv.addObject("zhuSuFei",zhuSuFei);
		mv.addObject("qiTaXiaoFei",qiTaXiaoFei);
		mv.addObject("yaJin",yaJin);
		mv.addObject("list",list);
		mv.addObject("id",id);
		mv.addObject("listDeposit",listDeposit);
		mv.addObject("listXiaoFei",listXiaoFei);
		mv.addObject("stay",stay);
		mv.addObject("min",min);
		mv.addObject("max",max);
		return mv;
	}
	@RequestMapping("/confirmReceipt")
	public  ModelAndView confirmReceipt(Integer id,Integer isdao){
		ModelAndView mv=null;
		mv=new ModelAndView("redirect:/FinancialStatistics/tolist.do");
		stayRegisterService.confirmReceipt(id,isdao);
		return mv;
	}


	/**
	 * 用于导出excel的查询结果
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/export.do",method = RequestMethod.GET)
	@ResponseBody
	public void export(HttpServletRequest request, HttpServletResponse response,String datemin, String datemax)throws UnsupportedEncodingException {

		ModelAndView mv=null;
		//查询用户表的全部数据
		int chuZuFangJianShu = 0;
		int zhuSuRenShu = 0;
		double xiaoFeiJinE = 0;
		double accountsReceived = 0;
		double fxiaoFeiJinE = 0;
		double faccountsReceived = 0;
		List<StayRegisterPo> list = null;
		Integer count = 0;
		if (datemin == "" || datemax == "" || datemin == null || datemax == null) {
			List<StayRegisterPo> listJinE = this.stayRegisterService.selectPayJingJianBanNot();
			for (int i = 0; i < listJinE.size(); i++) {
				chuZuFangJianShu++;
				accountsReceived += listJinE.get(i).getAccountsreceivable();//已到账人民币
			}
			List<StayRegisterPo> flistJinE = this.stayRegisterService.selectPayJingJianBanNotf();
			for (int i = 0; i < flistJinE.size(); i++) {
				chuZuFangJianShu++;
				faccountsReceived += flistJinE.get(i).getAccountsreceivable();//已到账菲律宾币
			}

			List<StayRegisterPo> listRenShu = this.stayRegisterService.selectPayStayNumberNot();
			for (int i = 0; i < listRenShu.size(); i++) {
				zhuSuRenShu++;//住店人数
			}

			List<StayRegisterPo> listXiaoFei = this.stayRegisterService.selectPayXiaoFeiNot();
			for (int i = 0; i < listXiaoFei.size(); i++) {
				xiaoFeiJinE += listXiaoFei.get(i).getAccountsreceivable();//总账人民币
			}
			List<StayRegisterPo> flistXiaoFei = this.stayRegisterService.selectPayXiaoFeiNotf();
			for (int i = 0; i < flistXiaoFei.size(); i++) {
				fxiaoFeiJinE += flistXiaoFei.get(i).getAccountsreceivable();//总账菲律宾币
			}
			list = this.stayRegisterService.fuzzyselectAll();
			//查询用户表有多少行记录
			count = stayRegisterService.countAll();
		} else {
			String dateminString = datemin + " 00:00:00";
			String datemaxString = datemax + " 23:59:59";
			Timestamp min = Timestamp.valueOf(dateminString);
			Timestamp max = Timestamp.valueOf(datemaxString);

			List<StayRegisterPo> listJinE = this.stayRegisterService.selectPayJingJianBan(min, max);
			for (int i = 0; i < listJinE.size(); i++) {
				chuZuFangJianShu++;
				accountsReceived += listJinE.get(i).getAccountsreceivable();//已到账人民币
			}
			List<StayRegisterPo> flistJinE = this.stayRegisterService.selectPayJingJianBanf(min, max);
			for (int i = 0; i < flistJinE.size(); i++) {
				chuZuFangJianShu++;
				faccountsReceived += flistJinE.get(i).getAccountsreceivable();//已到账菲律宾币
			}
			List<StayRegisterPo> listRenShu = this.stayRegisterService.selectPayStayNumber(min, max);
			for (int i = 0; i < listRenShu.size(); i++) {
				zhuSuRenShu++;//住店人数
			}

			List<StayRegisterPo> listXiaoFei = this.stayRegisterService.selectPayXiaoFei(min, max);
			for (int i = 0; i < listXiaoFei.size(); i++) {
				xiaoFeiJinE += listXiaoFei.get(i).getAccountsreceivable();//总账
			}
			List<StayRegisterPo> flistXiaoFei = this.stayRegisterService.selectPayXiaoFeif(min, max);
			for (int i = 0; i < flistXiaoFei.size(); i++) {
				fxiaoFeiJinE += flistXiaoFei.get(i).getAccountsreceivable();//总账
			}
			list = this.stayRegisterService.fuzzyselectAllTwo(min, max);
			//查询用户表有多少行记录
			count = stayRegisterService.countAllTwo(min, max);
		}

		//二、 数据转成excel
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-download");
		String fileName = "财务报表.xls";
		 if (datemin != "" || datemax != "" || datemin != null || datemax != null){
			fileName=datemin+"-"+datemax+"财务报表.xls";
		}

		fileName = URLEncoder.encode(fileName, "UTF-8");
		response.addHeader("Content-Disposition", "attachment;filename=" + fileName);


		/*Integer count=stayRegisterService.countAll();*/
		//创建excel表的表头
		String[] headers = {"供应商", "房间号", "平台", "订单号", "应收帐", "是否到账", "到账时间"};
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
		// "供应商", "房间号", "平台","订单号","应收帐","是否到账","到账时间
		HSSFCell cell = null;
		row.setHeightInPoints(20);//目的是想把行高设置成20px

		//插入第一行数据
		for (int i = 0; i < headers.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(style);
		}
		int cou = 0;
		//追加数据
		HSSFRow nextrow = null;
		if (list.size()>=1){
			for (int i = 1; i <=count; i++) {
				cou++;
				nextrow = sheet.createRow(i);
				HSSFCell cell2 = nextrow.createCell(0);
				// 3.单元格应用样式
				cell2.setCellStyle(style);
				cell2.setCellValue(list.get(i - 1).getSupplierName());
				cell2 = nextrow.createCell(1);
				cell2.setCellStyle(style);
				cell2.setCellValue(list.get(i - 1).getRoomNumber());
				cell2 = nextrow.createCell(2);
				cell2.setCellStyle(style);
				cell2.setCellValue(list.get(i - 1).getPlatformName());
				cell2 = nextrow.createCell(3);
				cell2.setCellStyle(style);
				cell2.setCellValue(list.get(i - 1).getCodeNumber());
				/*cell2 = nextrow.createCell(4);
				cell2.setCellStyle(style);
				cell2.setCellValue(list.get(i - 1).getPassengerName());*/
				cell2 = nextrow.createCell(4);
				cell2.setCellStyle(style);
				if (list.get(i - 1).getCurrency() == 1) {
					cell2.setCellValue("￥" + list.get(i - 1).getAccountsreceivable());
				} else if (list.get(i - 1).getCurrency() == 2) {
					cell2.setCellValue("₱" + list.get(i - 1).getAccountsreceivable());
				}
				cell2 = nextrow.createCell(5);
				cell2.setCellStyle(style);
				if (list.get(i - 1).getIsdao() == 1) {
					cell2.setCellValue("否");
				} else if (list.get(i - 1).getIsdao() == 2) {
					cell2.setCellValue("是");
				}
				cell2 = nextrow.createCell(6);
				cell2.setCellStyle(style);
				String tsStr = "";
				Timestamp ts = list.get(i - 1).getPaymentdate();
				if (ts != null) {
					try {
						tsStr = ts.toString();
					} catch (Exception e) {
						e.printStackTrace();
					}
					cell2.setCellValue(tsStr);
				}
				sheet.setColumnWidth(i, 25 * 256);
				if (cou == count) {
					nextrow = sheet.createRow(count+3);
					cell2 = nextrow.createCell(4);
					cell2.setCellStyle(style);
					cell2.setCellValue("应收账");
					cell2 = nextrow.createCell(5);
					cell2.setCellStyle(style);
					cell2.setCellValue("已收");
					cell2 = nextrow.createCell(6);
					cell2.setCellStyle(style);
					cell2.setCellValue( "未收");

					nextrow = sheet.createRow(count+4);
					cell2 = nextrow.createCell(4);
					cell2.setCellStyle(style);
					cell2.setCellValue("￥" + xiaoFeiJinE);
					cell2 = nextrow.createCell(5);
					cell2.setCellStyle(style);
					cell2.setCellValue("￥" + accountsReceived);
					cell2 = nextrow.createCell(6);
					cell2.setCellStyle(style);
					cell2.setCellValue("￥" + (xiaoFeiJinE - accountsReceived));

					nextrow = sheet.createRow(count+5);
					cell2 = nextrow.createCell(4);
					cell2.setCellStyle(style);
					cell2.setCellValue("₱" + fxiaoFeiJinE);
					cell2 = nextrow.createCell(5);
					cell2.setCellStyle(style);
					cell2.setCellValue("₱" + faccountsReceived);
					cell2 = nextrow.createCell(6);
					cell2.setCellStyle(style);
					cell2.setCellValue("₱" + (fxiaoFeiJinE - faccountsReceived));
					sheet.setColumnWidth(cou+4, 20 * 256);
					sheet.setColumnWidth(cou+5, 20 * 256);
					sheet.setColumnWidth(cou+6, 20 * 256);
				}

			}
		}

		try {
			OutputStream out = response.getOutputStream();
			workbook.write(out);
			out.close();
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}


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

}
