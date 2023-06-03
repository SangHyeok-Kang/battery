/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.loginModel;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author qntjd
 */
@Controller
@Slf4j
@PropertySource("classpath:/application.properties")
public class SystemController {

    public boolean result = false;
    @Autowired
    private HttpSession session;
    @Autowired
    private HttpServletRequest request;
    
    @Autowired
    private HikariConfiguration dbConfig;

    @GetMapping("/")
    public String projectMain() {
        log.debug("main access!");
        return "/index";
    }

    @GetMapping("/sign-in")
    public String signIn() {
        return "/sign-in";
    }

    @GetMapping("/sign-up")
    public String signUp() {
        return "/sign-up";
    }
    
    @GetMapping("/business-sign-up")
    public String businessSignUp() {
        return "/business-sign-up";
    }
    
    @PostMapping(value = "/login.do")
    public String loginDo(@RequestParam String userid, @RequestParam String password, Model model) {
        String urls = "";

        loginModel lm_model = new loginModel(dbConfig);
        result = lm_model.loginResult(userid, password);
        if (result == true) {
            session.setAttribute("host", userid);
            session.setAttribute("hostState","business");
            
            urls = "/index";
        } else {
            model.addAttribute("msg", "로그인에 실패하였습니다 입력 정보확인 후 다시 시도해주세요.");
            model.addAttribute("url", "/sign-in");
            urls = "/login_fail";
        }
        return urls;
    }
    
    @GetMapping("/logout.do")
    public String logoutDo(RedirectAttributes attrs){
        if(session.getAttribute("host") != null){
            session.invalidate();
            attrs.addFlashAttribute("msg","로그아웃하였습니다.");
        }
        return "redirect:/";
    }
}
