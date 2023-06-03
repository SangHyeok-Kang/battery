/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.project.battery.model;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 *
 * @author admin
 */
@Setter
@Getter
@Slf4j
public class userInfo {

    String username;
    String userid;
    String password;
    String phone;

    public userInfo(String username, String userid, String password, String phone) {
        this.username = username;
        this.userid = userid;
        this.password = password;
        this.phone = phone;

        log.info("user 생성");
    }
}
