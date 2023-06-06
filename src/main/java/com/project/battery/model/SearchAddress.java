/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.sql.DataSource;
import lombok.extern.slf4j.Slf4j;

/**
 *
 * @author host
 */
@Slf4j
public class SearchAddress {

    private HikariConfiguration dbConfig;

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    DataSource ds = null;
    
    public String juso;

    public SearchAddress(HikariConfiguration dbConfig) {
        this.dbConfig = dbConfig;
    }

    public String[] checkAddress(int id) {

        String[] addressFormat = {null,null};
        try {
            ds = dbConfig.dataSource();
            conn = ds.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM address WHERE id= '" + id  + "' and state = 1";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                addressFormat[0]=String.format("%s %s", rs.getString("address"), rs.getString("extra"));
                addressFormat[1]=rs.getString("detail");
            }

           rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            log.error("오류가 발생했습니다. (발생 오류: {})", ex.getMessage());
        }
        return addressFormat;
    }
}
