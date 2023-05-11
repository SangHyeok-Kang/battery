<%-- 
    Document   : create_class
    Created on : 2023. 5. 6., 오후 12:07:58
    Author     : qntjd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>강의 개설하기</title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lecture.js" ></script> 
    </head>
    <body>
        <h1>강의개설하기</h1>
        <hr/><!--강의 개설 폼 -->
        <form method="POST" action="insert_lecture.do">
            <span>강의 이미지 등록하기</span><br><!-- comment -->
            <input type="file" name="thumbnail" accept=".jpg,.png,.jpeg"/>
            <h3>강의명*</h3>
            <input type="text" name="title" maxlength="5" required>
            <hr/>
            
            <h3>강의 내용</h3>
            <textarea name="text" cols="50" rows="10" wrap="hard" style="resize: none;"></textarea><br>
            <input type="file" id="content_image" accept=".jpg,.png,.jpeg"/>
            <hr/>
            
            <h3>교육장소</h3>
            <input type="text" name="place" required>
            <hr/>
            
            <h3>모집인원</h3>
            <span>모집기간</span><br>
            <input type="date" name="sRecruitment_date" required/>
            <input type="time" name="sRecruitment_time" required/>~
            <input type="date" name="eRecruitment_date" required/>
            <input type="time" name="eRecruitment_time" required/><br>
            <span>대상</span><br>
            <input type="text" name="recruitment"/><br>
            <span>인원 수</span><br>
            <input name="people" type="text" onKeyup="this.value = this.value.replace(/[^-0-9]/g, '');" required><br>
            <hr/>
            
            <h3>강의일정</h3>
            <div id="lecture-list">
                <div id="lecture1">
                    <label>1번 강의 날짜</label>
                    <input type="date" name="sdate1"/>~
                    <input type="date" name="edate1"/><br>
                    <label>강의 시간</label>
                    <input type="time" name="stime1"/>~
                    <input type="time" name="etime1"/><br>
                </div>
                <%--자바 스크립트를 이용해서 강의 일정을 추가--%>
            </div>
            <button onclick="addLectureDate()">일정 추가하기</button>
            <button onclick="delLectureDate()">일정 삭제하기</button>
            <hr/>
            
            <h3>KeyWord</h3>
            1. <input type="text" name="keyword1"/>
            2. <input type="text" name="keyword2"/>
            3. <input type="text" name="keyword3"/>
            <hr/>
            
            <h3>신청 수락</h3>
            <label><input type="radio" name="acceptance" value="auto" checked>자동</label>
            <label><input type="radio" name="acceptance" value="manual">수동</label><br>
            <hr/>
            
            <span>스탭 모집</span><br>
            <label><input type="radio" name="recruit" value="no" checked onchange="OptionCheck()">미사용</label>
            <label><input type="radio" name="recruit" value="yes" onchange="OptionCheck()">사용</label>
            <div id="container">
                <span>강사모집</span><br>
                <label><input type="radio" name="recruit_t" value="t_no" checked disabled >미사용</label>
                <label><input type="radio" name="recruit_t" value="t_yes" disabled >사용</label><br>
                <span>강사 모집 인원</span><br>
                <input name="teacher_num" type="text" onKeyup="this.value = this.value.replace(/[^-0-9]/g, '');" disabled><br>
                <span>스태프 모집</span><br>
                <label><input type="radio" name="recruit_s" value="s_no" checked disabled>미사용</label>
                <label><input type="radio" name="recruit_s" value="s_yes" disabled>사용</label><br>
                <span>스태프 모집 인원</span><br>
                <input name="staff_num" type="text" onKeyup="this.value = this.value.replace(/[^-0-9]/g, '');" disabled><br>
                <span>조건 사항</span><br>
                <textarea name="recruit_text" cols="50" rows="10" wrap="hard" style="resize: none;" placeholder="강사와 스태프 모집 조건을 입력해주세요!" disabled></textarea><br>
            </div>
            <hr/>
            <input type="submit" value="submit"/>
        </form>
    </body>
</html>
