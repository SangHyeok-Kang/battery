/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author qntjd
 */
@Controller
@Slf4j
public class HostController {
    
    @GetMapping("/host-center")
    public String hostCentter(){
        return "host-center";
    }
    
    @GetMapping("/lecture/create_lecture")
    public String createLecture(){
        return "/lecture/create_lecture";
    }
}
