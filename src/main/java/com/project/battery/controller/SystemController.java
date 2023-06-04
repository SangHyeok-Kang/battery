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
import com.project.battery.model.userInfo;
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
import org.springframework.web.bind.annotation.RequestMapping;
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
            System.out.println("");
            System.out.println(lm_model.getName());
            urls = "redirect:/";
        } else {
            attrs.addFlashAttribute("msg", "로그인에 실패하였습니다.");
            urls = "redirect:/sign-in";
        }
        return urls;
    }

    @GetMapping("/checkId.do")
    public String checkUserId(@RequestParam String userid, RedirectAttributes attrs) {
        this.userid = userid;
        AddUserManager manager = new AddUserManager(dbConfig);
        result = manager.checkId(userid);
        System.out.println(result);
        attrs.addFlashAttribute("result", result);

        return "redirect:/sign-up";
    }
    
    @GetMapping("/check_bId.do")
    public String checkCeoId(@RequestParam String userid, RedirectAttributes attrs) {
        this.userid = userid;
        AddUserManager manager = new AddUserManager(dbConfig);
        result = manager.check_bId(userid);
        System.out.println(result);
        attrs.addFlashAttribute("result", result);

        return "redirect:/business-sign-up";
    }
    
    //일반 사용자 회원가입
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
            manager.addRow(userid, name, password, phone, birthdate, schoolinfo, interest, postcode, detail, extra, address, gender);

            model.addAttribute("msg", "회원가입 완료되었습니다.");
            model.addAttribute("url", "/");
        } else {
            model.addAttribute("msg", "회원가입에 실패하였습니다 입력 정보확인 후 다시 시도해주세요.");
            model.addAttribute("url", "/sign-up");
        }
        return "/signup_result";
    }
    
     //비즈니스 사용자 회원가입
    @PostMapping("/ceo_signup.do")
    public String insertBusinessUserInfo(@RequestParam String userid, @RequestParam String password, @RequestParam String name,
            @RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3, @RequestParam String com_name, 
            @RequestParam List<String> subcategory, @RequestParam String postcode, @RequestParam String detail, 
            @RequestParam String extra, @RequestParam String address, Model model) {       
        String phone = phone1 + "-" + phone2 + "-" + phone3;
        String interest = subcategory.get(0) + "/" + subcategory.get(1) + "/" + subcategory.get(2) + "/";
       
        System.out.println(interest);
        

        AddUserManager manager = new AddUserManager(dbConfig);
        result = manager.check_bId(userid);
        if (result == true) {
            manager.b_addRow(userid, password, com_name, phone, name, interest, postcode, detail, address, extra);

            model.addAttribute("msg", "회원가입 완료되었습니다.");
            model.addAttribute("url", "/");
        } else {
            model.addAttribute("msg", "회원가입에 실패하였습니다 입력 정보확인 후 다시 시도해주세요.");
            model.addAttribute("url", "/business-sign-up");
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

    //TEST
    @GetMapping("/test")
    public String login() {
        return "test";
    }

    // id찾을껀지 비밀번호 찾을껀지 선택하는 페이지
    @GetMapping("/select_findinfo")
    public String selectFindinfo() {
        return "select_findinfo";
    }

    @GetMapping("/findid")
    public String findidPage() {
        return "findid";
    }

    @GetMapping("/findpass")
    public String findpassPage() {
        return "findpass";
    }

    @GetMapping("/changepw")
    public String changepwPage() {
        return "changepw";
    }

    // 아이디 찾기
    @RequestMapping("/findid.do")
    public String findIdDo(@RequestParam String name, @RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3, Model model) {

        String phone = phone1 + "-" + phone2 + "-" + phone3;
        loginModel lm_model = new loginModel(dbConfig);

        userInfo user;

        user = lm_model.findIdResult(name, phone);
        // 이름과 전화번호로 아이디를 찾는 비즈니스 로직 수행

        if (user != null) {

            model.addAttribute("msg", user.getUsername() + "님의 ID는 " + user.getUserid() + "입니다.");
        } else {
            model.addAttribute("msg", "일치하는 정2보가 없습니다.");

        }

        return "test"; // 결과를 보여줄 view의 이름
    }

    // 비밀번호 찾기
    @RequestMapping("/findpass.do")
    public String findPwDo(@RequestParam String userid, @RequestParam String name, @RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3, Model model) {
        String phone = phone1 + "-" + phone2 + "-" + phone3;
        loginModel lm_model = new loginModel(dbConfig);
        userInfo user;

        user = lm_model.findPwResult(userid, name, phone);
        // 이름과 전화번호로 아이디를 찾는 비즈니스 로직 수행

        if (user != null) {
            model.addAttribute("msg", user.getUsername() + "님 비밀번호를 새로 변경해주세요");
            model.addAttribute("id", user.getUserid());
            return "changepw";
        } else {
            model.addAttribute("msg", "일치하는 정보가 없습니다.");
        }

        return "findpass";
    }

    // 비밀번호 변경
    @RequestMapping("/changePw.do")
    public String changePw(@RequestParam String userid, @RequestParam String pass1, @RequestParam String pass2, Model model) {

        log.info(userid);
        log.info(pass1);
        log.info(pass2);

        if (!pass1.equals(pass2)) {
            // 오류띄우고
            model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
            return "changepw";

        } else {

            loginModel lm_model = new loginModel(dbConfig);
            lm_model.changePw(userid, pass1);

            //변경 완료 알림
            model.addAttribute("msg", "비밀번호가 정상적으로 변경되었습니다.");
            return "test"; // 결과를 보여줄 view의 이름
        }
    }
}
