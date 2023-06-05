/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.dto.LectureDto;
import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.Lecture;
import com.project.battery.model.surveyModel;
import java.io.File;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
    @Value("${file.survey_folder}")
    private String survey_folder;
    @Value("${file.surveyInfo_folder}")
    private String surveyInfo_folder;
    
    @GetMapping("host-center")
    public String hostCentter(Model model){
        Lecture lec = new Lecture(dbConfig);
        List<LectureDto> leclist = lec.getCreateLectureList((String) session.getAttribute("host"),"start");
        

        model.addAttribute("startList",leclist);
        return "host-center/index";
    }
    
    @GetMapping("host-center/create_lecture")
    public String createLecture(){
        return "host-center/create_lecture";
    }
    
    @GetMapping("host-center/lecture")
    public String hostLecture(@RequestParam("lecture") String lecid, Model model){
        if(!lecid.equals((String)session.getAttribute("lecture")) || session.getAttribute("lecture") == null ){
            session.setAttribute("lecture", lecid);
        }
        Lecture lec = new Lecture(dbConfig);
        LectureDto lecDto = lec.getHostLecture(Integer.parseInt(lecid));
        String basePath = ctx.getRealPath(survey_folder) + File.separator + (String) session.getAttribute("host");
        String basePath1 = ctx.getRealPath(surveyInfo_folder);

        surveyModel survey = new surveyModel();
        String[] searchSurvey = survey.searchSurvey(basePath, (String) session.getAttribute("host"), basePath1, Integer.parseInt(lecid));

        boolean[] isStart = survey.checkIfStart(searchSurvey, (String) session.getAttribute("host"));
//        for (int i = 0; i < isStart.length; i++) {
//            System.out.println("isStart =" + isStart[i]);
//        }
        String[] surveyList = survey.surveyList(basePath);

        model.addAttribute("surveyList", surveyList);
        model.addAttribute("searchSurvey", searchSurvey);
        model.addAttribute("isStart", isStart);
        model.addAttribute("lecture",lecDto);
        return "host-center/lecture";
    }
    
    //신규 강의 입력
    @PostMapping("host-center/insert_lecture.do")
    public String insertLecture(MultipartHttpServletRequest request, RedirectAttributes attrs){
        LectureDto lecture = new LectureDto();
        System.out.println("yes");
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
        lecture.setDate(request.getParameter("datelist"));
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
            lecture.setQual(request.getParameter("recruit_text"));
        }
        
        lecture.setHost((String) session.getAttribute("host"));
        String[] path = {ctx.getRealPath(this.thumbnail),ctx.getRealPath(this.text_image),ctx.getRealPath(this.resume)};
        if(new Lecture().insertLecture(dbConfig, lecture,request.getFile("thumbnail"),request.getFile("text_image"),request.getFile("resume"),path)){
           attrs.addFlashAttribute("msg", "강의 개설에 성공하였습니다");
        }else{
            attrs.addFlashAttribute("msg", "강의 개설에 실패하였습니다");
        }
        return "redirect:/host-center/";
    }
}
