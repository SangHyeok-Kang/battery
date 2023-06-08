<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.ResourceBundle" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
=========================================================
* Material Kit 2 - v3.0.4
=========================================================

* Product Page:  https://www.creative-tim.com/product/material-kit 
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->

<script>
    function press(f) {
        if (f.keyCode == 13) { // 만약 enter키가 눌리면
            formname.submit();
        }
    }
</script>

<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">

        <title>
            WeUs
        </title>

        <!--font ??????-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap" rel="stylesheet">

        <!--css file-->
        <link id="pagestyle" href="${pageContext.request.contextPath}/assets/css/material-kit.css" rel="stylesheet" />
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <!-- Navbar-->
    <%-- any content can be specified here e.g.: --%>



<%@include file="header.jspf" %>

    <!-- End Navbar -->
    <!--start 캐러셀-->
    <%@include file="banner.jspf" %>
    <!--end 캐러셀-->
    <div class="row text-center mt-7 ms-5 me-auto">
        <div class="col-4 mx-auto">
            <form action="index.html" method="get" name="formname"> <!--여기 name의 forname은 function press(f)의 forname과 동일해야 함-->
                <div class="input-group input-group-dynamic mb-3">
                    <input class="form-control" placeholder="관심있는 강의를 검색해보세요✏️" type="text" style="font-size: 1rem;"
                           onkeypress="JavaScript:press(this.form)">
                    <img src="assets/img/search.png" alt="Search" class="mt-3" width="15rem" height="15rem">
                </div>
            </form>
        </div>
    </div>
    <div class="container mt-6">
        <div class="row mb-3">
            <div class="col-auto">
                <h5>🔥지금 HOT한 강의🔥</h5>
            </div>
            <div class="col-auto ms-auto">
                <a class="icon-link icon-link-hover" style="font-size: 13px;" href="lecture/lecture_list?key=hot">
                    전체보기
                    <i class="bi bi-arrow-right mb-1"></i>
                </a>
            </div>
        </div>
        <!-- Swiper -->
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                ${viewcount_list}
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div class="container mt-6">
        <div class="row mb-3">
            <div class="col-auto">
                <h5>🔥무료 강의🔥</h5>
            </div>
            <div class="col-auto ms-auto">
                <a class="icon-link icon-link-hover" style="font-size: 13px;" href="lecture/lecture_list?key=free">
                    전체보기
                    <i class="bi bi-arrow-right mb-1"></i>
                </a>
            </div>
        </div>
        <!-- Swiper -->
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                ${noprice_list}
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <div class="container mt-6">
        <div class="row mb-3">
            <div class="col-auto">
                <h5>🔥유료 강의🔥</h5>
            </div>
            <div class="col-auto ms-auto">
                <a class="icon-link icon-link-hover" style="font-size: 13px;" href="lecture/lecture_list?key=money">
                    전체보기
                    <i class="bi bi-arrow-right mb-1"></i>
                </a>
            </div>
        </div>
        <!-- Swiper -->
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                ${price_list}
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div> 
    </div>

    <!--End header-->

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <!-- Initialize Swiper -->
    <script>
                               var swiper = new Swiper(".mySwiper", {
                                   slidesPerView: 2, //�ʱ�?? ??????. ���???���� ��???
                                   spaceBetween: 10, //����
                                   pagination: {
                                       el: ".swiper-pagination",
                                       clickable: true,
                                   },
                                   breakpoints: {
                                       600: {
                                           slidesPerView: 3, //���???????? 600���� ??? ???
                                       },
                                       800: {
                                           slidesPerView: 4, //���???????? 800���� ??? ???
                                       },
                                       1024: {
                                           slidesPerView: 5, //���???????? 1024���� ??? ???
                                       },
                                   },
                                   navigation: {
                                       nextEl: ".swiper-button-next",
                                       prevEl: ".swiper-button-prev",
                                   },
                                   pagination: {
                                       el: ".swiper-pagination",
                                       dynamicBullets: true,
                                   },
                               });
    </script>
    <!--bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>