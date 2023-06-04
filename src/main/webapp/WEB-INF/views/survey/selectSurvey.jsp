<%-- 
    Document   : selectSurvey
    Created on : 2023. 5. 15., 오전 12:56:41
    Author     : parkchaebin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>설문 등록</title>
    </head>
    <body>
        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>
    <!--    <h1>강의명 = 테스트 강의</h1>  -->


        <%
            String[] surveyList = (String[]) request.getAttribute("surveyList");
            if (surveyList == null || surveyList.length == 0) {
        %>
        <p>설문이 존재하지 않습니다. 설문 생성 후 설문을 등록하세요.</p>
        <% } else { %>
        <form action="registerSurvey.do" method="POST">
            <% for (String surveyName : surveyList) {%>
            <input type="radio" name="surveyName" value="<%= surveyName%>" required><%= surveyName%><br>
            <% } %>
            <br>
            설문 제목: <input type="text" name="title" required><br><br>
            시작날짜: <input type="datetime-local" name="startDatetime" required><br><br>
            마감날짜: <input type="datetime-local" name="endDatetime" required><br><br><br>
            <input type="submit" value="설문 등록">
        </form>
        <% }%>


    </body>
</html>
