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
public class ReviewDto {
    private int no;
    private String id;
    private String review;
    private String date;
    private int grade;

    public ReviewDto(String id, int grade,String review) {
        this.id = id;
        this.review = review;
        this.grade = grade;
    }

    

    public ReviewDto(int no, String review, String date, int grade) {
        this.no = no;
        this.review = review;
        this.date = date;
        this.grade = grade;
    }
    
    
}
