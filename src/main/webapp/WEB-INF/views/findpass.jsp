<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Find Password</title>
        <script type="text/javascript" src="script/member.js"></script>
        <link type="text/css" rel="stylesheet" href="css/signup_css.css" />
    </head>
    <body>
        <h1>비밀번호 찾기</h1>
        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>
         <form method="post" action="${pageContext.request.contextPath}/findpass.do">
            <div class ="findpass">
                <div>
                    <label for="name">아이디:</label>
                    <input type="text" id="userid" name="userid" required style="width:auto"; >       
                    <label for="name">이름:</label>
                    <input type="text" id="name" name="name" required style="width:auto"><br><br>
                    <label for="phone">전화번호:</label>
                    <input type="tel" id="phone1" name="phone1" maxlength="3" required>
                    -
                    <input type="tel" id="phone2" name="phone2" maxlength="4" required>
                    -
                    <input type="tel" id="phone3" name="phone3" maxlength="4" required> <br><br>

                    <input type="submit" value="검색하기">
                    <button onclick="history.back()">뒤로가기</button>
                </div>
            </div>
        </form>
    </body>
</html>
