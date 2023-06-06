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
                            <a href="../lecture/lecture_notice?lecture=${lecture.getLectureid()}&page=1" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                강의실 입장</a>
                        </div>

                        <div class="card shadow mb-4">
                            <div class="card-body ">
                                <div class="row">
                                    <!--nav & tab-->
                                    <div class="w-100">
                                        <ul class="nav nav-tabs " id="hostLectureTab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="info-tab" data-bs-toggle="tab"
                                                        data-bs-target="#info-tab-pane" type="button" role="tab" aria-controls="info-tab-pane"
                                                        aria-selected="true">
                                                    강의
                                                </button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="applicants-tab" data-bs-toggle="tab"
                                                        data-bs-target="#applicants-tab-pane" type="button" role="tab"
                                                        aria-controls="applicants-tab-pane" aria-selected="false">
                                                    명단
                                                </button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="survey-tab" data-bs-toggle="tab"
                                                        data-bs-target="#survey-tab-pane" type="button" role="tab"
                                                        aria-controls="survey-tab-pane" aria-selected="false">
                                                    설문
                                                </button>
                                            </li>
                                        </ul>
                                        <!--탭 안에 콘텐츠-->
                                        <div class="tab-content w-100" id="lectureTabContent">
                                            <!--강의 정보 탭-->
                                            <div class="tab-pane fade show active mt-3 " id="info-tab-pane" role="tabpanel" aria-labelledby="info-tab"
                                                 tabindex="0">
                                                <div class="table-responsive">
                                                    <table class="table " width="100%"  cellspacing="0">
                                                        <colgroup>
                                                            <col style="width: 20%;">
                                                            <col style="width: 80%;">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row" >
                                                                    <label class="text-black">썸네일</label>
                                                                </th>
                                                                <td>
                                                                    <div class="col-md-3 col-sm-8"> <!--강의 썸네일-->
                                                                        <div class="card thumbnail">
                                                                            <img src='${pageContext.request.contextPath}/resource/thumbnail/${lecture.getThumbnail()}' alt="${list.getThumbnail()}">
                                                                        </div>
                                                                    </div>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <label class="text-black">모집기간</label>
                                                                </th>
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <label class="text-black">${rec_date}</label>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <label class="text-black">모집유형</label>
                                                                </th>
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <label class="text-black">${lecture.getAgree()}</label>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <label class="text-black">강의기간</label>
                                                                </th>
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <c:forEach items="${lec_date}" var="date" varStatus="co">
                                                                                <label class="text-black">${date}</label>
                                                                                <c:if test="${not co.end}">
                                                                                    <br>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <label class="text-black">강의대상</label>
                                                                </th>
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <label class="text-black">${lecture.getRec_target()}</label>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <label class="text-black">Keyword</label>
                                                                </th>
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <label class="text-black">${lecture.getKeyword()}</label>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <label class="text-black">강의내용</label>
                                                                </th>
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <label class="text-black">${lecture.getText()}</label>
                                                                        </div>
                                                                        <c:if test="${not result.getText_image() eq null}">
                                                                            <img class="w-100" src = "${pageContext.request.contextPath}/resource/text_image/${result.getText_image()}"/>
                                                                        </c:if>
                                                                    </div>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <th scope="row">
                                                                    <label class="text-black">주소</label>
                                                                </th>
                                                                <td>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            기본 주소 : <label class="text-black" for="address">${juso[0]} ${juso[2]}</label><br>
                                                                            상세 주소 : <label class="text-black" for="addressdetail">${juso[1]}</label>
                                                                        </div>
                                                                        <div class="w-100 height-500">
                                                                            <div id="map" class="w-100 h-100" ></div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr></tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <!-- 명단 관리 탭-->
                                            <div class="tab-pane fade mt-3 " id="applicants-tab-pane" role="tabpanel" aria-labelledby="applicants-tab"
                                                 tabindex="0">
                                                <div class="row">
                                                    <div class="d-flex justify-content-between w-100">
                                                        <label class="h5 text-black">참여 명단</label>
                                                        <select class="text-sm rounded-2 mb-2" style="border-color:#d1d1d1;">
                                                            <option value="mente">수강자</option>
                                                            <option value="mento">강사</option>
                                                            <option value="staff">스태프</option>
                                                        </select>
                                                    </div>
                                                    <div class="table-responsive ">
                                                        <table class="table" width="100%"  cellspacing="0">
                                                            <colgroup>
                                                                <col style="width: 10%;">
                                                                <col style="width: 20%;">
                                                                <col style="width: 30%;">
                                                                <col style="width: 30%;">
                                                                <col style="width: 10%;">
                                                            </colgroup>
                                                            <tr>
                                                                <th>No.</th>
                                                                <th class="text-center">이름</th>
                                                                <th class="text-center">전화번호</th>
                                                                <th class="text-center">생년월일</th>
                                                                <th class="text-center">비고</th>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade mt-3 " id="survey-tab-pane" role="tabpanel" aria-labelledby="survey-tab"
                                                 tabindex="0">
                                                <div class="row">
                                                    <div class="w-100">
                                                        <div class="justify-content-center">
                                                            <button class="btn btn-outline-info center" data-toggle="modal" data-target="#selectSurveyModal">설문 등록</button>
                                                        </div>
                                                        <%@include file="survey/surveySelectList.jspf"%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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

        <%@include file="host-center-footer.jspf"%>
        <!-- End of Footer -->

        <!--강의실에 설문 설정 모달-->
        <%@include file="survey/selectSurvey.jspf"%>
        <!--강의실에 설문 설정 모달 끝-->

        <%--
        <!-- Bootstrap core JavaScript-->
        <!--<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>-->
        <!--<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>-->

        <!-- Core plugin JavaScript-->
        <!--<script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>-->

        <!-- Custom scripts for all pages-->
        <!--<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>-->

        <!-- Page level plugins -->
        <!--<script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>-->

        <!-- Page level custom scripts -->
        <!--<script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>-->
        <!--<script src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>-->
        <!-- Swiper JS -->
        <!--<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>-->
        --%>

    </body>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5385b2bd1d614d808c86f0bb4257bc4&libraries=services"></script>
    <script>
                //주소 받기
                var address = `${juso[0]} ${juso[1]}${juso[2]}`;

                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                            mapOption = {
                                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                level: 3 // 지도의 확대 레벨
                            };

                    // 지도를 생성합니다    
                    var map = new kakao.maps.Map(mapContainer, mapOption);

                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new kakao.maps.services.Geocoder();

                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch(
                            address,
                            function (result, status) {

                                // 정상적으로 검색이 완료됐으면 
                                if (status === kakao.maps.services.Status.OK) {

                                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                                    // 결과값으로 받은 위치를 마커로 표시합니다
                                    var marker = new kakao.maps.Marker({
                                        map: map,
                                        position: coords
                                    });

                                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                                    var infowindow = new kakao.maps.InfoWindow();
                                    infowindow.open(map);

                                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                    map.setCenter(coords);
                                }
                            }
                    );
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
    crossorigin="anonymous"></script>
</html>
