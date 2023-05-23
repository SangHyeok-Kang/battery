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
    
    @PostMapping(value = "/login.do")
    public String loginDo(@RequestParam String userid, @RequestParam String password, Model model) {
        String urls = "";

        loginModel lm_model = new loginModel(dbConfig);
        result = lm_model.loginResult(userid, password);
        String user = lm_model.getUser();
        if (result == true) {
            session.setAttribute("host", user);
            session.setAttribute("state", 1); //일반회원 로그인 상태 세션 저장
            
            urls = "/index";
        } else {
            model.addAttribute("msg", "로그인에 실패하였습니다 입력 정보확인 후 다시 시도해주세요.");
            model.addAttribute("url", "/sign-in");
            urls = "/login_fail";
        }
        return urls;
    }
}
