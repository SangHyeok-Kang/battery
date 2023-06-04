<%-- 
    Document   : surveyForm
    Created on : 2023. 5. 10., 오전 6:36:00
    Author     : parkchaebin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>설문</title>
    </head>
    <body>
        <h1>설문</h1>

        <form action="createResult.do" method='POST'>
            
            <!-- 수정!! -->
            <% //String[] searchSurvey = (String[]) request.getAttribute("searchSurvey");
                 // String title = (searchSurvey != null && searchSurvey.length > 1) ? searchSurvey[1] : null;
                String surveyTitle = (String) request.getAttribute("surveyTitle"); 
                String surveyContent = (String) request.getAttribute("surveyContent");      
            %>
                
                <% if (surveyContent != null) { %>
                설문 제목 : <%= surveyContent %>  <br><br>
                <input type="hidden" name="title" value="<%=surveyContent%>"><!-- comment -->
                
                <input type="hidden" name="surveyTitle" value="<%=surveyTitle%>">
                <% } %>
            
            이름 : <input type="text" name="name" required >
            
            <%
                String[] a = (String[]) request.getAttribute("a");

                if (a != null) {
                    for (int i = 0; i < a.length; i += 6) {
                        String question = a[i];
                        boolean isType = !a[i + 1].equals("N/A");
            %>
            
            <div>
                <p><b>질문: <%=question%></b></p>
                <% if (isType) { %>
                <p>답변:
                    <% for (int j = 1; j <= 5; j++) {%>
                     <label><input type="radio" name="answer<%=i / 6%>" value="<%=a[i + j]%>" required><%=a[i + j]%></label> 
                        <% } %>
                </p>
                <% } else {%>
                <p>답변: <input type="text" name="answer<%=i / 6%>" required></p> 
                    <% } %>
                
                <input type="hidden" name="question" value="<%=question%>">
            </div>

            <% } %>

            <input type="submit" value="제출" > 

            <%
                } else {
                    System.out.println("null");
                }%>

        </form>
    </body>
</html>
