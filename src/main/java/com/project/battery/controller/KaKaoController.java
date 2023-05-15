/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.service.KaKaoService;
import java.io.IOException;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author host
 */
@Slf4j
@Controller
@RequestMapping("/member")
public class KaKaoController {


    @Autowired
    KaKaoService ks;

    @GetMapping("/do")
    public String loginPage()
    {
        return "sign-in";
    }

    @GetMapping("/kakao")
    public String getCI(@RequestParam String code, Model model) throws IOException {
        log.info("code = " + code);
        
        String access_token = ks.getToken(code); 
        Map<String, Object> userInfo = ks.getUserInfo(access_token);
        model.addAttribute("code", code);
        model.addAttribute("acccodeess_token", access_token);
        model.addAttribute("userInfo", userInfo);

        //ci는 비즈니스 전환후 검수신청 -> 허락받아야 수집 가능
        return "redirect:/";
    }

}