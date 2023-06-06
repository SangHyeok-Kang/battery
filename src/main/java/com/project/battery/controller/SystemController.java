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

    ArrayList<LectureDto> view_list = new ArrayList<LectureDto>();
    ArrayList<LectureDto> nopri_list = new ArrayList<LectureDto>();
    ArrayList<LectureDto> pri_list = new ArrayList<LectureDto>();
    ArrayList<LectureDto> loc_list = new ArrayList<LectureDto>();

    @GetMapping("/")
    public String projectMain(Model model) {
        Lecture lec = new Lecture(dbConfig);

        view_list = lec.getViewCountList();
        nopri_list = lec.getNoPriceList();
        pri_list = lec.getPriceList();
        //loc_list = lec.getLocalList();
        String view_count = lec.getLectureTable(view_list);
        String nopri = lec.getLectureTable(nopri_list);
        String pri = lec.getLectureTable(pri_list);

        model.addAttribute("viewcount_list", view_count);
        model.addAttribute("noprice_list", nopri);
        model.addAttribute("price_list", pri);

        return "/index";
    }
    
    @GetMapping("/mento")
    public String mentoMain(Model model) {
        Lecture lec = new Lecture(dbConfig);

        view_list = lec.getViewCountList();
        nopri_list = lec.getNoPriceList();
        pri_list = lec.getPriceList();
        //loc_list = lec.getLocalList();
        String view_count = lec.getLectureTable(view_list);
        String nopri = lec.getLectureTable(nopri_list);
        String pri = lec.getLectureTable(pri_list);

        model.addAttribute("viewcount_list", view_count);
        model.addAttribute("noprice_list", nopri);
        model.addAttribute("price_list", pri);

        return "mento/index";
    }

    @GetMapping("/sign-in")
    public String signIn() {
        session.invalidate();
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

    @GetMapping("/mypage")
    public String mypage() {
        String phone = (String) session.getAttribute("phone");
        String[] strAry = phone.split("-");

        session.setAttribute("phone1", strAry[0]);
        session.setAttribute("phone2", strAry[1]);
        session.setAttribute("phone3", strAry[2]);
        return "/mypage";
    }

    @PostMapping(value = "/login.do")
    public String loginDo(@RequestParam String chk_state, @RequestParam String userid, @RequestParam String password, RedirectAttributes attrs) {
        String urls = "";
        
        loginModel lm_model = new loginModel(dbConfig);
        result = lm_model.loginResult(chk_state, userid, password);
        if (result == true) {
            session.setAttribute("host", lm_model.getUser());
            session.setAttribute("state", lm_model.getState()); //일반회원(0) 로그인 상태 세션 저장
            session.setAttribute("name", lm_model.getName());
            session.setAttribute("phone", lm_model.getPhone());
            session.setAttribute("address", lm_model.getAddress());
            session.setAttribute("detail", lm_model.getDetail());
            session.setAttribute("postcode", lm_model.getPostcode());
            session.setAttribute("extra", lm_model.getExtra());
            session.setAttribute("com_name",lm_model.getCom_name());
          
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
        session.setAttribute("user", userid);
        attrs.addFlashAttribute("result", result);
        attrs.addFlashAttribute("user", session.getAttribute("user"));

        return "redirect:/sign-up";
    }

    @GetMapping("/check_bId.do")
    public String checkCeoId(@RequestParam String userid, RedirectAttributes attrs) {
        this.userid = userid;
        AddUserManager manager = new AddUserManager(dbConfig);
        result = manager.check_bId(userid);
        session.setAttribute("user", userid);
        attrs.addFlashAttribute("result", result);
        attrs.addFlashAttribute("user", session.getAttribute("user"));

        return "redirect:/business-sign-up";
    }

    //일반 사용자 회원가입
    @PostMapping("/normal_signup.do")
    public String insertNormalUserInfo(@RequestParam String userid, @RequestParam String password, @RequestParam String name,
            @RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3, @RequestParam String birthdate, @RequestParam String school,
            @RequestParam String major, @RequestParam String grade, @RequestParam String status, @RequestParam String keyword,
            @RequestParam String postcode, @RequestParam String detail, @RequestParam String extra, @RequestParam String address, @RequestParam String gender, Model model) {
        String schoolinfo = "";
        String phone = phone1 + "-" + phone2 + "-" + phone3;
        session.invalidate();
        if (major.isEmpty() && status.isEmpty()) {
            schoolinfo = school + " " + grade;
        } else {
            schoolinfo = school + " " + major + " " + grade + " " + status;
        }

        AddUserManager manager = new AddUserManager(dbConfig);
        result = manager.checkId(userid);
        if (result == true) {
            manager.addRow(userid, name, password, phone, birthdate, schoolinfo, keyword, postcode, detail, extra, address, gender);

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
            @RequestParam String keyword, @RequestParam String postcode, @RequestParam String detail,
            @RequestParam String extra, @RequestParam String address, Model model) {
        session.invalidate();
        String phone = phone1 + "-" + phone2 + "-" + phone3;

        AddUserManager manager = new AddUserManager(dbConfig);
        result = manager.check_bId(userid);
        if (result == true) {
            manager.b_addRow(userid, password, com_name, phone, name, keyword, postcode, detail, address, extra);

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
    
    @GetMapping("delUser.do")
    public String DelUser(@RequestParam String userid, RedirectAttributes attrs){
        loginModel lm_model = new loginModel(dbConfig);
        int state = (int)session.getAttribute("state");
        
        lm_model.DelUser(userid, state);
        
        session.invalidate();
        attrs.addFlashAttribute("msg", "회원탈퇴 완료되었습니다.");
        
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
            model.addAttribute("msg", "일치하는 정보가 없습니다.");

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
    @PostMapping("/changeInfo.do")
    public String changeInfo(@RequestParam String currentPassword, @RequestParam String newPassword, @RequestParam String phone1, @RequestParam String phone2, @RequestParam String phone3,
            @RequestParam String postcode, @RequestParam String address, @RequestParam String detail, @RequestParam String extra, RedirectAttributes attrs) {

        userid = (String) session.getAttribute("host");
        loginModel lm_model = new loginModel(dbConfig);
        result = lm_model.loginResult("user", userid, currentPassword);
        if (result == true) {
            String phone = phone1 + "-" + phone2 + "-" + phone3;
            if (newPassword.isEmpty()) {
                lm_model.changeInfo(userid, currentPassword, phone, postcode, address, detail, extra);
            } else {
                lm_model.changeInfo(userid, newPassword, phone, postcode, address, detail, extra);
            }

            attrs.addFlashAttribute("msg", "회원정보 수정이 완료되었습니다.");
        } else {
            attrs.addFlashAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");

            return "redirect:/mypage";
        }

        return "redirect:/";

    }
}
