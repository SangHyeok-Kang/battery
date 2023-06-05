/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;


import com.project.battery.dto.LectureDto;
import com.project.battery.dto.MateriaDto;
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
    ArrayList<LectureDto> list = new ArrayList<LectureDto>();

    public Lecture(HikariConfiguration dbConfig) {
        this.dbConfig = dbConfig;
    }
    
    public Boolean insertLecture(HikariConfiguration dbConfig, LectureDto lecture,MultipartFile thumnail,MultipartFile text_image,MultipartFile resume, String[] path){
        boolean success=false;
        String sql = "INSERT INTO lecture values (default,default,?,?,default,?,?,?,?,?,?,?,?,?,?,?,?,default,?,default,0,0)";
        String addressSQL = "INSERT INTO address values (default,?,?,?,?,?,1)";
        String updateFileFathSql = "update lecture set thumbnail=?, text_image=?, resume=? where lectureid=?";
        
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            conn.setAutoCommit(false);
            pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            
            pstmt.setString(1, lecture.getTitle());
            pstmt.setString(2, lecture.getText());
            pstmt.setString(3, lecture.getRec_dt());
            pstmt.setString(4,lecture.getRec_target());
            pstmt.setInt(5,lecture.getRec_num());
            pstmt.setString(6,lecture.getDate());
            pstmt.setString(7,lecture.getKeyword());
            pstmt.setString(8,lecture.getPrice());
            pstmt.setInt(9, lecture.getAgree());
            pstmt.setInt(10,lecture.getTeacher());
            pstmt.setInt(11,lecture.getTeacher_num());
            pstmt.setInt(12,lecture.getStaffe());
            pstmt.setInt(13,lecture.getStaffe_num());
            pstmt.setString(14, lecture.getQual());
            pstmt.setString(15,lecture.getHost());
            
            if( pstmt.executeUpdate() == 1){
                rs = pstmt.getGeneratedKeys();
                
                if(rs.next()){
                    pstmt = conn.prepareStatement(updateFileFathSql);
                    pstmt.setString(1, FileService.insertFolder(path[0],thumnail, Integer.toString(rs.getInt(1)),lecture.getHost()));
                    pstmt.setString(2, FileService.insertFolder(path[1],text_image, Integer.toString(rs.getInt(1)),lecture.getHost()));
                    pstmt.setString(3, FileService.insertFolder(path[2],resume, Integer.toString(rs.getInt(1)),lecture.getHost()));
                    pstmt.setInt(4, rs.getInt(1));
                    if(pstmt.executeUpdate() == 1){
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
                    }else{
                        log.debug("파일 정보 입력 실패 host={}, titlt={}",lecture.getHost(),lecture.getTitle());
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
    
    //비즈니스 아이디로 개설한 모든 강의 헤더 정보 가져오기
    public List<LectureDto> getCreateLectureList(String id, String state){
        List<LectureDto> list = new ArrayList<>();
        String sql = "SELECT lectureid, thumbnail, l_title, l_date FROM lecture where host=? and l_state=?";
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString( 1, id);
            pstmt.setString(2, state);
            rs = pstmt.executeQuery();
            while(rs.next()){
                String thumbnail = rs.getString("thumbnail");
                if(thumbnail.equals("")){
                    thumbnail = "none.png";
                }
                list.add(new LectureDto(rs.getInt("lectureid"),thumbnail, rs.getString("l_title"),rs.getString("l_date")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    // 전체 강의 리스트 가져오기
    public ArrayList<LectureDto> getLecture(){
        
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM lecture";
            rs = stmt.executeQuery(sql);


            while (rs.next()) {
                LectureDto lec = new LectureDto();
                lec.setLectureid(rs.getInt("lectureid"));
                lec.setThumbnail(rs.getString("thumbnail"));
                lec.setTitle(rs.getString("l_title"));
                lec.setText(rs.getString("l_text"));
                lec.setText_image(rs.getString("text_image"));
                lec.setRec_dt(rs.getString("rec_dt"));
                lec.setRec_target(rs.getString("rec_target"));
                lec.setRec_num(rs.getInt("rec_num"));
                lec.setDate(rs.getString("l_date"));
                lec.setKeyword(rs.getString("l_keyword"));
                lec.setPrice(rs.getString("price"));
                lec.setAgree(rs.getInt("agree"));
                lec.setTeacher(rs.getInt("teacher"));
                lec.setTeacher_num(rs.getInt("teacher_num"));
                lec.setStaffe(rs.getInt("staffe"));
                lec.setStaffe_num(rs.getInt("staffe_num"));
                lec.setQual(rs.getString("qualification"));
                lec.setHost(rs.getString("host"));
                lec.setState(rs.getString("l_state"));
                lec.setGrade(rs.getDouble("l_grade"));
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
            String str = list.get(i).getDate();
            String[] strAry =  str.split("%");
            
            buffer.append("<div class=\"swiper-slide\">"
                    + "<div class =\"card_thumbnail\">"
                    + " <a href=\"lecture/lecture_notice?lecture="+list.get(i).getLectureid()+"\">"
                    + " <img src=\"resource/thumbnail/"+list.get(i).getThumbnail()+"\"></a>"
                    + "</div>"
                    + "<div class=\"me-2 pt-2 row\">"
                    + "<a href=\"lecture/lecture_notice?lecture="+list.get(i).getLectureid()+"\" class=\"thumnail-date\">"
                    + strAry[0] + " - " +strAry[1]
                    + "<div class=\"thumnail-explain pt-2\">"
                    + list.get(i).getTitle()
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
    public boolean uploadMateria(HikariConfiguration dbConfig,String path, MultipartFile materia, String lecid, String id){
        boolean success=false;
        String sql = "insert into materia values(default, default, ?,?,?)";
        
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, FileService.insertFolder(path,
                                        materia, lecid, id));
            pstmt.setInt(2, Integer.parseInt(lecid));
            pstmt.setString(3, id);
            if(pstmt.executeUpdate() == 1){
                success = true;
            }else{
                log.debug("학습자료 입력 실패 host={}, lecture={}",id,lecid);
            }
       
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }
    
    public List<MateriaDto> getMateriaList(HikariConfiguration dbConfig, int lectureid){
        List<MateriaDto> list = new ArrayList<>();
        String sql = "select materiaurl, uploader, date from materia where lectureid=? order by date asc";
        int co = 1;
        
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, lectureid);
            rs = pstmt.executeQuery();
            while(rs.next()){
                list.add(new MateriaDto(co, rs.getString("materiaurl").substring(rs.getString("materiaurl").lastIndexOf("\\")+1),
                        rs.getString("uploader"),rs.getString("date")));
                co++;
            }
            Collections.reverse(list);
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public  boolean delMateriaFile(HikariConfiguration dbConfig, String filepath, String dbpath){
        boolean success = false;
        String sql = "delete from materia where materiaurl=?";
        
        try {
            if(FileService.delFile(filepath)){
                ds = dbConfig.dataSource();
                conn = ds.getConnection();
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, dbpath);
                if(pstmt.executeUpdate()==1){
                    success = true;
                }else{
                    log.debug("디비 삭제 실패");
                }
            }else{
                log.debug("파일 삭제 실패");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Lecture.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        return success;

    }
}


