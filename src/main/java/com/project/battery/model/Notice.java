/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

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
import lombok.Getter;
import lombok.NoArgsConstructor;
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
@NoArgsConstructor
public class Notice {
    @NonNull@Getter@Setter private String lectureid;
    @NonNull@Getter@Setter private String title;
    @NonNull@Getter@Setter private String text;
    @NonNull@Getter@Setter private String date;
    @NonNull@Getter@Setter private String writer;
    @NonNull@Getter@Setter private String file;
    @Getter private int co;
    DataSource ds = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    //공지사항 헤더 목록을 불러오기 위한 생성자
    public Notice(int co,String title, String date, String writer) {
        this.co = co;
        this.title = title;
        this.date = date;
        this.writer = writer;
    }
    
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
            }catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                    //DB연결 닫기 실패
            }
        }
        return success;
    }
    
    
    public List<Notice> getNoticeList(String id,HikariConfiguration dbConfig){
        List<Notice> list = new ArrayList<>();
        String sql = "select n_title, n_date, writer from notice where lectureid=? order by n_date";
        co = 1;
        
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            ds = dbConfig.dataSource();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,Integer.parseInt(id));
            rs = pstmt.executeQuery();
            
            while(rs.next()){
               list.add(new Notice(co,rs.getString("n_title"),rs.getString("n_date"),rs.getString("writer")));
               co++;
            }
            Collections.reverse(list);//리스트를 역순으로 변환하는 함수
            if(conn!=null){conn.close();}
            if(pstmt!=null){pstmt.close();}
            if(rs!=null){rs.close();}
        } catch (SQLException ex) {
            Logger.getLogger(Notice.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }
}
