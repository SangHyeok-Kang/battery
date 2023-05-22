/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 *
 * @author qntjd
 */
@Slf4j
@RequiredArgsConstructor
public class Notice {
    @NonNull@Getter@Setter private String lectureid;
    @NonNull@Getter@Setter private String title;
    @NonNull@Getter@Setter private String text;
    @NonNull@Getter@Setter private String date;
    @NonNull@Getter@Setter private String writer;
    @NonNull@Getter@Setter private String file;
    
    DataSource ds = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    public boolean insertNotice(Notice notice, HikariConfiguration dbConfig){

        boolean success = false;
        String sql = "INSERT INTO notice values (default,?,?,?,default,?,?)";

        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,Integer.parseInt(notice.getLectureid()));
            pstmt.setString(2, notice.getTitle());
            pstmt.setString(3,notice.getText());
            pstmt.setString(4,notice.getWriter());
            pstmt.setString(5,notice.getFile());
            
            if(pstmt.executeUpdate() == 1){
                //공지사항 입력 성공
                System.out.println("입력 성공");
                success = true;
            }else{
                System.out.println("입력 실패");
                //공지사항 입력 실패
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            //연결 중 오류
        }finally{
            try {
                if(conn!=null){conn.close();}
                if(pstmt!=null){pstmt.close();}
                if(rs!=null){rs.close();}
            }catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                    //DB연결 닫기 실패
            }
        }
        return success;
    }
}
