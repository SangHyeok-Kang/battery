/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.entity;

import com.project.battery.dto.*;
import lombok.*;

import javax.persistence.*;


/* 엔티티 클래스에는 세터 생성 x */
@ToString
@Builder
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User {

    @Id private String email;
    @Column private String nickname; // Email은 UNIQUE
    @Column private String profile_image;
    @Column private String clientKey;

    public static User toEntity(UserLoginDto userLoginDto){
        return User.builder()
                .email(userLoginDto.getEmail())
                .nickname(userLoginDto.getNickname())
                .profile_image(userLoginDto.getProfile_image())
                .clientKey(userLoginDto.getClientKey())
                .build();
    }


    public void patch(UserDto userDto){
        if(userDto.getNickname() != null)
            this.nickname = userDto.getNickname();
    }
}