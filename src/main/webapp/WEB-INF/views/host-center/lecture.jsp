<%-- 
    Document   : lecture
    Created on : 2023. 6. 5., 오전 11:15:04
    Author     : qntjd
--%>

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
        <title>${lecture.getTitle()} 관리하기</title>

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
        <script>
    window.addEventListener('scroll', function() {
      var navbar = document.querySelector('.infonavbar');
      if (window.pageYOffset > 0) {
        navbar.classList.add('fixed-top');
      } else {
        navbar.classList.remove('fixed-top');
      }
    });
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
                            <h1 class="h3 mb-0 text-gray-800">${lecture.getTitle()}</h1>
                            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                        </div>

                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <nav class="navbar infonavbar navbar-expand-lg navbar-light bg-light  fixed-top">
                                    <ul class="navbar-nav d-flex justify-content-between">
                                        <li class="nav-item">
                                            <a class="nav-link" href="#info">강의정보</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#survey">설문</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#people">참가 인원</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="../lecture/lecture_notice?lecture=${lecture.getLectureid()}&page=1">강의실로 이동하기</a>
                                        </li>
                                    </ul>
                                </nav>
                                <div class="table-responsive">
                                    <table class="table" id="dataTable" width="100%" cellspacing="0">
                                        <colgroup>
                                            <col style="width: 20%;">
                                            <col style="width: 80%;">
                                        </colgroup>
                                        <tbody>
                                            <tr id="info">
                                                <th scope="row">
                                                    <label class="text-black">썸네일</label>
                                                </th>
                                                <td>
                                                    <div class="row">
                                                        <div class="card thumbnail-view">
                                                            <img src='${pageContext.request.contextPath}/resource/thumbnail/${lecture.getThumbnail()}' alt="${list.getThumbnail()}">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr id="survey" >
                                                <th scope="row">
                                                    <label class="text-black">등록된 설문</label>
                                                </th>
                                                <td>
                                                    <div class="row">
                                                        <%@include file="survey/surveySelectList.jspf"%>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr id="people">
                                                <th scope="row">
                                                    <label class="text-black">신청 명단</label>
                                                </th>
                                                <td>
                                                    <div class="row">
                                                        
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
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
        
        <!--강의실에 설문 설정 모달-->
        <%@include file="survey/selectSurvey.jspf"%>
        <!--강의실에 설문 설정 모달 끝-->


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
    </body>

</html>
