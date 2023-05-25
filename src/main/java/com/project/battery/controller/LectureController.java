/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.Notice;
import com.project.battery.service.InsertInfoService;
import com.project.battery.service.PagingService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
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
    public String lecture(@RequestParam("lecture") String id,@RequestParam("page") int page, Model model) {
        if(!id.equals((String)session.getAttribute("lecture"))){
            session.setAttribute("lecture", id);
        }
        //강의실에 해당하는 공지사항 목록가져온다
        List<Notice> list = new Notice().getNoticeList(id, dbConfig);
        List<Notice> sublist = new ArrayList<>();
        PagingService paging = new PagingService(page, list.size());
        if (!list.isEmpty()) {
            //출력할 메시지 목록만 슬라이싱
            for (int i = paging.getStartlist(); i < paging.getEndlist() + 1; i++) {
                sublist.add(list.get(i - 1));
            }
        }
        
        model.addAttribute("notice_list",sublist);
        model.addAttribute("paging",paging);
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
        return String.format("redirect:/lecture/lecture_notice?lecture=%s&page=%d", (String)session.getAttribute("lecture"),1);
    }

}
