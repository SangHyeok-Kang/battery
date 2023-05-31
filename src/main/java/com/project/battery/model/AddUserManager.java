
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

        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "SELECT userid FROM userinfo WHERE userid= '" + userid + "'";
            ResultSet rs = stmt.executeQuery(sql);

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

    public void addRow(String userid, String password, String name, String phone,
                       String birthdate, String schoolinfo, String interest, 
                       String postcode, String detail, String extra, String address, String gender) {
        
        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            String sql = "INSERT INTO userinfo VALUES(?,?,?,?,?,?,?,?, DEFAULT)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, name);
            pstmt.setString(3, password);
            pstmt.setString(4, phone);
            pstmt.setString(5, birthdate);
            pstmt.setString(6, schoolinfo);
            pstmt.setString(7, interest);
            pstmt.setString(8, gender);

            pstmt.executeUpdate();

            sql = "INSERT INTO address VALUES(?,?,?,?,?,?)";
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

    public void addRow(String userid, String password, String name, String phone, String com_name, String postcode, String detail, String address, String extra) {
        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            String sql = "INSERT INTO business_info VALUES(?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userid);
            pstmt.setString(2, password);
            pstmt.setString(3, com_name);
            pstmt.setString(4, name);
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
