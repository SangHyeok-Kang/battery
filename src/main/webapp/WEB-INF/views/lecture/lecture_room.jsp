<%-- 
    Document   : lecture_room
    Created on : 2023. 6. 8., 오후 6:19:09
    Author     : User
--%>

<!--
=========================================================
* Material Kit 2 - v3.0.4
=========================================================

* Product Page:  https://www.creative-tim.com/product/material-kit 
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->
<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import = "java.util.ResourceBundle" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!--bootstrap-->
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
        <title>
            WeUs
        </title>

        <!--font ??????-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <!--css file-->
        <link id="pagestyle" href="${pageContext.request.contextPath}/assets/css/material-kit.css" rel="stylesheet" />
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>

    <!-- Navbar-->
    <%@include file="../header.jspf" %>
    <!--end navbar-->
    <!-- End Navbar -->

    <body>
        <div class="container">
            <div class="row mt-5 align-items-center">
                <div class="col-lg-7"> <!--강의 썸네일-->
                    <div class="card thumbnail">
                        <img src="${pageContext.request.contextPath}/resource/thumbnail/${lec.getThumbnail()}">
                    </div>
                </div>
                <div class="col-lg-5 mt-2 mt-lg-0"><!--강의 설명-->
                    <ul class="list-group text-dark">
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="ms-2 me-auto py-md-2">
                                <div class="fw-bold">강의명✍️</div>
                                <div class="ps-2 mt-1">${lec.getTitle()}</div>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="ms-2 me-auto py-md-2">
                                <div class="fw-bold">기간📆</div>
                                <div class="ps-2 mt-1">${rec}</div>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="ms-2 me-auto py-md-2">
                                <div class="fw-bold">시간⏰</div>
                                <div class="ps-2 mt-1">
                                    <c:forEach items="${date}" var="date" varStatus="co">
                                        <label class="text-black">${date}</label>
                                        <c:if test="${not co.end}">
                                            <br>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="ms-2 me-auto py-md-2">
                                <div class="fw-bold">장소🚩</div>
                                <div class="ps-2 mt-1">
                                    ${juso[0]}&nbsp;${juso[2]}<br>${juso[1]}
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>

                <div class="mt-3 d-felx justify-content-center">
                    <div class="card border">
                        <div class="card-header bg-gray-100 pb-0">
                            <!--nav&tab 카테고리-->
                            <ul class="nav nav-tabs" id="myTab3" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="notice-tab" data-bs-toggle="tab" data-bs-target="#notice" type="button" role="tab" aria-controls="notice" aria-selected="true">공지사항</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="file-tab" data-bs-toggle="tab" data-bs-target="#file" type="button" role="tab" aria-controls="file" aria-selected="false">학습자료</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="survey-tab" data-bs-toggle="tab" data-bs-target="#survey" type="button" role="tab" aria-controls="survey" aria-selected="false">설문조사</button>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <!--nav&tab 내용-->
                            <!--공지사항-->
                            <div class="tab-content" id="myTabContent3">
                                <div class="tab-pane fade show active" id="notice" role="tabpanel" aria-labelledby="notice-tab">
                                    <%@include file="lecture_notice.jspf"%>
                                </div>
                                <div class="tab-pane fade" id="file" role="tabpanel" aria-labelledby="file-tab">asdf</div>
                                <div class="tab-pane fade" id="survey" role="tabpanel" aria-labelledby="survey-tab">
                                    <%@include file="showDoList.jspf"%> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<!--bootstrap-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
crossorigin="anonymous"></script>
</html>
