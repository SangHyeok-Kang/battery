/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author host
 */
@Slf4j
public class loginModel {
    private String user;
    private HikariConfiguration dbConfig;

    public loginModel(HikariConfiguration dbConfig) {
        this.dbConfig = dbConfig;
    }

    public boolean loginResult(String userid, String password) {

        javax.sql.DataSource ds = dbConfig.dataSource();

        try {
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            stmt = conn.createStatement();
            String sql = "SELECT userid, password FROM userinfo WHERE userid= '" + userid + "'";
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                String user = rs.getString("userid");
                setUser(user);
                return true;
            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
        return false;
    }
    
    public void setUser(String user){
        this.user = user;
    }
    
    public String getUser(){
        return user;
    }
}
