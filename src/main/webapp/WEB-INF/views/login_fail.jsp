<%-- 
    Document   : login_result
    Created on : 2023. 4. 26., 오전 1:42:43
    Author     : host
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <script>
            alert('${msg}');
           location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
        </script>
    </body>
</html>
