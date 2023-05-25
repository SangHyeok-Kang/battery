/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.project.battery.service;

import lombok.Getter;

/**
 *
 * @author qntjd
 * 클래스 설명 : 공지사항, 강의, 학습자료 등의 항목을 페이징 처리하기 위한 클래스
 */
public class PagingService {
    //목록 아래 페이지 순서를 나타내기 위한 변수
    @Getter private int first, last,totalpage;
    //전체 항목 리스트 중 목록에 보여질 리스트 슬라이싱을 위한 변수
    @Getter private int startlist, endlist;
    //페이지에서 가장 먼저 보이는 페이지
    //페이지 단에서 보여줄 개수
    private final int showpage = 5;
    //요소가 보여질 개수
    private final int showlist = 10;
    
    
    //리스트 아래 페이지 선택 리스트 구하기
    public PagingService(int nowpage, int total){
        //전체 페이지 개수 구하기
        this.totalpage = total/showlist;
        if(total%showlist>0){ //나머지가 있으면 페이지를 하나 더 추가해야하므로 +1
            this.totalpage += 1;
        }
        if(nowpage < showpage){//총 페이지 갯수가 한번에 보여질 페이지보다 적을 때
            this.first=1;
            if(totalpage<=showpage){
                this.last=totalpage;
            }else{
                this.last=showpage;
            }
        }else if(nowpage == this.totalpage){//마지막 페이지일때
            this.first=this.totalpage-showpage+1;
            this.last=totalpage;
        }else{
            this.first = nowpage - showpage/2;
            this.last = nowpage + showpage/2;
        }
        
        //객체 리스트 중 뽑아야할 페이징 항목 추출을 위한 인덱스 계산
        this.startlist= (showlist*nowpage)-(showlist-1);
        if(nowpage == totalpage){
            this.endlist = total;
        }else{
            this.endlist = nowpage*showlist;
        }
    }
}
