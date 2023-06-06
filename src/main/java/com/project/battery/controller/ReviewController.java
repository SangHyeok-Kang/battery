/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.ReviewModel;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
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
    public String review() {

        log.debug("review called...");

        return "lecture/lecture_review";
    }
    
    @PostMapping("/insertReview")
    public String insertReview(Model model, HttpServletRequest request, RedirectAttributes attrs) throws SQLException {
        
        log.debug("insertReview called...");
        
        String lectureGrade = request.getParameter("lectureGrade");
        String lectureReview = request.getParameter("lectureReview");
        String instructorGrade = request.getParameter("instructorGrade");
        String instructorReview = request.getParameter("instructorReview");
        String staffGrade = request.getParameter("staffGrade");
        String staffReview = request.getParameter("staffReview");
        String businessGrade = request.getParameter("businessGrade");
        String businessReview = request.getParameter("businessReview");
        
        ReviewModel review = new ReviewModel();
        
        boolean insertReviewSuccess = review.insertReview(dbConfig, Integer.parseInt((String)session.getAttribute("lecture")), (String) session.getAttribute("host"), Integer.parseInt(lectureGrade), lectureReview, Integer.parseInt(instructorGrade), instructorReview, Integer.parseInt(staffGrade), staffReview, Integer.parseInt(businessGrade), businessReview);
        
        if (insertReviewSuccess) {
            attrs.addFlashAttribute("msg", "리뷰 등록 완료하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "리뷰 등록 실패하였습니다.");
        }
        
        return "redirect:index";
    }
}

