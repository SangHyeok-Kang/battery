/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.controller;

import com.project.battery.dto.LectureDto;
import com.project.battery.dto.MateriaDto;
import com.project.battery.model.HikariConfiguration;
import com.project.battery.model.Lecture;
import com.project.battery.model.Notice;
import com.project.battery.model.SearchAddress;
import com.project.battery.service.FileService;
import com.project.battery.service.PagingService;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
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
    private HttpServletRequest request;
    @Autowired
    private ServletContext ctx;
    @Autowired
    private HttpSession session;
    @Autowired
    HikariConfiguration dbConfig;

    @Value("${file.notice_folder}")
    private String notice_folder;
    @Value("${file.materia_folder}")
    private String materia_folder;

    @GetMapping("lecture/select_lecture")
    public String ShowLecInfo(@RequestParam("lecture") int id, Model model) {
        Lecture lec = new Lecture(dbConfig);
        lec.updateViews(id);
        
        SearchAddress manager = new SearchAddress(dbConfig);
        
        String juso = manager.checkAddress(id);
        model.addAttribute("juso", juso);
        return "lecture/lecture_info";
    }

    @GetMapping("lecture/lecture_notice")
    public String lecture(@RequestParam("lecture") String id, @RequestParam("page") int page, Model model) {
        if (!id.equals((String) session.getAttribute("lecture")) || session.getAttribute("lecture") == null) {
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

        model.addAttribute("notice_list", sublist);
        model.addAttribute("paging", paging);
        return "lecture/lecture_notice";
    }

    @GetMapping("lecture/create_notice")
    public String createLectureMotice() {
        return "lecture/create_notice";

    }

    @PostMapping("lecture/insert_notice.do")
    public String insertNotice(HttpServletRequest request, @RequestParam(name = "file") MultipartFile notice_file, RedirectAttributes attrs) {
        String filePath = "";
        if (!"".equals(notice_file.getOriginalFilename())) {
            filePath = FileService.insertFolder(ctx.getRealPath(notice_folder), notice_file, (String) session.getAttribute("lecture"), (String) session.getAttribute("host"));
        }
        Notice notice = new Notice((String) session.getAttribute("lecture"), (String) request.getParameter("title"), (String) request.getParameter("text"),
                "default", (String) session.getAttribute("host"), filePath);
        if (notice.insertNotice(notice, dbConfig)) {
            attrs.addFlashAttribute("msg", "공지사항 등록에 성공하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "공지사항 등록에 실패하였습니다.");
        }
        return String.format("redirect:/lecture/lecture_notice?lecture=%s&page=1", (String) session.getAttribute("lecture"));
    }

    @GetMapping("lecture/show_notice")
    public String showNotice(@RequestParam("id") int id, Model model) {
        Notice notice = new Notice().getNotice(Integer.parseInt((String) session.getAttribute("lecture")), id, dbConfig);
        model.addAttribute("notice", notice);
        return "lecture/show_notice";
    }

    @GetMapping("/lecture/del_notice.do")
    public String delNoticeDo(@RequestParam("id") int id, RedirectAttributes attrs) {
        boolean success = new Notice().delNotice(Integer.parseInt((String) session.getAttribute("lecture")), id, dbConfig);
        if (success) {
            attrs.addFlashAttribute("msg", "공지사항을 삭제하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "공지사항 삭제에 실패하였습니다.");
        }
        return String.format("redirect:/lecture/lecture_notice?lecture=%s&page=1", (String) session.getAttribute("lecture"));
    }

    @GetMapping("/lecture/noticedownload.do")
    public ResponseEntity<Resource> downNoticeFile(@RequestParam("filename") String filename, @RequestParam("writer") String writer) {
        //경로를 만들어주고 넘김
        String url = String.format(ctx.getRealPath(this.notice_folder) + File.separator + (String) session.getAttribute("lecture") + File.separator + writer);
        return FileService.downloadFile(url, filename, new HttpHeaders());
    }

    @GetMapping("/lecture/lecture_materia")
    public String lecturemateria(Model model, @RequestParam("page") int page,@RequestParam("lecture") int lecid){
        List<MateriaDto> materia = new Lecture().getMateriaList(dbConfig,lecid);
        if(!materia.isEmpty()){
            List<MateriaDto> pagingMateria = new ArrayList<>();
            PagingService paging = new PagingService(page, materia.size());
            for (int i = paging.getStartlist(); i < paging.getEndlist() + 1; i++) {
                pagingMateria.add(materia.get(i - 1));
            }
            model.addAttribute("filelist", pagingMateria);
            model.addAttribute("paging", paging);
        }
        return "lecture/lecture_materia";
    }

    @PostMapping("/lecture/uploadMateria.do")
    public String uploadMateria(@RequestParam(name = "materia", required = false) MultipartFile materia, RedirectAttributes attrs) {
        if (new Lecture().uploadMateria(dbConfig, ctx.getRealPath(this.materia_folder),
                materia, (String) session.getAttribute("lecture"),
                (String) session.getAttribute("host"))) {
            attrs.addFlashAttribute("msg", "파일 업로드에 성공하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "파일 업로드에 실패하였습니다.");
        }
        return String.format("redirect:/lecture/lecture_materia?lecture=%s&page=1", (String) session.getAttribute("lecture"));
    }

    @GetMapping("/lecture/materiadownload.do")
    public ResponseEntity<Resource> downMateria(@RequestParam("filename") String filename) {
        String url = "";
        //경로를 만들어주고 넘김
        for (File f : new File(ctx.getRealPath(this.materia_folder) + File.separator + (String) session.getAttribute("lecture")).listFiles()) {
            url = f.getAbsolutePath();
        }
        return FileService.downloadFile(url, filename, new HttpHeaders());
    }

    @GetMapping("/lecture/del_materia.do")
    public String delMateria(@RequestParam("name") String filename, @RequestParam("lecid") String lecid, @RequestParam("id") String id, RedirectAttributes attrs) {
        String filepath = ctx.getRealPath(this.materia_folder) + File.separator + lecid + File.separator + id + File.separator + filename;
        String dbpath = lecid + File.separator + id + File.separator + filename;
        if (new Lecture().delMateriaFile(dbConfig, filepath, dbpath)) {
            attrs.addFlashAttribute("msg", "파일 삭제에 성공하였습니다.");
        } else {
            attrs.addFlashAttribute("msg", "파일 삭제에 실패하였습니다.");
        }
        return String.format("redirect:/lecture/lecture_materia?lecture=%s&page=1", (String) session.getAttribute("lecture"));
    }

}
