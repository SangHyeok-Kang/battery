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
        <script>
            <c:if test="${!empty msg}">
                alert("${msg}");
            </c:if>
            //강의실 학습자료 업로드
            clickcount = 0;
            function insertFile(){
                var nodes = document.getElementById("uploadMateria");
                clickcount++;
                if(clickcount%2 === 0){
                    nodes.innerHTML = ``;
                }else{
                    nodes.innerHTML = `<form action="uploadMateria.do" method="POST" enctype="multipart/form-data">
                                        <input type="file" id="materia" name="materia">
                                        <span onclick="delMateria()">x</span>
                                        <input type="submit" value="업로드하기"/>
                                        </form>`;
                }
            }
            function delMateria(){
                document.getElementById("materia").value='';
            }
        </script>
    </head>
    <body>
        <%@include file="lecturemenu.jspf"%> 
        <div>
            <c:if test="${sessionScope.hostState eq 'business'}">
                <a onclick="insertFile()" id="upload">학습자료 업로드하기</a>
                <div id="uploadMateria"></div>
                <a >삭제하기</a>
            </c:if>
                <c:forEach items="${filelist}" var="file">
                    <a href="materiadownload.do?filename=${file}">${file}</a>
                </c:forEach>
            <c:if test="${paging}!=null">
                <c:forEach var="num" begin="${paging.getFirst()}" end="${paging.getLast()}">
                    <a href="lecture_notice?lecture=${param.lecture}&page=${num}">${num}</a>
                </c:forEach>         
            </c:if>
        </div>
    </body>
</html>
