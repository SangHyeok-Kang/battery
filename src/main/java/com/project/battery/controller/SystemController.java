/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.dto.LectureDto;
import com.project.battery.model.AddUserManager;
import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.Lecture;
import com.project.battery.model.loginModel;
import java.util.ArrayList;
import java.util.List;
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
    private String userid = "";

    @Autowired
    private HttpSession session;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HikariConfiguration dbConfig;

    ArrayList<LectureDto> list = new ArrayList<LectureDto>();

    @GetMapping("/")
    public String projectMain(Model model) {
        Lecture lec = new Lecture(dbConfig);
        list = lec.getLecture();
        String result = lec.getLectureTable(list);
        
        model.addAttribute("lecturelist", result);
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
    public String loginDo(@RequestParam String chk_state, @RequestParam String userid, @RequestParam String password, RedirectAttributes attrs) {
        String urls = "";

        loginModel lm_model = new loginModel(dbConfig);
        result = lm_model.loginResult(chk_state, userid, password);
        if (result == true) {
            session.setAttribute("host", lm_model.getUser());
            session.setAttribute("state", lm_model.getState()); //일반회원(0) 로그인 상태 세션 저장
            session.setAttribute("name",lm_model.getName());
            System.out.println(lm_model.getName());
            urls = "redirect:/";
        } else {
            attrs.addFlashAttribute("msg", "로그인에 실패하였습니다.");
            urls = "redirect:/sign-in";
        }
        return urls;
    }

    @PostMapping("/normal_signup.do")
    public String insertNormalUserInfo(@RequestParam String userid, @RequestParam String password, @RequestParam String name,
            @RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3, @RequestParam String birthdate, @RequestParam String school,
            @RequestParam String major, @RequestParam String grade, @RequestParam String status, @RequestParam List<String> subcategory,
            @RequestParam String postcode, @RequestParam String detail, @RequestParam String extra, @RequestParam String address, @RequestParam String gender, Model model) {
        String schoolinfo = "";
        String phone = phone1 + "-" + phone2 + "-" + phone3;
        String interest = subcategory.get(0) + "/" + subcategory.get(1) + "/" + subcategory.get(2) + "/";

        System.out.println(interest);

        if (major.isEmpty() && status.isEmpty()) {
            schoolinfo = school + " " + grade;
        } else {
            schoolinfo = school + " " + major + " " + grade + " " + status;
        }

        AddUserManager manager = new AddUserManager(dbConfig);
        result = manager.checkId(userid);
        if (result == true) {
            manager.addRow(userid, password, name, phone, birthdate, schoolinfo, interest, postcode, detail, extra, address, gender);

            model.addAttribute("msg", "회원가입 완료되었습니다.");
            model.addAttribute("url", "/");
        } else {
            model.addAttribute("msg", "회원가입에 실패하였습니다 입력 정보확인 후 다시 시도해주세요.");
            model.addAttribute("url", "/sign-up");
        }
        return "/signup_result";
    }

    @GetMapping("/logout.do")
    public String logoutDo(RedirectAttributes attrs) {
        if (session.getAttribute("host") != null) {
            session.invalidate();
            attrs.addFlashAttribute("msg", "로그아웃하였습니다.");
        }
        return "redirect:/";

    }
}
