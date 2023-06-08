<%-- 
    Document   : lecture_list
    Created on : 2023. 6. 8., 오후 1:18:54
    Author     : qntjd
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/ssac.png">
        <link rel="icon" type="image/png" href="assets/img/ssac.png">

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

    </head>

    <!-- Navbar-->
    <nav class="navbar navbar-light py-3">
        <div class="container">
            <a class="navbar-brand" href="index.html" rel="tooltip" title="WeUs" data-placement="bottom">
                <h4>보조배터리</h4>
            </a>

            <div class="pt-3 pb-2" id="navigation">
                <ul class="navbar-nav ms-auto d-flex flex-row">
                    <li class="nav-item mx-2 flex-grow-1">
                        <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="sign-in.html" id="signIn">로그인</a>
                    </li>
                </ul>
            </div>

        </div>
        <div class="w-100 d-none d-md-block"></div>
        <div class="container">
            카테고리 뭐 들어가야 했더랑 까묵쓰
        </div>
    </nav>
    <!-- End Navbar -->

    <body>
        <!--side bar-->
        <div class="d-flex">
            <div class="d-none d-lg-block flex-shrink-0 bg-white mt-5 ms-7 w-15 border-end">
                <h5 class="text-dark">카테고리</h5>
                <!--
                  선택된 중분류는 <button>aria-expanded="ture"</buttton> && <div class="collapse show">
                  그럼 중분류 토글이 펼쳐진 상태가 됨
                  ex) 82 line -> aria-expanded="true"
                      85 line -> <div class="collapse show">
                -->
                <ul class="list-unstyled ps-0">
                    <li class="border-top my-3"></li>
                    <li>
                        <button class="btn btn-toggle align-items-center ps-2 mb-0" style="font-size:medium;"
                                data-bs-toggle="collapse" data-bs-target="#kind1-collapse" aria-expanded="true"> <!--data-bs-target="#kind1-collapse" 이거 이름 겹치면 안됨(겹치면 같은 토글로 인식)-->
                            운동<i class="bi bi-chevron-down icon-move-right"></i>
                        </button>
                        <div class="collapse show" id="kind1-collapse"> <!--id값은 위에 data-bs-target과 동일하게-->
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-4">
                                <li>· <a href="#" class="link-dark rounded text-info">축구</a></li> <!--선택된 소분류는 text-info도 추가-->
                                <li>· <a href="#" class="link-dark rounded">농구</a></li>
                                <li>· <a href="#" class="link-dark rounded">야구</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <button class="btn btn-toggle align-items-center ps-2 mb-0" style="font-size:medium;"
                                data-bs-toggle="collapse" data-bs-target="#kind2-collapse" aria-expanded="false">
                            중분류<i class="bi bi-chevron-down icon-move-right"></i>
                        </button>
                        <div class="collapse" id="kind2-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-4">
                                <li>· <a href="#" class="link-dark rounded">소분류1</a></li>
                                <li>· <a href="#" class="link-dark rounded">소분류2</a></li>
                                <li>· <a href="#" class="link-dark rounded">소분류3</a></li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <button class="btn btn-toggle align-items-center ps-2 mb-0" style="font-size:medium;"
                                data-bs-toggle="collapse" data-bs-target="#kind3-collapse" aria-expanded="false">
                            중분류<i class="bi bi-chevron-down icon-move-right"></i>
                        </button>
                        <div class="collapse" id="kind3-collapse">
                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-4">
                                <li>· <a href="#" class="link-dark rounded">소분류1</a></li>
                                <li>· <a href="#" class="link-dark rounded">소분류2</a></li>
                                <li>· <a href="#" class="link-dark rounded">소분류3</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>

            <!--본문 내용-->
            <div class="container">
                <div class="justify-content-between mt-5 d-flex align-items-center">
                    <nav
                        style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);"
                        aria-label="breadcrumb">
                        <ol class="breadcrumb bg-white p-0">
                            <i class="bi bi-link-45deg me-2"></i><!--🔗-->
                            <li class="breadcrumb-item"><a href="#" class="text-info">중분류</a></li> <!--선택된 중분류 가져오기-->
                            <li class="breadcrumb-item active" aria-current="page">소분류</li><!--선택된 소분류 가져오기-->
                        </ol>
                    </nav>
                    <button class="btn btn-icon" style="font-size: 14px" type="button" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                        필터링<i class="bi bi-filter-right"></i>
                    </button>
                </div>

                <!--offcanvas 속 내용(필터링 버튼 클릭 시 뜨는 내용)-->
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                    <!--offcanvas header-->
                    <div class="offcanvas-header mt-3">
                        <h5 class="offcanvas-title" id="offcanvasRightLabel">필터링</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
                            <i class="bi bi-x-lg"></i>
                        </button>
                    </div>
                    <hr class="opacity-2">
                    <!--offcanvas body-->
                    <div class="offcanvas-body">
                        <ul class="list-unstyled ps-0 row" style="font-size:large;">
                            <!--카테고리 항목은 크기가 줄었을 때만 뜨도록 설정-->
                            <div class="d-block d-lg-none row">
                                <li>
                                    <button class="btn btn-toggle align-items-center text-dark text-start ps-3 mb-0"
                                            style="font-size:large;" data-bs-toggle="collapse" data-bs-target="#category1-collapse" aria-expanded="false"> <!--data-bs-target 값은 각각 다르게-->
                                        카테고리 <i class="bi bi-chevron-down icon-move-right"></i>
                                    </button>
                                    <div class="collapse" id="category1-collapse"><!--id는 data-bs-target값과 동일하게-->
                                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-4">
                                            <!--중분류-->
                                            <li class="mb-2">
                                                <!--data-bs-targer값 겹치지 않게↓-->
                                                · <a href="#" class="link-dark rounded text-bold" data-bs-toggle="collapse"
                                                     data-bs-target="#subcategory1-collapse" aria-expanded="false">운동 <i class="bi bi-chevron-down icon-move-right"></i></a>
                                                <div class="collapse" id="subcategory1-collapse">
                                                    <!--소분류-->
                                                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-4">
                                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">농구</a></li>
                                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">축구</a></li>
                                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">야구</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <!--중분류-->
                                            <li class="mb-2">
                                                · <a href="#" class="link-dark rounded text-bold" data-bs-toggle="collapse"
                                                     data-bs-target="#subcategory2-collapse" aria-expanded="false">컴퓨터 <i class="bi bi-chevron-down icon-move-right"></i></a>
                                                <div class="collapse" id="subcategory2-collapse">
                                                    <!--소분류-->
                                                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-4">
                                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">C언어</a></li>
                                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">Java</a></li>
                                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">Python</a></li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </div>
                            <li>
                                <button class="btn btn-toggle align-items-center text-dark text-start ps-3 mb-0" style="font-size:large;"
                                        data-bs-toggle="collapse" data-bs-target="#category2-collapse" aria-expanded="false">
                                    가격 <i class="bi bi-chevron-down icon-move-right"></i>
                                </button>
                                <div class="collapse" id="category2-collapse">
                                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-4">
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">무료</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">유료</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <button class="btn btn-toggle align-items-center text-dark text-start ps-3 mb-0" style="font-size:large;"
                                        data-bs-toggle="collapse" data-bs-target="#category3-collapse" aria-expanded="false">
                                    지역 <i class="bi bi-chevron-down icon-move-right"></i>
                                </button>
                                <div class="collapse" id="category3-collapse">
                                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 ps-4">
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">서울특별시</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">부산광역시</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">인천광역시</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">대전광역시</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">대구광역시</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">울산광역시</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">광주광역시</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">세종특별자치시</a></li>
                                        <li class="mb-2">· <a href="#" class="link-dark rounded text-bold">제주특별자치도</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <button class="btn btn-toggle align-items-center text-dark text-start ps-3 mb-0" style="font-size:large;"
                                        data-bs-toggle="collapse" data-bs-target="#category4-collapse" aria-expanded="false">
                                    기간 <i class="bi bi-chevron-down icon-move-right"></i>
                                </button>
                                <div class="collapse" id="category4-collapse">
                                    <div class="input-group pb-1 ps-4">
                                        <div class="d-flex align-items-between">
                                            <input type="date" class="form-control" id="start-date">
                                            <div class="mx-2 pt-1">~</div>
                                            <input type="date" class="form-control" id="end-date">
                                        </div>
                                        <div class="col-12">
                                            <!--적용 버튼 누르면 해당 기간에 해당하는 강의만 뜨게-->
                                            <button class="btn btn-sm btn-outline-info mt-2 justify-content-end" id="apply-btn">적용</button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--필터링 내용 끝-->


                <!--강의 목록(총 12개)-->
                <div class="row mt-5 h-100 justify-content-around">
                    <c:forEach items="${list}" var="list">
                        <div class="col-2" style="min-width: fit-content;">
                            <div class="swiper-slide ">
                                <div class="card thumbnail">
                                    <a href="select_lecture?lecture=${list.getLectureid()}"><img src="${pageContext.request.contextPath}/resource/thumbnail/${list.getThumbnail()}"></a> <!--강의 썸네일 불러오기-->
                                </div>
                                <div class="me-2 pt-2 row">
                                    <a href="select_lecture?lecture=${list.getLectureid()}" class="thumnail-date"><!--강의 날짜 불러오기-->
                                        <div class="thumnail-explain pt-2"><!--강의명 불러오기-->
                                            ${list.getTitle()}
                                            <div class="row justify-content-between pt-3 ps-3">
                                                <div class="thumbnail-pirce col-auto"><!--가격 불러오기-->
                                                    ${list.getPrice()}</div>
                                                <div class="thumbnail-view col-auto"><!--조회수 불러오기-->
                                                    조회수 ${list.getSel_count()}
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!--강의 목록 끝-->

                <!--pagination-->
                <section class="py-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 mx-auto">
                            <ul class="pagination pagination-info justify-content-center">
                                <li class="page-item">
                                    <a class="page-link" href="javascript:;" aria-label="Previous">
                                        <i class="bi bi-chevron-left" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li class="page-item active">
                                    <!--선택된 페이지의 경우 text-white 동적으로 넣어주기-->
                                    <a class="page-link text-white" href="javascript:;">1</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:;">2</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:;">3</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:;">4</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:;">5</a>
                                </li>
                                <li class="page-item">
                                    <a class="page-link" href="javascript:;" aria-label="Next">
                                        <i class="bi bi-chevron-right" aria-hidden="true"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
                <!--pagination 끝-->

            </div>
        </div>
    </body>
    <script>
        var firstSelect = document.getElementById('first-select');
        var secondSelect = document.getElementById('second-select');

        document.addEventListener("DOMContentLoaded", function () {
            var applyButton = document.getElementById("apply-btn");
            var startDateInput = document.getElementById("start-date");
            var endDateInput = document.getElementById("end-date");

            //종료 날짜가 시작 날짜보다 빠를 수 없다.
            startDateInput.addEventListener("change", function () {
                endDateInput.min = startDateInput.value;
                if (endDateInput.value < startDateInput.value) {
                    endDateInput.value = startDateInput.value;
                }
            });
        });
    </script>

    <!--bootstrap-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
