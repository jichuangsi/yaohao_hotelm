package com.gx.web;

import com.gx.po.AnserPo;
import com.gx.service.*;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FilenameFilter;
import java.sql.Timestamp;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class TimerTask {

    @Autowired
    private AnserService anserService;


    //定时清理多余图片或者视频0 */1 * * * ?
   /* @Scheduled(cron = "0 0 1 * * ?")*/
    @Scheduled(cron = "0 0 0 ? * MON")
    public void payTime(){
        Set<String> imgtypes=new HashSet<String>();
        // images
        imgtypes.add("jpg");
        imgtypes.add("png");
        imgtypes.add("gif");
        imgtypes.add("tif");
        imgtypes.add("bmp");
        Set<String> videotypes=new HashSet<String>();
        //视频或音频类
        videotypes.add("avi");
        videotypes.add("mpg");
        videotypes.add("mov");
        videotypes.add("mp4");
        String img = "";
        Pattern p_image;
        Matcher m_image;
        String regEx_img="";
        Set<String> paths=new HashSet<String>();
        Set<String> videopaths=new HashSet<String>();
        List<String> anserPo=anserService.allAnser();
        for (String a:anserPo ) {

           regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
            p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
            m_image = p_image.matcher(a);
            while (m_image.find()) {
                // 得到<img />数据
                img = m_image.group();
                // 匹配<img>中的src数据
                Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
                while (m.find()) {
                    String imgss=m.group(1);
                    Integer index=imgss.lastIndexOf("/");
                    String after=imgss.substring(index+1,imgss.length());
                    paths.add(after);
                }
            }

           regEx_img = "<video.*src\\s*=\\s*(.*?)[^>]*?>";
            p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
            m_image = p_image.matcher(a);
            while (m_image.find()) {
                // 得到<img />数据
                img = m_image.group();
                // 匹配<img>中的src数据
                Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
                while (m.find()) {
                    String imgss=m.group(1);
                    Integer index=imgss.lastIndexOf("/");
                    String after=imgss.substring(index+1,imgss.length());
                    videopaths.add(after);
                }
            }
        }
        System.out.println(imgname());
        System.out.println(videoname());
        for (String s:imgname()) {//循环磁盘中的图片文件
            Integer type = s.lastIndexOf(".");
            String imgtype = s.toString().substring(type + 1, s.length());
            String pathUrl = System.getProperty("bookdir");
            if (imgtypes.contains(imgtype)) {//判断是否是图片
                if (paths.contains(s)==false) {//判断图片是否多余（本地图片在数据库中不存在）
                    String url = pathUrl.substring(0, pathUrl.length() - 1) + "/images/" + s;
                    String path2 = url.toString().replace("/", "\\");
                    File file = new File(path2);
                    if (file.exists()) {
                        file.delete();//删除多余图片
                    }
                }
            }
        }
        for (String s:videoname()) {//循环磁盘中的视频文件
            Integer type = s.lastIndexOf(".");
            String imgtype = s.toString().substring(type + 1, s.length());
            String pathUrl = System.getProperty("bookdir");
            if (videotypes.contains(imgtype)) {//是否为视频
                if (videopaths.contains(s)==false) {//判断视频是否多余（本地视频在数据库中不存在）
                    String url = pathUrl.substring(0, pathUrl.length() - 1) + "/upload/" + s;
                    String path2 = url.toString().replace("/", "\\");
                    File file = new File(path2);
                    if (file.exists()) {
                        file.delete();
                    }
                }
            }
        }
    }

    public List<String> imgname(){
        String pathUrl=System.getProperty("bookdir");
        List<String> names=new ArrayList<String>();
        /*new filenameFilter接口，重写接口内部的一个方法*/
        String path=pathUrl.substring(0,pathUrl.length()-1)+"/images";
        File file=new File(path);
        File[] list=file.listFiles();
        for(int i=0;i<list.length;i++) {
            if (list[i].isFile()) {//判断是文件
                /*
                //这里面用了递归的算法
                getAllFilePath(files[i]);*/
                names.add(list[i].getName());//保存所i有文件
            } else {
            }
        }

    return names;
    }

    public List<String> videoname(){
        String pathUrl=System.getProperty("bookdir");
        List<String> names=new ArrayList<String>();
        /*new filenameFilter接口，重写接口内部的一个方法*/
        String path=pathUrl.substring(0,pathUrl.length()-1)+"/upload";
        File file=new File(path);
        File[] list=file.listFiles();
        for(int i=0;i<list.length;i++) {
            if (list[i].isFile()) {//判断是文件
                /*
                //这里面用了递归的算法
                getAllFilePath(files[i]);*/
                names.add(list[i].getName());//保存所i有文件
            } else {
            }
        }

        return names;
    }

    private  Set<String> names(String titles){
        Set<String> pics = new HashSet<String>();
        String img = "";
        Pattern p_image;
        Matcher m_image;
        String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
        p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(titles);
        while (m_image.find()) {
            // 得到<img />数据
            img = m_image.group();
            // 匹配<img>中的src数据
            Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
            while (m.find()) {
                pics.add(m.group(1));
            }
        }
        return pics;
    }

    private  Set<String> videonames(String titles){
        Set<String> pics = new HashSet<String>();
        String img = "";
        Pattern p_image;
        Matcher m_image;
        String regEx_img = "<source.*src\\s*=\\s*(.*?)[^>]*?>";
        p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
        m_image = p_image.matcher(titles);
        while (m_image.find()) {
            // 得到<img />数据
            img = m_image.group();
            // 匹配<img>中的src数据
            Matcher m = Pattern.compile("source\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
            while (m.find()) {
                pics.add(m.group(1));
            }
        }
        return pics;
    }
}
