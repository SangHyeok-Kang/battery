/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import java.sql.*;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 *
 * @author host
 */
@Slf4j
public class loginModel {

    @Getter
    @Setter
    private String user;
    @Getter
    @Setter
    private int state;
    @Getter
    @Setter
    private String name;
    @Getter
    @Setter
    private String phone;
    @Getter
    @Setter
    private String postcode;
    @Getter
    @Setter
    private String address;
    @Getter
    @Setter
    private String detail;
    @Getter
    @Setter
    private String extra;
    @Getter
    @Setter
    private String com_name;

    private HikariConfiguration dbConfig;

    public loginModel(HikariConfiguration dbConfig) {
        this.dbConfig = dbConfig;
    }

    public boolean loginResult(String chkstate, String userid, String password) {
        String sql;
        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            if (chkstate.equals("user")) {
                sql = "SELECT * FROM userinfo u join address a on u.userid = a.id WHERE userid= '" + userid + "' and password = '" + password + "' and state = 0";
                log.info(sql);
                ResultSet rs = stmt.executeQuery(sql);

                if (rs.next()) {
                    setUser(rs.getString("u.userid"));
                    setState(rs.getInt("a.state"));
                    setName(rs.getString("u.username"));
                    setPhone(rs.getString("u.phone"));
                    setPostcode(rs.getString("a.postcode"));
                    setAddress(rs.getString("a.address"));
                    setDetail(rs.getString("a.detail"));
                    setExtra(rs.getString("a.extra"));

                    return true;
                }
                rs.close();
                stmt.close();
                conn.close();
            } else {
                sql = "SELECT * FROM business_info b join address a on b.business_id = a.id WHERE business_id= '" + userid + "' and password = '" + password + "' and a.state = 1";

                ResultSet rs = stmt.executeQuery(sql);

                if (rs.next()) {
                    setUser(rs.getString("b.business_id"));
                    setState(rs.getInt("a.state"));
                    setCom_name(rs.getString("b.business_name"));
                    setName(rs.getString("b.ceo_name"));
                    setPhone(rs.getString("b.phone"));
                    setPostcode(rs.getString("a.postcode"));
                    setAddress(rs.getString("a.address"));
                    setDetail(rs.getString("a.detail"));
                    setExtra(rs.getString("a.extra"));
                    return true;
                }
                rs.close();
                stmt.close();
                conn.close();
            }

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
        return false;
    }

    // 아이디 찾기
    public userInfo findIdResult(String name, String phone) {

        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "SELECT username, userid, password, phone FROM userinfo WHERE username='" + name + "' AND phone='" + phone + "'";
            ResultSet rs = stmt.executeQuery(sql);
            log.info(sql);

            if (rs.next()) {

                String userName = rs.getString("username");
                String userId = rs.getString("userid");
                String userPw = rs.getString("password");
                String userPhone = rs.getString("phone");

                userInfo user = new userInfo(userName, userId, userPw, userPhone);

                return user;
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
        return null;
    }

    // 비밀번호 찾기
    public userInfo findPwResult(String userid, String name, String phone) {

        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "SELECT username, userid, password, phone FROM userinfo WHERE userid='" + userid + "' AND username='" + name + "' AND phone='" + phone + "'";
            ResultSet rs = stmt.executeQuery(sql);
            log.info(sql);

            if (rs.next()) {

                String userName = rs.getString("username");
                String userId = rs.getString("userid");
                String userPw = rs.getString("password");
                String userPhone = rs.getString("phone");

                userInfo user = new userInfo(userName, userId, userPw, userPhone);

                return user;
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
        return null;
    }

    // 회원정보 변경
    public void changeInfo(String userid, String password, String phone, String postcode, String address, String detail, String extra) {

        javax.sql.DataSource ds = dbConfig.dataSource();
       
        try {
            Connection conn = ds.getConnection();
            String sql = "UPDATE userinfo SET password = ?, phone = ? WHERE userid = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, password);
            pstmt.setString(2, phone);
            pstmt.setString(3, userid);
            pstmt.executeUpdate();
            pstmt.close();

            sql = "UPDATE address SET postcode = ?, address = ?, detail= ?, extra = ? WHERE id = ? ";
            pstmt = conn.prepareStatement(sql);   
            pstmt.setString(1, postcode);
            pstmt.setString(2, address);
            pstmt.setString(3, detail);
            pstmt.setString(4, extra);
            pstmt.setString(5, userid);

            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
    }

    //회원탈퇴 메소드
    public void DelUser(String userid, int state) {
        javax.sql.DataSource ds = dbConfig.dataSource();
        try {
            Connection conn = ds.getConnection();
            if (state == 0) {
                String sql = "DELETE FROM user_info where userid = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userid);
                log.info(sql);
                pstmt.executeUpdate();

                pstmt.close();
                conn.close();
                
            }else{
                String sql = "DELETE FROM business_info where business_id = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userid);
                log.info(sql);
                pstmt.executeUpdate();

                pstmt.close();
                conn.close();
            }
        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
    }
}
