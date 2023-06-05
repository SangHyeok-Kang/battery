<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <title>호스트 센터</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/lecture.js" ></script>
        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="host-center-sidebar.jspf"%>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="host-center-topbar.jspf"%>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        </div>
                        <div class="row">
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-2xl font-weight-bold text-primary text-uppercase mb-1">
                                                    완료한 강의</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">40,000 개</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-2xl font-weight-bold text-success text-uppercase mb-1">
                                                    수료한 인원</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">215,000 명</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-info shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-2xl font-weight-bold text-info text-uppercase mb-1">평점
                                                </div>
                                                <div class="row no-gutters align-items-center">
                                                    <div class="col-auto">
                                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="progress progress-sm mr-2">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-2xl font-weight-bold text-warning text-uppercase mb-1">
                                                    내게 달린 리뷰</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-comments fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <%-- 호스트 센터 강의 목록 시작 --%>
                                <div class="mt-6">
                                    <div class="row mb-3">
                                        <div class="col-auto">
                                            <label class="mb-2 text-gray-800">진행 중인 강의</label>
                                        </div>
                                        <div class="col-auto ms-auto">
                                            <a class="icon-link icon-link-hover" style="font-size: 13px;" href="#">
                                                전체보기
                                                <i class="bi bi-arrow-right mb-1"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div>
                                        진행중인 강의 슬라이드
                                    </div>
                                </div>
                                <hr class="sidebar-divider">
                                <%-- 강의 목록 끝 --%>
                                <div class="mt-6">
                                    <div class="row mb-3">
                                        <div class="col-auto">
                                            <label class="mb-2 text-gray-800">모집 중인 강의</label>
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
                                            <c:forEach items="${startList}" var="list">
                                                <div class="swiper-slide col-lg-3 col-md-6 ">
                                                    <div class ="card thumbnail">
                                                        <a href='lecture?lecture=${list.getLectureid()}'>
                                                            <img src='${pageContext.request.contextPath}/resource/thumbnail/${list.getThumbnail()}' alt="${list.getThumbnail()}">
                                                        </a>
                                                    </div>
                                                    <div class="me-2 pt-2 row">
                                                        <a href="lecture?lecture=${list.getLectureid()}" class="thumnail-date">
                                                            ${list.getTitle()}
                                                            <%--
                                                            <div class="thumnail-explain pt-2">
                                                                <div class="row justify-content-between pt-3 ps-3">
                                                                    <div class="thumbnail-pirce col-auto">
                                                                        list.get(i).getPrice()+"\\</div>
                                                                    <div class="thumbnail-view col-auto">
                                                                        "조회수 "+list.get(i).getSel_count()
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            --%>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="swiper-button-next"></div>
                                        <div class="swiper-button-prev"></div>
                                        <div class="swiper-pagination"></div>
                                    </div> 
                                </div>
                                <hr class="sidebar-divider">
                                <div class="mt-6">
                                    <div class="row mb-3">
                                        <div class="col-auto">
                                            <label class="mb-2 text-gray-800">완료된 강의</label>
                                        </div>
                                        <div class="col-auto ms-auto">
                                            <a class="icon-link icon-link-hover" style="font-size: 13px;" href="#">
                                                전체보기
                                                <i class="bi bi-arrow-right mb-1"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Main Content -->
                </div>
                <!-- End of Content Wrapper -->
            </div>
            <!-- End of Page Wrapper -->
            <!-- Footer -->
        </div>
        <%@include file="host-center-footer.jspf"%>
        <!-- End of Footer -->


        

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>
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
</body>

</html>