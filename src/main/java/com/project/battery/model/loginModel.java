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

    @Getter@Setter private String user;
    @Getter@Setter private int state;
    @Getter@Setter private String name;
    private HikariConfiguration dbConfig;

    public loginModel(HikariConfiguration dbConfig) {
        this.dbConfig = dbConfig;
    }

    public boolean loginResult(String chkstate, String userid, String password) {

        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            if (chkstate.equals("user")) {
                String sql = "SELECT userid, password, username FROM userinfo WHERE userid= '" + userid + "'";
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
            }else{
                String sql = "SELECT business_id, password, business_name FROM business_info WHERE business_id= '" + userid + "'";
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

}
