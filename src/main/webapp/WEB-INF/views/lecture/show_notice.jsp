<%-- 
    Document   : show_notice
    Created on : 2023. 5. 26., 오전 1:36:00
    Author     : qntjd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <script type="text/javascript" src="../js/lecture.js" ></script>
        <script>
            function update(){
                alert("update");
            }
        </script>
    </head>
    <body>
        <h1>공지사항 확인하기</h1>
        <c:if test="${sessionScope.hostState eq 'business'}">
            <a onclick="update()" id="update">수정</a>
            <a onclick="delNotice(${param.id})" id="del">삭제</a>
        </c:if>
        <table>
            <tbody>
                <tr>
                    <th>제목</th>
                    <td>${notice.getTitle()}</td>
                    <th>작성자</th>
                    <td>${notice.getWriter()}</td>
                </tr>
                <tr>
                    <th>본문</th>
                    <td>${notice.getText()}</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><a href="noticedownload.do?filename=${notice.getFile()}&writer=${notice.getWriter()}">${notice.getFile()}</a></td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
