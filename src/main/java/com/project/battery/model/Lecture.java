/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import com.project.battery.dto.LectureDto;
import com.project.battery.dto.MateriaDto;
import com.project.battery.dto.RegiClassDto;
import com.project.battery.service.FileService;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author qntjd
 */
@Slf4j
@NoArgsConstructor
public class Lecture {

    DataSource ds = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    private HikariConfiguration dbConfig;
    ArrayList<LectureDto> view_list = new ArrayList<LectureDto>();
    ArrayList<LectureDto> nopri_list = new ArrayList<LectureDto>();
    ArrayList<LectureDto> pri_list = new ArrayList<LectureDto>();
    ArrayList<LectureDto> local_list = new ArrayList<LectureDto>();
    ArrayList<LectureDto> detail_list = new ArrayList<LectureDto>();

    public Lecture(HikariConfiguration dbConfig) {
        this.dbConfig = dbConfig;
    }

    public Boolean insertLecture(HikariConfiguration dbConfig, LectureDto lecture, MultipartFile thumnail, MultipartFile text_image, MultipartFile resume, String[] path) {
        boolean success = false;

        String sql = "INSERT INTO lecture values (default,default,?,?,default,?,?,?,?,?,?,?,?,?,?,?,?,default,?,default,0,default)";
        String addressSQL = "INSERT INTO address values (default,?,?,?,?,?,1)";
        String updateFileFathSql = "update lecture set thumbnail=?, text_image=?, resume=? where lectureid=?";

        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            conn.setAutoCommit(false);
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            pstmt.setString(1, lecture.getTitle());
            pstmt.setString(2, lecture.getText());
            pstmt.setString(3, lecture.getRec_dt());
            pstmt.setString(4, lecture.getRec_target());
            pstmt.setInt(5, lecture.getRec_num());
            pstmt.setString(6, lecture.getDate());
            pstmt.setString(7, lecture.getKeyword());
            pstmt.setString(8, lecture.getPrice());
            pstmt.setInt(9, Integer.parseInt(lecture.getAgree()));
            pstmt.setInt(10, lecture.getTeacher());
            pstmt.setInt(11, lecture.getTeacher_num());
            pstmt.setInt(12, lecture.getStaffe());
            pstmt.setInt(13, lecture.getStaffe_num());
            pstmt.setString(14, lecture.getQual());
            pstmt.setString(15, lecture.getHost());

            if (pstmt.executeUpdate() == 1) {
                rs = pstmt.getGeneratedKeys();

                if (rs.next()) {
                    pstmt = conn.prepareStatement(updateFileFathSql);
                    pstmt.setString(1, FileService.insertFolder(path[0], thumnail, Integer.toString(rs.getInt(1)), lecture.getHost()));
                    pstmt.setString(2, FileService.insertFolder(path[1], text_image, Integer.toString(rs.getInt(1)), lecture.getHost()));
                    pstmt.setString(3, FileService.insertFolder(path[2], resume, Integer.toString(rs.getInt(1)), lecture.getHost()));
                    pstmt.setInt(4, rs.getInt(1));
                    if (pstmt.executeUpdate() == 1) {
                        pstmt = conn.prepareStatement(addressSQL);
                        pstmt.setInt(1, rs.getInt(1));
                        pstmt.setString(2, lecture.getPostcode());
                        pstmt.setString(3, lecture.getAddress());
                        pstmt.setString(4, lecture.getDetail());
                        pstmt.setString(5, lecture.getExtra());

                        if (pstmt.executeUpdate() == 1) {
                            log.debug("강의 입력 성공 host={}, titlt={}", lecture.getHost(), lecture.getTitle());
                            success = true;
                        } else {
                            log.debug("강의 주소 정보 입력 실패 host={}, titlt={}", lecture.getHost(), lecture.getTitle());
                        }
                    } else {
                        log.debug("파일 정보 입력 실패 host={}, titlt={}", lecture.getHost(), lecture.getTitle());
                    }
                }
            } else {
                log.debug("강의 정보 입력 실패 host={}, titlt={}", lecture.getHost(), lecture.getTitle());
            }
            if (success) {conn.commit();} 
            else {conn.rollback();}
            conn.setAutoCommit(true);
            if (conn != null) {conn.close();}
            if (pstmt != null) { pstmt.close();}
            if (rs != null) {rs.close();}
        } catch (SQLException ex) {
            log.debug("강의 입력 실패 SqlError = {}", ex.getMessage());
        }
        return success;
    }

    //비즈니스 아이디로 개설한 모든 강의 헤더 정보 가져오기
    public List<LectureDto> getCreateLectureList(String id, String state) {
        List<LectureDto> list = new ArrayList<>();
        String sql = "SELECT lectureid, thumbnail, l_title, l_date FROM lecture where host=? and l_state=?";
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, state);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String thumbnail = rs.getString("thumbnail");
                if (thumbnail.equals("")) {
                    thumbnail = "none.png";
                }
                list.add(new LectureDto(rs.getInt("lectureid"), thumbnail, rs.getString("l_title"), rs.getString("l_date")));
            }
            if (conn != null) {
                conn.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }


    // 전체 강의 리스트 가져오기
    public ArrayList<LectureDto> getViewCountList() {
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM lecture WHERE l_state = 'start' ORDER BY view_count desc"; //조회수별 검색          

            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                LectureDto lec = new LectureDto();
                lec.setLectureid(rs.getInt("lectureid"));
                lec.setThumbnail(rs.getString("thumbnail"));
                lec.setTitle(rs.getString("l_title"));
                lec.setDate(rs.getString("l_date"));
                lec.setKeyword(rs.getString("l_keyword"));
                lec.setPrice(rs.getString("price"));
                lec.setSel_count(rs.getInt("view_count"));
                view_list.add(lec);

            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());

        }

        return view_list;
    }

    public ArrayList<LectureDto> getLocalList(String local, String keyword) {

        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();

            String local_sql = "select * from lecture lec join address ad on lec.lectureid = ad.id where ad.address like '?%' and l_state = 'start' and lec.l_keyword = '%?%"; //지역별 검색          
            pstmt = conn.prepareStatement(local_sql);

            pstmt.setString(1, local);
            pstmt.setString(2, keyword);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                LectureDto lec = new LectureDto();
                lec.setLectureid(rs.getInt("lectureid"));
                lec.setThumbnail(rs.getString("thumbnail"));
                lec.setTitle(rs.getString("l_title"));
                lec.setDate(rs.getString("l_date"));
                lec.setKeyword(rs.getString("l_keyword"));
                lec.setPrice(rs.getString("price"));
                lec.setSel_count(rs.getInt("view_count"));
                local_list.add(lec);

            }
            rs.close();
            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());

        }

        return local_list;
    }

    public ArrayList<LectureDto> getNoPriceList() {

        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            String no_price_sql = "select * from lecture where price is null or price = '' and l_state = 'start'"; //무료 강의 검색

            rs = stmt.executeQuery(no_price_sql);

            while (rs.next()) {
                LectureDto lec = new LectureDto();
                lec.setLectureid(rs.getInt("lectureid"));
                lec.setThumbnail(rs.getString("thumbnail"));
                lec.setTitle(rs.getString("l_title"));
                lec.setDate(rs.getString("l_date"));
                lec.setKeyword(rs.getString("l_keyword"));
                lec.setPrice(rs.getString("price"));
                lec.setSel_count(rs.getInt("view_count"));
                nopri_list.add(lec);

            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());

        }

        return nopri_list;
    }

    public ArrayList<LectureDto> getPriceList() {

        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            String yes_price_sql = "select * from lecture where price != '' and l_state = 'start'"; //유료 강의 검색

            rs = stmt.executeQuery(yes_price_sql);

            while (rs.next()) {
                LectureDto lec = new LectureDto();
                lec.setLectureid(rs.getInt("lectureid"));
                lec.setThumbnail(rs.getString("thumbnail"));
                lec.setTitle(rs.getString("l_title"));
                lec.setDate(rs.getString("l_date"));
                lec.setKeyword(rs.getString("l_keyword"));
                lec.setPrice(rs.getString("price"));
                lec.setSel_count(rs.getInt("view_count"));
                pri_list.add(lec);

            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());

        }

        return pri_list;
    }

    public String getLectureTable(ArrayList<LectureDto> list) {

        StringBuilder buffer = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            String str = list.get(i).getDate();
            String[] strAry = str.split("%");

            buffer.append("<div class=\"swiper-slide\">"
                    + "<div class =\"card_thumbnail\">"
                    + " <a href=\"lecture/select_lecture?lecture=" + list.get(i).getLectureid() + "\">"
                    + " <img src=\"resource/thumbnail/" + list.get(i).getThumbnail() + "\"></a>"
                    + "</div>"
                    + "<div class=\"me-2 pt-2 row\">"
                    + "<a href=\"lecture/select_lecture?lecture=" + list.get(i).getLectureid() + "\" class=\"thumnail-date\">"
                    + strAry[0] + " - " + strAry[1]
                    + "<div class=\"thumnail-explain pt-2\">"
                    + list.get(i).getTitle()
                    + "<div class=\"row justify-content-between pt-3 ps-3\">"
                    + "<div class=\"thumbnail-pirce col-auto\">"
                    + list.get(i).getPrice() + "\\</div>"
                    + "<div class=\"thumbnail-view col-auto\">"
                    + "조회수 " + list.get(i).getSel_count()
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</a>"
                    + "</div>"
                    + "</div>");
        }

        return buffer.toString();
    }

    //조회수 업로드 메소드
    public void updateViews(int lectureId) {
        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            String sql = "UPDATE lecture SET view_count = view_count+1 WHERE lectureid = ? ";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, lectureId);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());
        }
    }

    public boolean uploadMateria(HikariConfiguration dbConfig, String path, MultipartFile materia, String lecid, String id) {
        boolean success = false;
        String sql = "insert into materia values(default, default, ?,?,?)";

        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, FileService.insertFolder(path,
                    materia, lecid, id));
            pstmt.setInt(2, Integer.parseInt(lecid));
            pstmt.setString(3, id);
            if (pstmt.executeUpdate() == 1) {
                success = true;
            } else {
                log.debug("학습자료 입력 실패 host={}, lecture={}", id, lecid);
            }

            if (conn != null) {
                conn.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (rs != null) {
                rs.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }

    public List<MateriaDto> getMateriaList(HikariConfiguration dbConfig, int lectureid) {
        List<MateriaDto> list = new ArrayList<>();
        String sql = "select materiaurl, uploader, date from materia where lectureid=? order by date asc";
        int co = 1;

        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, lectureid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(new MateriaDto(co, rs.getString("materiaurl").substring(rs.getString("materiaurl").lastIndexOf("\\") + 1),
                        rs.getString("uploader"), rs.getString("date")));
                co++;
            }
            Collections.reverse(list);
            if (conn != null) {
                conn.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean delMateriaFile(HikariConfiguration dbConfig, String filepath, String dbpath) {
        boolean success = false;
        String sql = "delete from materia where materiaurl=?";

        try {
            if (FileService.delFile(filepath)) {
                ds = dbConfig.dataSource();
                conn = ds.getConnection();
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, dbpath);
                if (pstmt.executeUpdate() == 1) {
                    success = true;
                } else {
                    log.debug("디비 삭제 실패");
                }
            } else {
                log.debug("파일 삭제 실패");
            }
            if (conn != null) {
                conn.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }

        return success;

    }

    //강의 상세 정보 조회
    public LectureDto SearchlecInfo(int id) {
        LectureDto lec = new LectureDto();
        try {

            int count = 0;
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            //신청자 수

            String sql = "select count(*) as enroll_count from regiclass where lectureid = " + id + " and enroll_state !=2  group by lectureid ";

            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                count = rs.getInt("enroll_count");
            }

            sql = "select * from lecture lec join business_info b on lec.host = b.business_id where lec.lectureid =" + id;

            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                lec.setLectureid(rs.getInt("lectureid"));
                if (rs.getString("thumbnail").equals("")) {
                    lec.setThumbnail("none.png");
                } else {
                    lec.setThumbnail(rs.getString("thumbnail"));
                }
                lec.setTitle(rs.getString("l_title"));
                lec.setText(rs.getString("l_text"));

                if (rs.getString("text_image").equals("")) {
                    lec.setText_image(null);
                } else {
                    lec.setText_image(rs.getString("text_image"));
                }
                lec.setRec_dt(rs.getString("rec_dt"));
                lec.setRec_target(rs.getString("rec_target"));
                lec.setRec_num(rs.getInt("rec_num"));
                lec.setDate(rs.getString("l_date"));
                lec.setKeyword(rs.getString("l_keyword"));
                if (!rs.getString("price").equals("")) {
                    lec.setPrice(rs.getString("price") + " 원");
                } else {
                    lec.setPrice("무료 강의");
                }
                if (rs.getString("agree").equals("0")) {
                    lec.setAgree("선착순 모집");
                } else {
                    lec.setAgree("확인 후 모집");
                }

                lec.setTeacher(rs.getInt("teacher"));
                lec.setTeacher_num(rs.getInt("teacher_num"));
                lec.setStaffe(rs.getInt("staffe"));
                lec.setStaffe_num(rs.getInt("staffe_num"));
                lec.setQual(rs.getString("qualification"));
                lec.setHost(rs.getString("host"));
                lec.setState(rs.getString("l_state"));
                lec.setGrade(rs.getDouble("l_grade"));
                lec.setComname(rs.getString("business_name")); //회사명
                lec.setSel_count(rs.getInt("view_count")); //조회수

            }

            stmt.close();
            conn.close();
            rs.close();
        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());

        }

        return lec;
    }

    //강의 목록 불러오기 - 마이페이지
    // 데이터 불러오기 완료, 참여구분 신청상태 강의 신청에 따라 변경해야함
    // 관련 컨트롤러 SystemController mypage()
    public ArrayList<LectureDto> Listlec(String userid) {

        ArrayList<LectureDto> lec_list = new ArrayList<LectureDto>();

        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select l_title, host, date, user_state, enroll_state from lecture lec join regiclass re on lec.lectureid = re.lectureid where re.userid ='" + userid + "'";
            rs = stmt.executeQuery(sql);
            log.info(sql);

            while (rs.next()) {
                LectureDto lec = new LectureDto();

                lec.setTitle(rs.getString("l_title")); // 과목명
                lec.setHost(rs.getString("host")); // 개설자
                lec.setDate(rs.getString("date")); // 수강 기간
                lec.setUser_state(rs.getString("user_state")); // 참여 구분 
                lec.setEnroll_state(rs.getString("enroll_state")); // 신청 상태
                lec_list.add(lec);
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());
        }
        return lec_list;
    }

    //중복 신청 조회 메소드
    public boolean duplicate(String userid, String date, int lectureid) {
        javax.sql.DataSource ds = dbConfig.dataSource();
        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "select * from regiclass where userid = '" + userid + "' and date = '" + date + "' and lectureid = " + lectureid;
            log.info(sql);
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                return false;
            }

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());
        }
        return true;
    }

    //강의 신청 메소드
    public void ApplyLecutre(String userid, int lectureid, String date, int user_state) {
        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            String sql = "INSERT INTO regiclass VALUES(default,?,?,?,?,default)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, lectureid);
            pstmt.setString(2, userid);
            //pstmt.setInt(2,class_round);
            pstmt.setString(3, date);
            pstmt.setInt(4, user_state);
            pstmt.executeUpdate();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());
        }
    }
    
    public List<RegiClassDto> getRegiList(int lecid){
        List<RegiClassDto> list= new ArrayList<>();
        String sql = "select regiclassid, username, phone ,birth ,date , user_state, enroll_state from regiclass r join userinfo u on r.userid = u.userid where lectureid=?";
        
        int co=1;
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, lecid);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                String regiResult = null;
                switch (rs.getInt("enroll_state")) {
                    case 0:
                        regiResult = "대기";
                        break;
                    case 1:
                        regiResult = "수락";
                        break; 
                    case 2:
                        regiResult = "거절";
                        break;
                    default:
                        break;
                }
                list.add(new RegiClassDto(rs.getString("regiclassid"), rs.getString("username"),
                        rs.getString("phone"),rs.getString("birth"), rs.getString("date"),
                        rs.getInt("user_state"),regiResult));
                co++;
            }
            Collections.reverse(list);
            if (conn != null) {conn.close();}
            if (pstmt != null) { pstmt.close();}
            if (rs != null) {rs.close();}
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        return list;
    } 
    
    //강의 신청에 대해 수락, 거절
    public boolean accept(String agree, String id){
        boolean succes = false;
        String sql = "update regiclass set enroll_state=? where regiclassid=?";
        
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            if(agree.equals("accept")){
                pstmt.setInt(1, 1);
            }else if(agree.equals("refusal")){
                pstmt.setInt(1, 2);
            }
            pstmt.setInt(2,Integer.parseInt(id));
            
            if(pstmt.executeUpdate() == 1){
                succes=true;
                log.debug("신청 상태 변환 = 성공 {}", agree);
            }
            
            if (conn != null) {conn.close();}
        if (pstmt != null) { pstmt.close();}
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        
        return succes;
    }

}
