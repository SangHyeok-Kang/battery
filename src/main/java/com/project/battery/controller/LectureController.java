/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.Notice;
import com.project.battery.service.InsertInfoService;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author qntjd
 */
@Slf4j
@Controller
@PropertySource("classpath:/system.properties")
public class LectureController {

    @Autowired
    private ServletContext ctx;
    @Autowired
    private HttpSession session;
    @Autowired
    HikariConfiguration dbConfig;

    @Value("${file.notice_folder}")
    private String notice_folder;

    @GetMapping("lecture/lecture_notice")
    public String lecture(@RequestParam("lecture") String id) {
        session.setAttribute("lecture", id);
        return "lecture/lecture_notice";
    }

    @GetMapping("lecture/create_notice")
    public String createLectureMotice() {
        return "lecture/create_notice";

    }

    @PostMapping("lecture/insert_notice.do")
    public String insertNotice(HttpServletRequest request, @RequestParam(name="file") MultipartFile notice_file, RedirectAttributes attrs) {
        String filePath = "";
        if(!"".equals(notice_file.getOriginalFilename()))
            filePath = InsertInfoService.insertFolder(ctx.getRealPath(notice_folder), notice_file,(String) session.getAttribute("lecture"));
        Notice notice = new Notice((String)session.getAttribute("lecture"),(String) request.getParameter("title"), (String) request.getParameter("text"),
                "default", (String)session.getAttribute("host"),filePath );
        if(notice.insertNotice(notice, dbConfig)){
           attrs.addFlashAttribute("msg", "공지사항 등록에 성공하였습니다.");
        }else{
            attrs.addFlashAttribute("msg", "공지사항 등록에 실패하였습니다.");
        }
        return String.format("redirect:/lecture/lecture_notice?lecture=%s", (String)session.getAttribute("lecture"));
    }

}
