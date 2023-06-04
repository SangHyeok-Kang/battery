<%-- 
    Document   : surveySelectList
    Created on : 2023. 5. 30., 오전 5:57:43
    Author     : parkchaebin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    (* 시작 기간 전인 설문만 등록 삭제할 수 있습니다)
    <script>
        <c:if test="${!empty msg}">
            alert("${msg}");
        </c:if>
    </script>
    
    <h1>해당 강의 설문 목록</h1>
    <% 
        String[] searchSurvey = (String[]) request.getAttribute("searchSurvey");
        boolean[] isStart = (boolean[]) request.getAttribute("isStart");
        if (searchSurvey == null || searchSurvey.length == 0) {
    %>
    <p>등록된 설문이 없습니다.</p>
    <% } else { %>
    <table>
        <thead>
            <tr>
                <th>설문 엑셀 파일명</th>
                <th>설문 제목</th>
                <th>시작 기간</th>
                <th>마감 기간</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <% 
                for (int i = 0; i < searchSurvey.length; i += 4) {
                    String surveyTitle = searchSurvey[i];
                    String surveyContent = searchSurvey[i + 1];
                    String startDate = searchSurvey[i + 2];
                    String endDate = searchSurvey[i + 3];
                    boolean currentStart = isStart[i / 4];
            %>
            <tr>
                <td><%= surveyTitle %></td>
                <td><%= surveyContent %></td>
                <td><%= startDate %></td>
                <td><%= endDate %></td>
                <td>
                    <% if (currentStart) { %>
                    <button disabled>삭제</button>
                    <% } else { %>
                    <form action="deleteSelectSurvey" method="POST">
                        <input type="hidden" name="surveyTitle" value="<%= surveyTitle %>">
                        <input type="hidden" name="surveyContent" value="<%= surveyContent %>">
                        <button type="submit">삭제</button>
                    </form>
                    <% } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } %>
    
    <form action="selectSurvey" method="POST">
        <input type="submit" name="createSurvey" value="설문 등록">

    </form>
</body>


</html>

