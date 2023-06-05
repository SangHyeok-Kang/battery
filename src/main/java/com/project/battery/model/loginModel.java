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
                sql = "SELECT userid, password, username FROM userinfo WHERE userid= '" + userid + "' and password = '" + password + "'";

                ResultSet rs = stmt.executeQuery(sql);

                if (rs.next()) {
                    this.setUser(rs.getString("userid"));
                    this.setState(0);
                    this.setName(rs.getString("username"));
                    return true;
                }
                rs.close();
                stmt.close();
                conn.close();
            } else {
                sql = "SELECT business_id, password, business_name FROM business_info WHERE business_id= '" + userid + "' and password = '" + password + "'";

                ResultSet rs = stmt.executeQuery(sql);

                if (rs.next()) {
                    setUser(rs.getString("business_id"));
                    setState(1);
                    this.setName(rs.getString("business_name"));
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

    // 비밀번호 변경
    public void changePw(String userid, String password) {

        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "UPDATE userinfo SET password = '" + password + "' WHERE (userid = '" + userid + "')";
            log.info(sql);
            stmt.executeUpdate(sql);

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }

    }

    public void setState(int state) {
        this.state = state;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getUser() {
        return user;
    }

    public int getState() {
        return state;
    }

}
