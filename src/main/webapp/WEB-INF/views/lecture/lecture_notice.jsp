<%-- 
    Document   : lecture
    Created on : 2023. 5. 20., 오전 6:35:59
    Author     : qntjd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <script>
            <c:if test="${!empty msg}">
                alert("${msg}");
            </c:if>
        </script>
    </head>
    <body>
        <nav>
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">학습자료</a></li>
                    <li><a href="#">출석확인</a></li>
                </ul>
            </nav>
            <div>
                <a href="create_notice">공지사항</a>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>제목</th>
                            <th>작성 날짜</th>
                            <th>작성자</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <c:forEach items="${notice_list}" var="list" >
                            <tr>
                                <td>${list.getCo()}</td>
                                <td>${list.getTitle()}</td>
                                <td>${list.getDate()}</td>
                                <td>${list.getWriter()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                             
                <c:forEach var="num" begin="${paging.getFirst()}" end="${paging.getLast()}">
                    <a href="lecture_notice?lecture=${param.lecture}&page=${num}">${num}</a>
                </c:forEach>
                           
            </div>
    </body>
</html>
