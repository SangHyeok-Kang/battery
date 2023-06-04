/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.model.surveyModel;
import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author parkchaebin
 */
@Controller
@Slf4j
public class surveyController {

    @Value("${file.survey_folder}")
    private String survey_folder;

    @Value("${file.surveyResult_folder}")
    private String surveyResult_folder;

    @Value("${file.surveyInfo_folder}")
    private String surveyInfo_folder;

    @Autowired
    private ServletContext ctx;
    
    @Autowired
    private HttpSession session;
    
    // 생성한 설문 리스트
    @GetMapping("host-center/survey/surveymanager")
    public String surveyList(Model model, HttpServletRequest request) {

        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        
        String basePath = ctx.getRealPath(survey_folder) + File.separator + (String) session.getAttribute("business_id");
        String basePath1 = ctx.getRealPath(surveyInfo_folder);
        surveyModel survey = new surveyModel();
        String[] surveyList = survey.surveyList(basePath);
        String surveyName = request.getParameter("surveyName");
        // 생성한 설문이 강의에 등록되었는지 확인 (강의에 등록된 설문이면 삭제 버튼 비활성화)
        boolean[] isChecked = survey.checkIf(basePath1, surveyList, (String) session.getAttribute("business_id"));
//        for(int i=0; i<isChecked.length; i++) {
//           System.out.println("isChecked =====" + isChecked[i]);
//        }
        model.addAttribute("surveyList", surveyList);
        model.addAttribute("isChecked", isChecked);

        return "host-center/survey/surveymanager";
    }
    
    @GetMapping("host-center/survey/createSurvey")
    public String createSurvey() {
        return "host-center/survey/createSurvey";
    }

    // 생성한 설문 삭제 
    @PostMapping("host-center/survey/deleteSurvey")
    public String deleteSurvey(Model model, @RequestParam String surveyName, RedirectAttributes attrs) {

        String business_id = "manager";
        session.setAttribute("business_id", business_id);
//        int lectureid = 1234;
//        session.setAttribute("lectureid", lectureid);
//        String userid = "test";
//        session.setAttribute("userid", userid);
        
        log.debug("deleteSurvey called...");

        String basePath = ctx.getRealPath(survey_folder) + File.separator + (String) session.getAttribute("business_id");
    
        
        surveyModel survey = new surveyModel();
        boolean deleteSuccess = survey.deleteSurvey(surveyName, basePath);

        if (deleteSuccess) {
            attrs.addFlashAttribute("msg", "설문 삭제 완료하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "설문 삭제 실패하였습니다.");
        }
        return "redirect:/host-center/survey/surveymanager";
    }

    // 생성한 설문 다운
    @PostMapping("host-center/survey/downloadSurvey")
    public String downloadSurvey(Model model, @RequestParam String surveyName, HttpServletResponse response) throws IOException {

        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        
        log.debug("downloadSurvey called...");

        String basePath = ctx.getRealPath(survey_folder) + File.separator + (String) session.getAttribute("business_id");

        surveyModel survey = new surveyModel();
        survey.downloadSurvey(surveyName, response, basePath);
        
        return "host-center/survey/surveyList";
    }
    
   

    // 설문 생성 
    @PostMapping("host-center/survey/createSurvey.do")
    public String createSurveyDo(Model model, @RequestParam String surveyName, @RequestParam String[] test, String[] test1, String[] test2, @RequestParam String[] test3, String[] test4, String[] test5, RedirectAttributes attrs) {
        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        session.getAttribute("business_id");
        
       // String managerId = (String)session.getAttribute("surveyName");
        String basePath = ctx.getRealPath(survey_folder) + File.separator + session.getAttribute("business_id");
        // model에 파일 경로 전달
        model.addAttribute("basePath", basePath);

        surveyModel survey = new surveyModel();
        boolean createSurveySuccess = survey.createSurvey(basePath, surveyName, test, test1, test2, test3, test4, test5);

        if (createSurveySuccess) {
            attrs.addFlashAttribute("msg", "설문 생성 완료하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "설문 생성 실패하였습니다.");
        }
//        System.out.println(createSurveySuccess);
        return "redirect:/host-center/survey/surveymanager";
    }
    
    
    // 강의에 등록된 설문 리스트 
    @GetMapping("survey/surveySelectList")
    public String surveySelectList(Model model) {
        
        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        int lectureid = 1234;
        session.setAttribute("lectureid", lectureid);
        String userid = "test";
        session.setAttribute("userid", userid);
        
        log.debug("surveySelectList called...");

        String basePath = ctx.getRealPath(survey_folder) + File.separator + (String) session.getAttribute("business_id");
        String basePath1 = ctx.getRealPath(surveyInfo_folder);

        surveyModel survey = new surveyModel();
        String[] searchSurvey = survey.searchSurvey(basePath, (String) session.getAttribute("business_id"), basePath1, (int) session.getAttribute("lectureid"));

        boolean[] isStart = survey.checkIfStart(searchSurvey, (String) session.getAttribute("userid"));
//        for (int i = 0; i < isStart.length; i++) {
//            System.out.println("isStart =" + isStart[i]);
//        }

        model.addAttribute("searchSurvey", searchSurvey);
        model.addAttribute("isStart", isStart);

        return "survey/surveySelectList";
    }

    // 강의에 등록된 설문 삭제 
    @PostMapping("survey/deleteSelectSurvey")
    public String deleteSelectSurvey(Model model, @RequestParam String surveyTitle, @RequestParam String surveyContent, RedirectAttributes attrs) {

        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        
        // 등록 설문 삭제 - 설문 시작 전이면 삭제 가능 (삭제 버튼 활성화)
        
        log.debug("deleteSelectSurvey called...");

        String basePath = ctx.getRealPath(surveyInfo_folder);

        surveyModel survey = new surveyModel();
        boolean deleteSuccess = survey.deleteSelectSurvey(surveyTitle,surveyContent, basePath, (String) session.getAttribute("business_id"));

        if (deleteSuccess) {
            attrs.addFlashAttribute("msg", "설문 등록 삭제 완료하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "설문 등록 삭제 실패하였습니다.");
        }
        return "redirect:/survey/surveySelectList";
    }
    
    // 강의에 설문 등록 
    @PostMapping("survey/selectSurvey")
    public String selectSurvey(Model model) {

        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        
        log.debug("selectSurvey called...");

        String basePath = ctx.getRealPath(survey_folder) + File.separator + session.getAttribute("business_id");

        surveyModel survey = new surveyModel();
        String[] surveyList = survey.surveyList(basePath);
        model.addAttribute("surveyList", surveyList);

        return "survey/selectSurvey";
    }

    // 강의에 대해서 설문 등록 시 엑셀 파일로 정보 저장
    @PostMapping("survey/registerSurvey.do")
    public String registerSurveyDo(Model model, @RequestParam String surveyName, @RequestParam String title, @RequestParam String startDatetime, @RequestParam String endDatetime,  RedirectAttributes attrs) {
        
        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        int lectureid = 1234;
        session.setAttribute("lectureid", lectureid);
        
        
        String basePath = ctx.getRealPath(surveyInfo_folder);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        LocalDateTime startDateTime = LocalDateTime.parse(startDatetime, formatter);
        LocalDateTime endDateTime = LocalDateTime.parse(endDatetime, formatter);

        if (startDateTime.isBefore(endDateTime)) {
            surveyModel survey = new surveyModel();
            boolean registerSurveySuccess = survey.registerSurvey(basePath, (int) session.getAttribute("lectureid"), surveyName, (String) session.getAttribute("business_id"), title, startDatetime.toString(), endDatetime.toString());

            if (registerSurveySuccess) {
                attrs.addFlashAttribute("msg", "설문 생성 완료하였습니다.");
            } else {
                attrs.addFlashAttribute("msg", "설문 생성 실패하였습니다.");
            }
        } else {
            attrs.addFlashAttribute("msg", "시작 일시가 종료 일시보다 늦거나 같습니다.");
        }
//        System.out.println(registerSurveySuccess);
        return "redirect:/survey/surveySelectList";
    }
    
    
    // 참여할 설문 리스트 
    @GetMapping("survey/showDoList")
    public String showDoList(Model model) {
        
        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        int lectureid = 1234;
        session.setAttribute("lectureid", lectureid);
        String userid = "test";
        session.setAttribute("userid", userid);
        
        log.debug("showDoList called...");

        String basePath = ctx.getRealPath(survey_folder) + File.separator + (String) session.getAttribute("business_id");
        String basePath1 = ctx.getRealPath(surveyInfo_folder);
        String basePath2 = ctx.getRealPath(surveyResult_folder) + File.separator + (String) session.getAttribute("business_id") + File.separator + (int) session.getAttribute("lectureid");

        surveyModel survey = new surveyModel();
        String[] searchSurvey = survey.searchSurvey(basePath, (String) session.getAttribute("business_id"), basePath1, (int) session.getAttribute("lectureid"));

        boolean[] isExpired = survey.checkIfExpired(searchSurvey, basePath2, (String) session.getAttribute("userid"));
//        for (int i = 0; i < isExpired.length; i++) {
//            System.out.println("isExpired =" + isExpired[i]);
//        }

        model.addAttribute("searchSurvey", searchSurvey);
        model.addAttribute("isExpired", isExpired);

//       for(int i=0; i<searchSurvey.length; i++) {
//            System.out.println("searchSurvey ====" + searchSurvey[i]);
//        }
        return "survey/showDoList";
    }

    // 엑셀 파일 읽어서 설문 폼 만들기
    @PostMapping("survey/surveyForm")
    public String makeFormDo(Model model, @RequestParam String surveyTitle, @RequestParam String surveyContent) {
        
        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        int lectureid = 1234;
        session.setAttribute("lectureid", lectureid);
        
        // System.out.println("surveyTitle== " + surveyTitle);
        String basePath = ctx.getRealPath(survey_folder) + File.separator + session.getAttribute("business_id");

        surveyModel survey = new surveyModel();

        String[] a = survey.makeForm(basePath, surveyTitle);

        // model에 파일 경로 전달
        model.addAttribute("basePath", basePath);
        model.addAttribute("a", a);
        model.addAttribute("surveyContent", surveyContent);
        model.addAttribute("surveyTitle", surveyTitle);

        return "survey/surveyForm";
    }

    // 설문 결과 엑셀 파일 생성
    @PostMapping("survey/createResult.do")
    public String createResultDo(Model model, HttpServletRequest request, @RequestParam String name, @RequestParam String[] question, RedirectAttributes attrs) {

        String business_id = "manager";
        session.setAttribute("business_id", business_id);
        int lectureid = 1234;
        session.setAttribute("lectureid", lectureid);
        String userid = "test";
        session.setAttribute("userid", userid);
        
        String title = request.getParameter("title");
        String surveyTitle = request.getParameter("surveyTitle");

        int dotIndex = surveyTitle.lastIndexOf(".");
        surveyTitle = surveyTitle.substring(0, dotIndex);

        // 모든 매개 변수 이름 가져오기
        Enumeration<String> parameterNames = request.getParameterNames();

        // 각 질문을 저장할 List 생성
        List<String> questionList = new ArrayList<>();

        String que = "";

        // 매개 변수 이름을 기반으로 각 질문과 답변을 가져와서 questionList에 추가
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            if (paramName.startsWith("answer")) { // question으로 시작하는 매개 변수만 처리
                que = request.getParameter(paramName);
                questionList.add(que);
                //    System.out.println("질문: " + question);
            }
        }

        // 파일 저장 경로 (file.surveyExcel_folder=/WEB-INF/surveyResult)
        String basePath = ctx.getRealPath(surveyResult_folder) + File.separator + session.getAttribute("business_id");

        surveyModel result = new surveyModel();
        boolean resultUpdateSuccess = result.createResult(basePath, name, question, questionList, (String) session.getAttribute("userid"), (int) session.getAttribute("lectureid"), title, surveyTitle);

        if (resultUpdateSuccess) {
            attrs.addFlashAttribute("msg", "설문 참여 완료하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "설문 참여 실패하였습니다.");
        }

        return "redirect:/survey/showDoList";
    }

}
