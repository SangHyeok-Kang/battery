/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.contoller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author qntjd
 */
@Controller
@Slf4j
public class SystemController {
    
    @GetMapping("/")
    public String projectMain(){
        log.debug("main access!");
        return "main";
    }
    
}
