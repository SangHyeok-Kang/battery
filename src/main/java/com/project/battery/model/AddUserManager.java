package com.project.battery.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import lombok.extern.slf4j.Slf4j;

/**
 *
 * @author host
 */
@Slf4j
public class AddUserManager {

    private HikariConfiguration dbConfig;

    public AddUserManager(HikariConfiguration dbConfig) {
        this.dbConfig = dbConfig;
    }

    //일반 사용자 아이디 체크 메소드
    public boolean checkId(String userid) {
        javax.sql.DataSource ds = dbConfig.dataSource();
        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "SELECT userid FROM userinfo WHERE userid= '" + userid + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                String user = rs.getString("userid");
                return false;
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
        return true;
    }

    //비지니스 사용자 아이디 체크 메소드
    public boolean check_bId(String userid) {
        javax.sql.DataSource ds = dbConfig.dataSource();
        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "SELECT business_id FROM business_info WHERE business_id= '" + userid + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                String user = rs.getString("business_id");
                return false;
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
        return true;
    }

    // 일반 사용자 회원가입
    public void addRow(String userid, String username, String password, String phone,
            String birth, String attendingInfo, String u_keyword,
            String postcode, String detail, String extra, String address, String gender) {

        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            String sql = "INSERT INTO userinfo VALUES(?,?,?,?,?,?,?,?,DEFAULT,DEFAULT)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, username);
            pstmt.setString(3, password);
            pstmt.setString(4, phone);
            pstmt.setString(5, birth);
            pstmt.setString(6, attendingInfo);
            pstmt.setString(7, u_keyword);
            pstmt.setString(8, gender);

            pstmt.executeUpdate();
            
            sql = "INSERT INTO address VALUES(default,?,?,?,?,?,0)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, postcode);
            pstmt.setString(3, address);
            pstmt.setString(4, detail);
            pstmt.setString(5, extra);        
           

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());
        }
    }

    // 비즈니스 회원가입
    public void b_addRow(String userid, String password, String business_name, String phone, String ceo_name, String b_keyword, String postcode, String detail, String address, String extra) {
        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            String sql = "INSERT INTO business_info VALUES(?,?,?,?,?,?,1,default)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, password);
            pstmt.setString(3, business_name);
            pstmt.setString(4, ceo_name);
            pstmt.setString(5, phone);
            pstmt.setString(6, b_keyword);
            

            pstmt.executeUpdate();

            sql = "INSERT INTO address VALUES(default,?,?,?,?,?,1)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, postcode);
            pstmt.setString(3, address);
            pstmt.setString(4, detail);
            pstmt.setString(5, extra);           

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());
        }
    }
     
}
