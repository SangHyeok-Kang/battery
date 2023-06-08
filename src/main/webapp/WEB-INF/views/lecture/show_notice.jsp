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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/lecture.js" ></script>
        <title>공지사항</title>
        <script type="text/javascript" src="../js/lecture.js" ></script>
    </head>
    <body>
        <%@include file="../header.jspf" %>
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="card shadow mb-4 ">
                <div class="card-body ">
                    <div class="table-responsive">
                        <h1 class="h3 mb-2 text-gray-800">공지사항</h1>

                        <table class="table">
                            <colgroup>
                                <col style="width: 20%;">
                                <col style="width: 80%;">
                            </colgroup>
                            <tr >
                                <th scope="row">제목</th>
                                <td>${notice.getTitle()}</td>
                            </tr>
                            <tr>
                                <th  scope="row">작성자</th>
                                <td>${notice.getWriter()}</td>
                            </tr>
                            <tr>
                                <th scope="row">본문</th>
                                <td>${notice.getText()}</td>
                            </tr>
                            <tr>
                                <th scope="row">첨부파일</th>
                                <td><a href="noticedownload.do?filename=${notice.getFile()}&writer=${notice.getWriter()}">${notice.getFile()}</a></td>
                            </tr>
                        </table>
                    </div>
                    <c:if test="${sessionScope.state == 1}">
                        <div class="text-right">
                            <a onclick="delNotice(${param.id})" id="del">삭제하기</a>
                        </div>
                    </c:if>
                    <div class="text-right">
                        <a onclick="location.href='lecture_room?lecture=${sessionScope.lecture}'" id="del">뒤로가기</a>
                    </div>
                </div>
            </div>
    </body>
</html>
