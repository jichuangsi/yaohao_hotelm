package com.gx.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class TimeTransformation {
    /**
     * 时间戳转换成日期格式字符串
     * @param seconds 精确到秒的字符串
     * @param
     * @return
     */
    public static String timeStamp2Date(Long seconds,String format) {
        if(seconds == 0){
            return "";
        }
        if(format == null || format.isEmpty()){
            format = "yyyy-MM-dd HH:mm:ss";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date(seconds*1000));
    }

    // 计算两个日期相隔的天数
    public static int nDaysBetweenTwoDate(String firstString, String secondString) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date firstDate = null;
        Date secondDate = null;
        try {
            firstDate = df.parse(firstString);
            secondDate = df.parse(secondString);
        } catch (Exception e) {
            // 日期型字符串格式错误
            System.out.println("日期型字符串格式错误");
        }
        int nDay = (int) ((secondDate.getTime() - firstDate.getTime()) / (24 * 60 * 60 * 1000));
        return nDay;
    }

    /**
     * String 转timestamp
     * @param str
     * @return
     */
    public  static Timestamp stringTimestamp(String str){
        Timestamp time = Timestamp.valueOf(str+" 00:00:00");
        return time;
    }


  private static  SimpleDateFormat sdfs = new SimpleDateFormat("yyyy-MM-dd");
    private static  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

    public static List<String> getMonthDay(String date)throws Exception {
        Date date2 = sdfs.parse(date);
        List<String> list = getMonthFullDay(date2);
        List<String> listDay = new ArrayList<String>();
        for (String date1 : list) {
            listDay.add(date1.substring(8, 10));
        }
        return listDay;
    }
    public static List<String> getMonthFullDay(Date date) throws Exception{
        List<String> fullDayList = new ArrayList<String>();
        String dateStr = sdfs.format(date);//format()方法将Date转换成指定格式的String
        int year = Integer.parseInt(dateStr.substring(0, 4));//年
        int month = Integer.parseInt(dateStr.substring(5, 7));//月
        Calendar cal = Calendar.getInstance();// 获得当前日期对象
        cal.clear();// 清除信息

        cal.setTime(date);
        cal.add(Calendar.DATE,0);
        int count = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        for (int j = 0; j <= (count - 1); ) {
            System.out.println(cal.getTime());
            System.out.println(sdf.format(cal.getTime()));
           /* if (!sdf.format(cal.getTime()).equals(getLastDay(year, month)))//判断是否同年同月
                break;*/
            cal.add(Calendar.DATE,  j == 0 ? +0 : +1);
            j++;
            System.out.println(sdf.format(cal.getTime()));
            fullDayList.add(sdfs.format(cal.getTime()));
        }
        return fullDayList;
    }
    public static String getLastDay(int year, int month) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, year);
        cal.set(Calendar.MONTH, month);
        cal.set(Calendar.DAY_OF_MONTH, 0);
        return sdf.format(cal.getTime());
    }
}
