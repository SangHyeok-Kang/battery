/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.model;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import javax.sql.DataSource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 *
 * @author qntjd
 */
@Configuration
@PropertySource("classpath:/application.properties")
@Slf4j
public class HikariConfiguration {
    
    @Bean
    @ConfigurationProperties(prefix="spring.datasource.hikari")
    public HikariConfig hikariConfig(){
        return new HikariConfig();
    }
    
    @Bean
    public DataSource dataSouce(){
        DataSource dataSource = (DataSource) new HikariDataSource(hikariConfig());
        log.debug("hikari dataSource = {}", dataSource.toString());
        return dataSource;
    }  
    
}
