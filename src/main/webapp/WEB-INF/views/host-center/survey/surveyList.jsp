<%-- 
    Document   : surveyList
    Created on : 2023. 5. 19., 오전 9:17:00
    Author     : parkchaebin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>생성한 설문 목록</title>
    </head>
    <body>
        ( * 강의에 등록된 설문이 없는 경우만 설문 삭제 가능 <br>
        *  설문 삭제를 원할 시 강의에 등록된 설문 삭제 후 설문 삭제 가능 )<br>
        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>

        <%
            String[] surveyList = (String[]) request.getAttribute("surveyList");
            boolean[] isDelChecked = (boolean[]) request.getAttribute("isChecked");
            if (surveyList == null || surveyList.length == 0) {
        %>
        <p>생성한 설문이 없습니다.</p>
        <%
        } else {
        %>
        <table>
            <thead>
                <tr>
                    <th>설문명</th>
                    <th>삭제</th>
                    <th>다운로드</th>
                </tr>
            </thead>
            <tbody> 
                <%
                    for (int i = 0; i < surveyList.length; i++) {
                        String surveyName = surveyList[i];
                        boolean currentDelCheck = isDelChecked[i];
                %>
                <tr>
                    <td><%= surveyName%></td>
                    <td>
                        <form action="deleteSurvey" method="POST">
                            <input type="hidden" name="surveyName" value="<%= surveyName%>">
                            <input type="submit" name="delete" value="삭제" <%= currentDelCheck ? "disabled" : ""%>>

                        </form>
                    </td>
                    <td>
                        <form action="downloadSurvey" method="POST">
                            <input type="hidden" name="surveyName" value="<%= surveyName%>">
                            <input type="submit" name="download" value="다운로드">
                        </form>
                    </td>
                </tr>
                <%
                        }
                    }
                %>

            </tbody>
        </table>
                
        <form action="createSurvey" method="POST">
            <input type="submit" name="createSurvey" value="설문 생성">

        </form>
                
    </body>
</html>


