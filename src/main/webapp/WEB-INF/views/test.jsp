<%-- 
    Document   : login
    Created on : 2023. 4. 15., 오후 11:44:14
    Author     : host
--%>

<%@page import="org.springframework.beans.factory.annotation.Value"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>로그인 페이지</title>
        <link type="text/css" rel="stylesheet" href="css/style.css" />
    </head>
    <body>
        <script>
            <c:if test ="${loginresult eq 'false'}">
            alert("로그인에 실패했습니다. 다시 시도해주세요.");
            </c:if>
        </script>

        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>
        <div id="login_form">
            <form method="POST" action="${pageContext.request.contextPath}/login.do">
                사용자: <input type="text" name="userid" size="20" autofocus> <br />
                암&nbsp;&nbsp;&nbsp;호: <input type="password" name="password" > <br /> <br />
                <input type="submit" value="로그인" name="B1">&nbsp;&nbsp;&nbsp; 
                <input type="button" value="회원가입" name="signup" onclick="location.href = 'select_signup'"/> &nbsp;&nbsp;
                <input type="reset" value="다시 입력" name="B2">
                <input type="button" value="ID/PASS 찾기" name="findinfo" onclick="location.href = 'select_findinfo'"/> &nbsp;&nbsp;
            </form>
            <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=438e26bbed1a7e616852d3e70b183c6b&redirect_uri=http://localhost:8080/member/kakao&response_type=code">
                <img src="images/kakao_login_medium_wide.png"/>
            </a>  
        </div>

    </body>
</html>
