<%-- 
    Document   : signup_result
    Created on : 2023. 4. 25., 오후 11:21:33
    Author     : host
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입 결과</title>
    </head>
    <body>
        <script>
            alert('${msg}');
           location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
        </script>
    </body>
</html>
