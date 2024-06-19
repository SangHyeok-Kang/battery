# 오프라인 교육 보조 시스템

<div align = "center">
  <img src = "https://github.com/SangHyeok-Kang/DataRepository/blob/29a3c9595cba646c1ac0ff9333aaf904987aa05f/%EC%98%A4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%90%EC%9C%A1%20%EB%B3%B4%EC%A1%B0%20%ED%94%8C%EB%9E%AB%ED%8F%BC/banner.png">
</div>

<br>

## 💡 주제

- 오프라인 교육 보조 웹 사이트
- 강의 등록 및 수강 신청 보조

<br>

## 📝 설명

- ***오프라인 교육 보조 시스템***은 **디지털 새싹 교육캠프**를 진행하며 **기존 시스템의 단점**을 보완하고 개선하기 위해 구축한 플랫폼 입니다. 
- **강의 등록, 수강 신청, 설문 조사** 등  오프라인 교육 정보에 대한 정보를 제공하여 교육의 다양성을 높이고 질 높은 교육을 받을 수 있는 플랫폼을 제공합니다.

<br>

## 🖥️ 시스템 구조도

<div align = "center">
  <img src = "https://github.com/SangHyeok-Kang/DataRepository/blob/29a3c9595cba646c1ac0ff9333aaf904987aa05f/%EC%98%A4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%90%EC%9C%A1%20%EB%B3%B4%EC%A1%B0%20%ED%94%8C%EB%9E%AB%ED%8F%BC/%EC%8B%9C%EC%8A%A4%ED%85%9C%EA%B5%AC%EC%A1%B0%EB%8F%84.png">
</div>

## 🖥️ 기술 스택
- **Language** : JAVA JDK 11(JSP), HTML5, CSS3, JSP
- **Server** : Spring Framework 2.7.9, Apache Tomcat 9
- **Database** : MySQL 8.0.29
- **Tools** : Apache NetBeans IDE, Git

<br>

## ✨ 주요 기능

- **강의 개설**
    - 기관이나 개인이 강의를 개설할 수 있도록 합니다.
    - 강의 개설에 필요한 강의 명, 강의 시간, 강의 장소 등을 입력하여 강의를 개설합니다.
- **강의 신청**
    - 멘토와 멘티는 강의를 신청 할 수 있습니다.
    - 강의 목록을 조회하여 자신이 참여하고 싶은 강의를 선택하고 회차를 선택하여 강의를 신청합니다.
- **강의 리뷰**
    - 사용자는 수료 후 강의에 대한 후기를 작성할 수 있습니다.
    - 강의 개설자는 후기를 통계로 요약하여 조회할 수 있습니다.
- **온라인 강의실**
    - 강의에 대한 공지, 자료 등을 업로드 및 다운로드 할 수 있습니다.
 
<br>

## 📙 WBS
<div align = "center">
  <img src = "https://github.com/SangHyeok-Kang/DataRepository/blob/29a3c9595cba646c1ac0ff9333aaf904987aa05f/%EC%98%A4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%90%EC%9C%A1%20%EB%B3%B4%EC%A1%B0%20%ED%94%8C%EB%9E%AB%ED%8F%BC/wbs.png">
</div>

## 📘 ERD
<div align = "center">
  <img src = "https://github.com/SangHyeok-Kang/DataRepository/blob/29a3c9595cba646c1ac0ff9333aaf904987aa05f/%EC%98%A4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%90%EC%9C%A1%20%EB%B3%B4%EC%A1%B0%20%ED%94%8C%EB%9E%AB%ED%8F%BC/erd.png" width="70%">
</div>

## 📲 UI

<div align = "center">
  
| 메인 페이지 | 온라인 강의실 |
| :---: | :---: |
| <img width="350" alt="메인 페이지" src="https://github.com/SangHyeok-Kang/DataRepository/blob/29a3c9595cba646c1ac0ff9333aaf904987aa05f/%EC%98%A4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%90%EC%9C%A1%20%EB%B3%B4%EC%A1%B0%20%ED%94%8C%EB%9E%AB%ED%8F%BC/%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80.png"> | <img width="350" alt="온라인 강의" src="https://github.com/SangHyeok-Kang/DataRepository/blob/29a3c9595cba646c1ac0ff9333aaf904987aa05f/%EC%98%A4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%90%EC%9C%A1%20%EB%B3%B4%EC%A1%B0%20%ED%94%8C%EB%9E%AB%ED%8F%BC/%EA%B0%95%EC%9D%98%20%EB%93%B1%EB%A1%9D.png"> |

| 강의 신청 | 강의 리뷰 |
| :---: | :---: |
| <img width="350" alt="강의 신청" src="https://github.com/SangHyeok-Kang/DataRepository/blob/29a3c9595cba646c1ac0ff9333aaf904987aa05f/%EC%98%A4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%90%EC%9C%A1%20%EB%B3%B4%EC%A1%B0%20%ED%94%8C%EB%9E%AB%ED%8F%BC/%EA%B0%95%EC%9D%98%20%EC%8B%A0%EC%B2%AD.png"> | <img width="350" alt="강의 리뷰" src="https://github.com/SangHyeok-Kang/DataRepository/blob/acee2cffbdf03362a95e1374dc497f82690bd5d7/%EC%98%A4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%90%EC%9C%A1%20%EB%B3%B4%EC%A1%B0%20%ED%94%8C%EB%9E%AB%ED%8F%BC/review.png"> |

</div>

<br>

## 👨‍👦팀 구성
<div align="center">

|김부성 ``` Fullstack Dev ```| 강상혁 ```Backend Dev``` | 송준섭 ```Backend Dev``` |
|:-:|:-:|:-:|
|<img src="https://avatars.githubusercontent.com/u/93811002?v=4" width=130>| <img src="https://avatars.githubusercontent.com/u/104892909?s=400&v=4" width=130> | <img src="https://avatars.githubusercontent.com/u/115469010?v=4" width=130> |
|[@Bu-Sung](https://github.com/Bu-Sung)| [@SangHyeok-Kang](https://github.com/SangHyeok-Kang)| [@JunSeop-Song](https://github.com/Junseop-Song)|

|박채빈 ``` Backend Dev ```|이수진 ```Frontend Dev``` |
|:-:|:-:|
|<img src="https://avatars.githubusercontent.com/u/93811002?v=4" width=130>| <img src="https://avatars.githubusercontent.com/u/104892909?s=400&v=4" width=130> |
|[@parkchaebin](https://github.com/parkchaebin)| [@SUJ11V](https://github.com/SUJ11V)|
