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
        <script>
            <c:if test="${!empty msg}">
             alert("${msg}");
            </c:if>
        </script>
        <div class ="changepw">
            <form method="POST" action="${pageContext.request.contextPath}/changePw.do">
                <input type="text" id="newPassword" name="userid" value=${id} required style="width:auto"; ><br>
                <label for="newPassword">변경할 비밀번호:</label>
                <input type="password" id="newPassword" name="pass1" required style="width:auto"; ><br>
                <label for="confirmPassword">비밀번호 확인:</label>
                <input type="password" id="confirmPassword" name="pass2" required style="width:auto"; ><br>                   

                <button type="submit">수정하기</button>
                <button onclick="history.back()">뒤로가기</button>
            </form>

        </div>
    </body>
</html>

