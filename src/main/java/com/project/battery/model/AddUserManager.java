
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

    public boolean checkId(String userid) {
        javax.sql.DataSource ds = dbConfig.dataSource();
        System.out.println("sadffff");
        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "SELECT userid FROM userinfo WHERE userid= '" + userid + "'";
            ResultSet rs = stmt.executeQuery(sql);
            System.out.println(sql);
            if (rs.next()) {
                String user = rs.getString("userid");
                System.out.println(user);
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

    public void addRow(String userid, String username, String password, String phone,
                       String birth, String attendingInfo, String u_keyword, 
                       String postcode, String detail, String extra, String address, String gender) {
        
        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            String sql = "INSERT INTO userinfo VALUES(?,?,?,?,?,?,?,?, DEFAULT)";
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

            sql = "INSERT INTO address VALUES(defalut,?,?,?,?,?,0)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, postcode);
            pstmt.setString(3, address);
            pstmt.setString(4, detail);
            pstmt.setString(5, extra);
            pstmt.setInt(6, 0);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());
        }
    }

    public void addRow(String userid, String password, String business_name, String phone, String ceo_name, String postcode, String detail, String address, String extra) {
        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            String sql = "INSERT INTO business_info VALUES(?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, password);
            pstmt.setString(3, business_name);
            pstmt.setString(4, ceo_name);
            pstmt.setString(5, phone);

            pstmt.executeUpdate();

            sql = "INSERT INTO address VALUES(?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, postcode);
            pstmt.setString(3, address);
            pstmt.setString(4, detail);
            pstmt.setString(5, extra);
            pstmt.setInt(6, 1);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생오류: {})", ex.getMessage());
        }
    }
    
    
}
