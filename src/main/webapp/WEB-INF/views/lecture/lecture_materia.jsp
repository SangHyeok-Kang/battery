<%-- 
    Document   : lecture_materia
    Created on : 2023. 6. 3., 오전 9:15:29
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
        <script type="text/javascript" src="../js/lecture.js" ></script>
        <script>
            <c:if test="${!empty msg}">
                alert("${msg}");
            </c:if>
            
        </script>
    </head>
    <body>
        <%@include file="lecturemenu.jspf"%> 
        <div>
            <c:if test="${sessionScope.state == 1}">
                <a onclick="insertFile()" id="upload">학습자료 업로드하기</a>
                <div id="uploadMateria"></div>
            </c:if>
                <table border="1">
                    <thead>
                        <tr>
                            <td>No.</td>
                            <td>파일 명</td>
                            <td>작성자</td>
                            <td>등록 날짜</td>
                            <c:if test="${sessionScope.hostState eq 'business'}">
                                <td></td>
                            </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${filelist}" var="file">
                            <tr>
                                <td>${file.getMatCo()}</td>
                                <td><a href="materiadownload.do?filename=${file.getFilename()}">${file.getFilename()}</a></td>
                                <td>${file.getFileuploader()}</td>
                                <td>${file.getFiledate()}
                                <c:if test="${sessionScope.hostState eq 'business'}">
                                    <td><a onclick="delMateria(`${file.getFilename()}`,`${param.lecture}`,`${file.getFileuploader()}`)" id="del_materia">삭제</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                    
                
            <c:if test="${paging}!=null">
                <c:forEach var="num" begin="${paging.getFirst()}" end="${paging.getLast()}">
                    <a href="lecture_notice?lecture=${param.lecture}&page=${num}">${num}</a>
                </c:forEach>         
            </c:if>
        </div>
    </body>
</html>
