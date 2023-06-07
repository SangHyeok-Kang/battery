/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author host
 */
@Getter
@Setter
@NoArgsConstructor
public class LectureDto {

    private int lectureid;
    private String thumbnail = null; //1. 썸네일 url
    private String title = null; //2. 강의명
    private String text = null; // 3. 강의 내용
    private String text_image = null; // 4. 강의 내용
    private String postcode = null; //장소
    private String address = null;
    private String detail = null;
    private String extra = null;
    private String rec_dt = null; //5. 모집기간
    private String rec_target = null; //6. 모집 대상
    private int rec_num = 0; // 7. 모집 인원
    private String date = null; // 8. 교육 기간
    private String keyword = null; // 9. 키워드
    private String price = null; // 10. 가격
    private String agree = "0"; // 11. 자동 수락 동의(선착순)
    private int teacher = 0; // 12. 강사 모집
    private int teacher_num = 0;//13. 강사 인원 수
    private int staffe = 0; // 14. 스탭 모집
    private int staffe_num = 0;//15. 스탭 인원 수
    private String qual = null; //16.모집 조건 작성
    private String resume = null; //18. 지원서 양식
    private String host = null; // 19. 개설자
    private Double grade = 0.0; // 20. 별점
    private String state = null; //강의 진행상태
    private int matCo;
    private String filename;
    private String fileuploader;
    private String filedate;
    private int sel_count = 0; //조회수
    private String comname; //회사명
    private int enroll_count =0; //신청 인원
    private String user_state; // 참여구분(멘토, 멘티)
    private String enroll_state; // 신청 상태 (대기, 확정, 반려)

    public LectureDto(int lectureid, String thumbnail, String title, String date) {
        this.lectureid = lectureid;
        this.thumbnail = thumbnail;
        this.title = title;
        this.date = date;        

    }

}
