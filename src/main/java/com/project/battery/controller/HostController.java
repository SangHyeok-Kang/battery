/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.Lecture;
import com.project.battery.service.FileService;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author qntjd
 */
@Controller
@PropertySource("classpath:/system.properties")
@Slf4j
public class HostController {
    
    @Autowired
    private ServletContext ctx;
    @Autowired
    HttpSession session;
    @Autowired
    HikariConfiguration dbConfig;
    
    @Value("${file.text_image_folder}")
    private String text_image;
    @Value("${file.thumbnail_folder}")
    private String thumbnail;
    @Value("${file.resumeForm_folder}")
    private String resume;
    
    
    @GetMapping("/host-center")
    public String hostCentter(){
        return "host-center";
    }
    
    @GetMapping("/lecture/create_lecture")
    public String createLecture(){
        return "/lecture/create_lecture";
    }
    //, @RequestParam("text_image") MultipartFile text_image
    //신규 강의 입력
    @PostMapping("/lecture/insert_lecture.do")
    public String insertLecture(@RequestParam("thumbnail") MultipartFile thumbnail, HttpServletRequest request, @RequestParam("text_image") MultipartFile text_image,@RequestParam(name="resume",required=false) MultipartFile resume, RedirectAttributes attrs){
        Lecture lecture = new Lecture();
        //강의 객체로 정보 입력
        
        lecture.setTitle(request.getParameter("title"));
        lecture.setText(request.getParameter("text"));
        lecture.setPostcode(request.getParameter("postcode"));
        lecture.setAddress(request.getParameter("address"));
        lecture.setDetail(request.getParameter("detail"));
        lecture.setExtra(request.getParameter("extra"));
        lecture.setRec_dt(request.getParameter("rec_dt"));
        lecture.setRec_target(request.getParameter("recruitment"));
        lecture.setRec_num( Integer.parseInt(request.getParameter("people")));
        lecture.setDatelist(request.getParameter("datelist"));
        lecture.setKeyword(request.getParameter("keyword"));
        lecture.setPrice(request.getParameter("price"));
        if(request.getParameter("acceptance").equals("manual")){
            lecture.setAgree(1);
        }
        if(request.getParameter("recruit").equals("yes")){
            if(request.getParameter("recruit_t").equals("t_yes")){
                lecture.setTeacher(1);
                lecture.setTeacher_num(Integer.parseInt(request.getParameter("teacher_num")));
            }
            if(request.getParameter("recruit_s").equals("s_yes")){
                lecture.setStaffe(1);
                lecture.setStaffe_num(Integer.parseInt(request.getParameter("staffe_num")));
            }
            lecture.setQualification(request.getParameter("recruit_text"));
            //lecture.setResume(FileService.insertFolder(ctx.getRealPath(this.resume),resume, (String) session.getAttribute("host")));
        }
        lecture.setHost((String) session.getAttribute("host"));
        String[] path = {ctx.getRealPath(this.thumbnail),ctx.getRealPath(this.text_image),ctx.getRealPath(this.resume)};
        if(lecture.insertLecture(dbConfig, lecture,thumbnail,text_image,resume,path)){
           attrs.addFlashAttribute("msg", "강의 개설에 성공하였습니다");
        }else{
            attrs.addFlashAttribute("msg", "강의 개설에 실패하였습니다");
        }
        return "redirect:/host-center";
    }
}
