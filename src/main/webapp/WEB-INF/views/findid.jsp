<%-- 
    Document   : findid
    Created on : 2023. 5. 14., 오전 12:08:54
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link type="text/css" rel="stylesheet" href="css/signup_css.css" />
        <title>아이디 찾기</title>
    </head>
    <body>
        <h1>아이디 찾기</h1>
         <form method="post" action="${pageContext.request.contextPath}/findid.do">
            <div class ="findid">
                <div>
                    <label for="name">이름:</label>
                    <input type="text" id="name" name="name" required style="width:auto"; >                                
                    <label for="phone">전화번호:</label>
                    <input type="tel" id="phone1" name="phone1" maxlength="3" required>
                    -
                    <input type="tel" id="phone2" name="phone2" maxlength="4" required>
                    -
                    <input type="tel" id="phone3" name="phone3" maxlength="4" required> <br><br>

                    <!--<button type="submit" formaction="${pageContext.request.contextPath }/find.do">검색하기</button>-->
                    <input type="submit" value="검색하기">
                    <button onclick="history.back()">뒤로가기</button>
                </div>
            </div>
        </form>
    </body>
</html>
