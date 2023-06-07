/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.dto.LectureDto;
import com.project.battery.dto.RegiClassDto;
import com.project.battery.dto.ReviewDto;
import com.project.battery.model.ChartModel;
import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.Lecture;
import com.project.battery.model.ReviewModel;
import com.project.battery.model.SearchAddress;
import com.project.battery.model.surveyModel;
import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
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
    @Value("${file.surveyResult_folder}")
    private String surveyResult_folder;
    
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
    public String hostLecture(@RequestParam("lecture") String lecid, Model model) throws SQLException{
        if(!lecid.equals((String)session.getAttribute("lecture")) || session.getAttribute("lecture") == null ){
            session.setAttribute("lecture", lecid);
        }
        
        /*리뷰 정보 불러오기*/
        ReviewModel review = new ReviewModel();
        List<ReviewDto> reviewList = review.getReviewList(dbConfig,lecid);
        
        /*강의 정보 불러오기*/
        Lecture lec = new Lecture(dbConfig);
        LectureDto lecDto = lec.SearchlecInfo(Integer.parseInt(lecid));
        String[] aryREC = lecDto.getRec_dt().split("%");
        String[] strAryDT;
        List<String> aryDT = new ArrayList<>();
        // 모집기간 포맷
        String rec = String.format("%s(%s) ~ %s(%s)", aryREC[0],aryREC[1],aryREC[2],aryREC[3]);
        
        // 강의 기간 포맷
        if(lecDto.getDate().contains("@")){
            strAryDT = lecDto.getDate().split("@");
            for(String str : strAryDT){
                String[] strSplit = str.split("%");
                aryDT.add(String.format("%s ~ %s(%s ~ %s)",strSplit[0],strSplit[1],strSplit[2],strSplit[3]));
            }
        }else{
            strAryDT = lecDto.getDate().split("%");
            aryDT.add(String.format("%s ~ %s(%s ~ %s)",strAryDT[0],strAryDT[1],strAryDT[2],strAryDT[3]));
        }
        SearchAddress manager = new SearchAddress(dbConfig);
        String[] juso = manager.checkAddress(Integer.parseInt(lecid));
        
        /*설문지 불러오기*/
        String basePath = ctx.getRealPath(survey_folder) + File.separator + (String) session.getAttribute("host");
        String basePath1 = ctx.getRealPath(surveyInfo_folder);

        surveyModel survey = new surveyModel();
        String[] searchSurvey = survey.searchSurvey((String) session.getAttribute("host"), basePath1, Integer.parseInt(lecid));

        boolean[] isStart = survey.checkIfStart(searchSurvey);
//        for (int i = 0; i < isStart.length; i++) {
//            System.out.println("isStart =" + isStart[i]);
//        }
        String[] surveyList = survey.surveyList(basePath);
        


        /*신청자 정보 불러오기*/
        List<RegiClassDto> regilist = lec.getRegiList(Integer.parseInt(lecid));
        
       
        /*그래프 불러오기*/
        // 날짜별 신청 인원 
        ChartModel chart = new ChartModel();
        List<Object[]> chartDataList = chart.chart(dbConfig, Integer.parseInt((String) session.getAttribute("lecture")), aryDT);
        
        List<String> dates = new ArrayList<>();
        List<String> counts = new ArrayList<>();
        for (Object[] chartData : chartDataList) {
            String date = (String) chartData[0];
            int count = (int) chartData[1];
            dates.add("'" + date + "'"); 
            counts.add("'" + count + "'");
        }
        int rec_num =  lecDto.getRec_num();
        
        // 설문별 설문 참여 인원 
        String basePath2 = ctx.getRealPath(surveyResult_folder) + File.separator + (String) session.getAttribute("host") + File.separator + (String) session.getAttribute("lecture");
        // 해당 강의실에 등록된 설문 정보 가져옴
        String[] searchSurveyList = survey.searchSurvey((String) session.getAttribute("host"), basePath1, Integer.parseInt((String) session.getAttribute("lecture")));
        
        List<Object[]> surveyDataList = chart.surveyChart(basePath2, searchSurveyList);
        
        List<String> surveynames = new ArrayList<>();
        List<String> rowcounts = new ArrayList<>();
    
        for (Object[] chartData : surveyDataList) {
            String surveyname = (String) chartData[0];
            int rowcount = (int) chartData[1];
            surveynames.add("'" + surveyname + "'"); 
            rowcounts.add("'" + rowcount + "'");
        }
        

       model.addAttribute("regiList",regilist);

        model.addAttribute("reviewList",reviewList);
        model.addAttribute("juso",juso);
        model.addAttribute("surveyList", surveyList);
        model.addAttribute("searchSurvey", searchSurvey);
        model.addAttribute("rec_date", rec);
        model.addAttribute("lec_date", aryDT);
        model.addAttribute("isStart", isStart);
        model.addAttribute("lecture",lecDto);
        model.addAttribute("dates", dates);
        model.addAttribute("counts", counts);
        model.addAttribute("rec_num", rec_num);
        model.addAttribute("surveynames", surveynames);
        model.addAttribute("rowcounts", rowcounts);
        return "host-center/lecture";
    }
    
    //신규 강의 입력
    @PostMapping("host-center/insert_lecture.do")
    public String insertLecture(MultipartHttpServletRequest request, RedirectAttributes attrs){
        LectureDto lecture = new LectureDto();
        
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
            lecture.setAgree("1");
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
    
    @GetMapping("host-center/accept.do")
    public String accpt(@RequestParam("str") String str, RedirectAttributes attrs){
        String accept;
        if(str.split("-")[0].equals("accept")){
            accept = "동의";
        }else{
            accept = "거절";
        }
        if(new Lecture(dbConfig).accept(str.split("-")[0],str.split("-")[1])){
            attrs.addFlashAttribute("msg",String.format("강의 신청에 %s하였습니다.", accept));
        }else{
            attrs.addFlashAttribute("msg","강의 신청 확인에 실패하였습니다.");
        }
        return String.format("redirect:/host-center/lecture?lecture=%s", (String)session.getAttribute("lecture")) ;
    }
}
