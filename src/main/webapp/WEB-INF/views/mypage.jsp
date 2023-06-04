<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>member Update</title>
        <script type="text/javascript" src="script/member.js"></script>
        <link type="text/css" rel="stylesheet" href="css/signup_css.css" />
    </head>
    <body>
        <h1>마이페이지</h1>
        <form method="POST">
            <div class ="mypage">
                <div>
                    <label for="userid">아이디:</label>
                    <input type="text" id="userid" name="userid" readonly="readonly" value="${host}" required style="width:auto"; onkeyup="checkReg(event)">                    
                </div>
                <script>
                    function checkReg(event) {
                        const regExp = /[^0-9a-zA-Z]/g; // 숫자와 영문자만 허용
                //   const regExp = /[^ㄱ-ㅎ|가-힣]/g; // 한글만 허용
                        const del = event.target;
                        if (regExp.test(del.value)) {
                            del.value = del.value.replace(regExp, '');
                        }
                    }
                    ;
                </script>
                <form action="changePassword.jsp" method="post">
                    <label for="password">현재 비밀번호:</label>
                    <input type="password" id="currentPassword" name="currentPassword" required style="width:auto"; ><br>
                    <label for="newPassword">변경할 비밀번호:</label>
                    <input type="password" id="newPassword" name="newPassword" required style="width:auto"; ><br>
                    <label for="confirmPassword">비밀번호 확인:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required style="width:auto"; ><br>                   
                </form>

                <label for="name">이름:</label>
                <input type="text" id="name" name="name" readonly="readonly" value="${host}" required style="width:auto"><br><br>

                <label for="phone">전화번호:</label>
                <input type="tel" id="phone1" name="phone1" maxlength="3" required>
                -
                <input type="tel" id="phone2" name="phone2" maxlength="4" required>
                -
                <input type="tel" id="phone3" name="phone3" maxlength="4" required> <br><br>


                <label for="address">주소:</label>
                <input type="text" id="postcode" name="postcode" placeholder="우편번호">
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="address" name="address" placeholder="주소"><br>
                <input type="text" id="detail" name="detail" placeholder="상세주소">
                <input type="text" id="extra" name="extra" placeholder="참고항목">

                <button type="submit" formaction="${pageContext.request.contextPath }/mypage.do">수정하기</button>
                <button type="submit" formaction="${pageContext.request.contextPath }/delUser.do">탈퇴하기</button>
                <button onclick="history.back()">뒤로가기</button>
            </div>

    </body>
</html>

