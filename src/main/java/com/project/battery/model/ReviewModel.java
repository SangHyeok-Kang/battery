/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import com.project.battery.dto.ReviewDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/**
 *
 * @author parkchaebin
 */
@Slf4j
@NoArgsConstructor
@Service
@Component
@PropertySource("classpath:/application.properties")
public class ReviewModel {

    DataSource ds = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 리뷰 등록 (별점 또는 리뷰 하나라도 작성되면 리뷰 추가 (별점 선택 안된 경우 -1 값으로 데이터베이스 저장)
    // 강의 아이디 : 세션값 /  강사 아이디 : staffe테이블에서 user_state가 0인 userid / 스탭 아이디 : staff테이블에서 user_state가 1인 userid / 기업 아이디 : lecture테이블에서 host
    public boolean insertReview(HikariConfiguration dbConfig, int lectureId, String userId, int lectureGrade, String lectureReview, int instructorGrade, String instructorReview, int staffGrade, String staffReview, int businessGrade, String businessReview) throws SQLException {
        boolean status = false;

        String searchSql = "SELECT userid, user_state FROM staffe where lectureid = ?";  // 해당 강의의 강사, 스탭 아이디 찾는 sql문 
        String searchHostSql = "SELECT host FROM lecture WHERE lectureid = ?";  // 해당 강의의 기업 아이디 찾는 sql문 

        String sql = "INSERT INTO review(id, writer, userstate, review, grade) values (?,?,?,?,?)";  // 리뷰 insert문 

        List<String> instructorIdList = new ArrayList<>();
        List<String> staffIdList = new ArrayList<>();
        String businessId = null;

        try {

            ds = dbConfig.dataSource();
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(searchSql);
            pstmt.setInt(1, lectureId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String userid = rs.getString("userid");
                int user_state = rs.getInt("user_state");
                // System.out.println("User ID: " + userid + ", S_State: " + s_state);

                // 강사 아이디 (user_state가 0인 경우)
                if (user_state == 0) {
                    instructorIdList.add(userid);
                } // 스탭 아이디 (user_state가 1인 경우)
                else if (user_state == 1) {
                    staffIdList.add(userid);
                }
            }

            pstmt = conn.prepareStatement(searchHostSql);
            pstmt.setInt(1, lectureId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                businessId = rs.getString("host");  // 기업 아이디 
            }

            pstmt = conn.prepareStatement(sql);

            // 강의 리뷰
            if (lectureGrade > 0 || !lectureReview.isEmpty()) {
                pstmt.setInt(1, lectureId);  // 강의 아이디
                pstmt.setString(2, userId);  // 작성자 아이디 
                pstmt.setInt(3, 1);  // state
                pstmt.setString(4, lectureReview);  // 강의 리뷰 
                pstmt.setInt(5, lectureGrade);  // 강의 별점 
                pstmt.addBatch();  // addBatch에 담기
                pstmt.clearParameters();  // 파라미터 clear
            }

            // 강사 리뷰
            for (String instructorId : instructorIdList) {
                if (instructorGrade > 0 || !instructorReview.isEmpty()) {
                    pstmt.setString(1, instructorId);  // 강사 아이디 
                    pstmt.setString(2, userId);  // 작성자 아이디 
                    pstmt.setInt(3, 0);  // state
                    pstmt.setString(4, instructorReview);  // 강사 리뷰 
                    pstmt.setInt(5, instructorGrade);  // 강사 별점 
                    pstmt.addBatch();
                    pstmt.clearParameters();
                }
            }

            // 스태프 리뷰
            for (String staffId : staffIdList) {
                if (staffGrade > 0 || !staffReview.isEmpty()) {
                    pstmt.setString(1, staffId);  // 스탭 아이디 
                    pstmt.setString(2, userId);  // 작성자 아이디 
                    pstmt.setInt(3, 0);  // state
                    pstmt.setString(4, staffReview);  // 스탭 리뷰 
                    pstmt.setInt(5, staffGrade);  // 스탭 별점 
                    pstmt.addBatch();
                    pstmt.clearParameters();
                }
            }

            // 기업 리뷰 
            if (businessGrade > 0 || !businessReview.isEmpty()) {
                pstmt.setString(1, businessId);  // 기업 아이디 
                pstmt.setString(2, userId);  // 작성자 아이디 
                pstmt.setInt(3, 0);  // state
                pstmt.setString(4, businessReview);  // 기업 리뷰 
                pstmt.setInt(5, businessGrade);  // 기업 별점 
                pstmt.addBatch();  // addBatch에 담기
                pstmt.clearParameters();  // 파라미터 clear
            }

            pstmt.executeBatch();   // Batch 실행

            status = true;

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류 : {})", ex.getMessage());
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return status;
    }
    
    //강의, 사용자 아이디에 할당된 리뷰를 가져오는 함수
    public List<ReviewDto> getReviewList(HikariConfiguration dbConfig, String id){
        List<ReviewDto> list = new ArrayList<>(); 
        String sql = "select review, grade, date from review where id=? and userstate=1 order by date asc";
        int co = 1;
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                list.add(new ReviewDto(co, rs.getString("review"),rs.getString("date").split(" ")[0],rs.getInt("grade")));
                co++;
            }
            
            Collections.reverse(list);
            if (conn != null) {conn.close();}
            if (pstmt != null) {pstmt.close();}
            if (rs != null) {rs.close();}
        } catch (SQLException ex) {
            Logger.getLogger(ReviewModel.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
}
