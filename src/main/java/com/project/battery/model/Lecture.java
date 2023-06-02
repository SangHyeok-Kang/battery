/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import com.project.battery.dto.LectureDto;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author qntjd
 */
@Slf4j
@NoArgsConstructor
public class Lecture {
    
    @Getter@Setter private String thumnail = null; //1. 썸네일 url
    @Getter@Setter private String title= null; //2. 강의명
    @Getter@Setter private String text= null; // 3. 강의 내용
    @Getter@Setter private String text_image= null; // 4. 강의 내용
    @Getter@Setter private String postcode= null; //장소
    @Getter@Setter private String address= null; 
    @Getter@Setter private String detail= null;
    @Getter@Setter private String extra= null;
    @Getter@Setter private String rec_dt= null; //5. 모집기간
    @Getter@Setter private String rec_target= null; //6. 모집 대상
    @Getter@Setter private int rec_num = 0; // 7. 모집 인원
    @Getter@Setter private String datelist= null; // 8. 교육 기간
    @Getter@Setter private String keyword= null; // 9. 키워드
    @Getter@Setter private String price= null; // 10. 가격
    @Getter@Setter private int agree = 0; // 11. 자동 수락 동의
    @Getter@Setter private int teacher = 0; // 12. 강사 모집
    @Getter@Setter private int teacher_num = 0;//13. 강사 인원 수
    @Getter@Setter private int staffe = 0; // 14. 스탭 모집
    @Getter@Setter private int staffe_num = 0;//15. 스탭 인원 수
    @Getter@Setter private String qualification= null; //16.모집 조건 작성
    @Getter@Setter private String resume= null; //18.모집 조건 작성
    @Getter@Setter private String host= null; // 19. 지원서 양식
    @Getter@Setter private Double grade = 0.0; // 20. 별점
    
    DataSource ds = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    private HikariConfiguration dbConfig;
    ArrayList<LectureDto> list = new ArrayList<LectureDto>();

    public Lecture(HikariConfiguration dbConfig) {
        this.dbConfig = dbConfig;
    }
    
    public Boolean insertLecture(HikariConfiguration dbConfig, Lecture lecture){
        boolean success=false;
        String sql = "INSERT INTO lecture values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,0)";
        String addressSQL = "INSERT INTO address values (default,?,?,?,?,?,1)";
        
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            conn.setAutoCommit(false);
            pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            
            pstmt.setString(1, lecture.getThumnail());
            pstmt.setString(2, lecture.getTitle());
            pstmt.setString(3, lecture.getText());
            pstmt.setString(4, lecture.getText_image());
            pstmt.setString(5, lecture.getRec_dt());
            pstmt.setString(6,lecture.getRec_target());
            pstmt.setInt(7,lecture.getRec_num());
            pstmt.setString(8,lecture.getDatelist());
            pstmt.setString(9,lecture.getKeyword());
            pstmt.setString(10,lecture.getPrice());
            pstmt.setInt(11, lecture.getAgree());
            pstmt.setInt(12,lecture.getTeacher());
            pstmt.setInt(13,lecture.getTeacher_num());
            pstmt.setInt(14,lecture.getStaffe());
            pstmt.setInt(15,lecture.getStaffe_num());
            pstmt.setString(16, lecture.getQualification());
            pstmt.setString(17, lecture.getResume());
            pstmt.setString(18,lecture.getHost());
            
            if( pstmt.executeUpdate() == 1){
                rs = pstmt.getGeneratedKeys();
                if(rs.next()){
                    pstmt = conn.prepareStatement(addressSQL);
                    pstmt.setInt(1, rs.getInt(1));
                    pstmt.setString(2,lecture.getPostcode());
                    pstmt.setString(3,lecture.getAddress());
                    pstmt.setString(4,lecture.getDetail());
                    pstmt.setString(5,lecture.getExtra());
                    
                    if(pstmt.executeUpdate() == 1){
                        log.debug("강의 입력 성공 host={}, titlt={}",lecture.getHost(),lecture.getTitle());
                        success=true;
                    }else{
                        log.debug("강의 주소 정보 입력 실패 host={}, titlt={}",lecture.getHost(),lecture.getTitle());
                    }
                }
            }else{
                log.debug("강의 정보 입력 실패 host={}, titlt={}",lecture.getHost(),lecture.getTitle());
            }
        } catch (SQLException ex) {
           log.debug("강의 입력 실패 SqlError = {}",ex.getMessage());
        }finally{
            try {
                if(success){conn.commit();}else{conn.rollback();}
                conn.setAutoCommit(true);
                if(conn!=null){conn.close();}
                if(pstmt!=null){pstmt.close();}
                if(rs!=null){rs.close();}
            }catch (SQLException ex) {
                    Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return success;
    }
    
    public ArrayList<LectureDto> getLecture(){
        javax.sql.DataSource ds = dbConfig.dataSource();
        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM lecture ";
            ResultSet rs = stmt.executeQuery(sql);


            while (rs.next()) {
                LectureDto lec = new LectureDto();
                lec.setLectureid(rs.getInt("lectureid"));
                lec.setThumbnail(rs.getString("thumbnail"));
                lec.setL_title(rs.getString("l_title"));
                lec.setL_text(rs.getString("l_text"));
                lec.setText_image(rs.getString("text_image"));
                lec.setRec_dt(rs.getString("rec_dt"));
                lec.setRec_target(rs.getString("rec_target"));
                lec.setRec_num(rs.getString("rec_num"));
                lec.setL_date(rs.getString("l_date"));
                lec.setL_keyword(rs.getString("l_keyword"));
                lec.setPrice(rs.getString("price"));
                lec.setAgree(rs.getInt("agree"));
                lec.setTeacher(rs.getInt("teacher"));
                lec.setTeacher_num(rs.getInt("teacher_num"));
                lec.setStaffe(rs.getInt("staffe"));
                lec.setStaffe_num(rs.getInt("staffe_num"));
                lec.setQual(rs.getString("qualification"));
                lec.setHost(rs.getString("host"));
                lec.setL_state(rs.getString("l_state"));
                lec.setL_grade(rs.getString("l_grade"));
                list.add(lec);
                
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());

        }
        
        return list;
    }
    
    public String getLectureTable(ArrayList<LectureDto> list){

        StringBuilder buffer = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            String str = list.get(i).getL_date();
            String[] strAry =  str.split("%");
            
            buffer.append("<div class=\"swiper-slide\">"
                    + "<div class =\"card_thumbnail\">"
                    + " <a href=\"lecture/lecture_notice?lecture="+list.get(i).getLectureid()+"\">"
                    + " <img src=\"assets/img/"+list.get(i).getThumbnail()+"\"></a>"
                    + "</div>"
                    + "<div class=\"me-2 pt-2 row\">"
                    + "<a href=\"lecture/lecture_notice?lecture="+list.get(i).getLectureid()+"\" class=\"thumnail-date\">"
                    + strAry[0] + " - " +strAry[1]
                    + "<div class=\"thumnail-explain pt-2\">"
                    + list.get(i).getL_title()
                    + "<div class=\"row justify-content-between pt-3 ps-3\">"
                    + "<div class=\"thumbnail-pirce col-auto\">"
                    + list.get(i).getPrice()+"\\</div>"
                    + "<div class=\"thumbnail-view col-auto\">"
                    + "조회수 "+list.get(i).getSel_count()
                    +"</div>"
                    +"</div>"
                    +"</div>"
                    +"</a>"
                    +"</div>"
                    +"</div>");   
        }

        return buffer.toString();
    }
}


