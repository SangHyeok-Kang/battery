/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author qntjd
 */
@Getter
@Setter
@AllArgsConstructor
public class ReviewDto {
    private int no;
    private String review;
    private String date;
    private int grade;
}
