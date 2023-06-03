<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>

    <!-- Navbar-->
    <nav class="navbar navbar-light py-3">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}" rel="tooltip" title="WeUs" data-placement="bottom">
                <h4>보조배터리</h4>
            </a>

            <div class="pt-3 pb-2" id="navigation">
                <ul class="navbar-nav ms-auto d-flex flex-row">
                    <li class="nav-item mx-2 flex-grow-1">
                        <c:set var="host" value="${sessionScope.host}"/>
                        <c:choose>
                            <c:when test="${host eq null}">
                                <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="sign-in" id="signIn">로그인</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="#" id="mypage">마이페이지</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li class="nav-item mx-2 flex-grow-1">
                        <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="host-center" id="hostCenter">호스트센터</a>
                    </li>
                    <c:if test="${host ne null}">
                        <li class="nav-item mx-2 flex-grow-1">
                            <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="logout.do" id="logout">로그아웃</a>
                        </li>
                    </c:if>
                </ul>
            </div>

        </div>
        <div class="w-100 d-none d-md-block"></div>
        <div class="container">
            카테고리 뭐 들어가야 했더랑 까묵쓰
        </div>
    </nav>
    <!-- End Navbar -->
    <!--start 캐러셀-->
    <header class="header-2">
        <div id="carouselExampleAutoplaying" class="carousel slide shadow-blur" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400"
                         xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: First slide"
                         preserveAspectRatio="xMidYMid slice" focusable="false">
                        <image href="banner\힙합교실.png" height="100%" width="100%" alt="힙합교실.png"></image>
                    </svg>
                </div>
                <div class="carousel-item">
                    <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400"
                         xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Second slide"
                         preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#666"></rect><text x="50%" y="50%" fill="#444" dy=".3em">
                    2</text>
                    </svg>
                </div>
                <div class="carousel-item">
                    <svg class="bd-placeholder-img bd-placeholder-img-lg d-block w-100" width="800" height="400"
                         xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Third slide"
                         preserveAspectRatio="xMidYMid slice" focusable="false">
                    <title>Placeholder</title>
                    <rect width="100%" height="100%" fill="#555"></rect><text x="50%" y="50%" fill="#333" dy=".3em">
                    </svg>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>

        </div>
    </header>
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
                <a class="icon-link icon-link-hover" style="font-size: 13px;" href="#">
                    전체보기
                    <i class="bi bi-arrow-right mb-1"></i>
                </a>
            </div>
        </div>
        <!-- Swiper -->
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                    ${lecturelist}
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