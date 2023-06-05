/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import lombok.AllArgsConstructor;
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

    // 리뷰 등록
    // 강의 아이디 : 세션값 /  강사 아이디 : staff테이블에서 s_state가 0인 userid / 스탭 아이디 : staff테이블에서 s_state가 1인 userid / 기업 아이디 : lecture테이블에서 host
    public boolean insertReview(HikariConfiguration dbConfig, int lectureId, String userId, int lectureGrade, String lectureReview, int instructorGrade, String instructorReview, int staffGrade, String staffReview, int businessGrade, String businessReview) throws SQLException {
        boolean status = false;

        String searchSql = "SELECT userid, s_state FROM staffe where lectureid = ?";  // 해당 강의의 강사, 스탭 아이디 찾는 sql문 
        String searchHostSql = "SELECT host FROM lecture WHERE lectureid = ?";  // 해당 강의의 기업 아이디 찾는 sql문 

        String sql = "INSERT INTO review(id, writer, userstate, review, grade) values (?,?,?,?,?)";  // 리뷰 insert문 

        List<Integer> instructorIdList = new ArrayList<>();
        List<Integer> staffIdList = new ArrayList<>();
        String businessId = null;

        try {

            ds = dbConfig.dataSource();
            conn = ds.getConnection();

            pstmt = conn.prepareStatement(searchSql);
            pstmt.setInt(1, lectureId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String userid = rs.getString("userid");
                int s_state = rs.getInt("s_state");
                // System.out.println("User ID: " + userid + ", S_State: " + s_state);

                // 강사 아이디 (s_state가 0인 경우)
                if (s_state == 0) {
                    instructorIdList.add(Integer.parseInt(userid));
                } // 스탭 아이디 (s_state가 1인 경우)
                else if (s_state == 1) {
                    staffIdList.add(Integer.parseInt(userid));
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
            pstmt.setInt(1, lectureId);  // 강의 아이디
            pstmt.setString(2, userId);  // 작성자 아이디 
            pstmt.setInt(3, 1);  // state
            pstmt.setString(4, lectureReview);  // 강의 리뷰 
            pstmt.setInt(5, lectureGrade);  // 강의 별점 
            pstmt.addBatch();  // addBatch에 담기
            pstmt.clearParameters();  // 파라미터 clear

            // 강사 리뷰
            for (int instructorId : instructorIdList) {
                pstmt.setInt(1, instructorId);  // 강사 아이디 
                pstmt.setString(2, userId);  // 작성자 아이디 
                pstmt.setInt(3, 0);  // state
                pstmt.setString(4, instructorReview);  // 강사 리뷰 
                pstmt.setInt(5, instructorGrade);  // 강사 별점 
                pstmt.addBatch();
                pstmt.clearParameters();
            }

            // 스태프 리뷰
            for (int staffId : staffIdList) {
                pstmt.setInt(1, staffId);  // 스탭 아이디 
                pstmt.setString(2, userId);  // 작성자 아이디 
                pstmt.setInt(3, 0);  // state
                pstmt.setString(4, staffReview);  // 스탭 리뷰 
                pstmt.setInt(5, staffGrade);  // 스탭 별점 
                pstmt.addBatch();
                pstmt.clearParameters();
            }

            // 기업 리뷰 
            pstmt.setString(1, businessId);  // 기업 아이디 
            pstmt.setString(2, userId);  // 작성자 아이디 
            pstmt.setInt(3, 0);  // state
            pstmt.setString(4, businessReview);  // 기업 리뷰 
            pstmt.setInt(5, businessGrade);  // 기업 별점 
            pstmt.addBatch();  // addBatch에 담기
            pstmt.clearParameters();  // 파라미터 clear

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
}
