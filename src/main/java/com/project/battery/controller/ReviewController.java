/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.battery.dto.LectureDto;
import com.project.battery.dto.RegiClassDto;
import com.project.battery.dto.ReviewDto;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.Lecture;
import com.project.battery.model.ReviewModel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author parkchaebin
 */
@Controller
@Slf4j
public class ReviewController {
    
    @Autowired
    HikariConfiguration dbConfig;
    
    @Autowired
    private HttpSession session;
    
    @GetMapping("lecture/lecture_review")
    public String review(@RequestParam("lecture") int lecid, Model model) {
        Lecture lec = new Lecture(dbConfig);
        
        
        List<RegiClassDto> list = new ArrayList<>();
        
        list = lec.getRegiList(lecid);
        
        LectureDto lecture = lec.SearchlecInfo(lecid);
        
        model.addAttribute("list",list);
        model.addAttribute("lec",lecture);
        return "lecture/lecture_review";
    }
    
    @PostMapping("lecture/insertReview")
    public String insertReview(@RequestParam("data") String data, Model model, HttpServletRequest request, RedirectAttributes attrs) throws SQLException {
        
        log.debug("insertReview called...");
        List<ReviewDto> rList = new ArrayList<>();
        String lectureGrade = request.getParameter("lectureGrade");
        String lectureReview = request.getParameter("lectureReview");
        String instructorGrade = request.getParameter("hostGrade");
        String instructorReview = request.getParameter("hostReview");
        
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            List<Map<String,String>> list = objectMapper.readValue(data, new TypeReference<List<Map<String,String>>>() {});
            for(Map<String,String> l : list){
                rList.add(new ReviewDto(l.get("id"),Integer.parseInt(l.get("grade")),l.get("review")));
            }
        } catch (JsonProcessingException ex) {
            Logger.getLogger(ReviewController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        ReviewModel review = new ReviewModel();
       
        boolean insertReviewSuccess = review.insertReview(dbConfig, (LectureDto)session.getAttribute("lectureinfo"), 
                (String) session.getAttribute("host"), Integer.parseInt(lectureGrade), 
                lectureReview, Integer.parseInt(instructorGrade), instructorReview, rList);
        
        if (insertReviewSuccess) {
            attrs.addFlashAttribute("msg", "리뷰 등록 완료하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "리뷰 등록 실패하였습니다.");
        }
    
        return String.format( "redirect:/lecture/lecture_review?lecture=%s",(String) session.getAttribute("lecture"));
    }
}

