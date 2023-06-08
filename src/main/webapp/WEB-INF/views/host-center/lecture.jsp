<%-- 
    Document   : lecture
    Created on : 2023. 6. 5., 오전 11:15:04
    Author     : qntjd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <style>
            .rating {
                display: inline-block;
                font-size: 1.5rem;
                color: #ffd700;
            }
            .rating .fa-star {
                position: relative;
            }
            .rating .fa-star::before {
                content: "\f005";
                position: absolute;
                top: 0;
                left: 0;
                width: 50%;
                overflow: hidden;
            }
            .rating .fa-star::after {
                content: "\f089";
                position: absolute;
                top: 0;
                left: 0;
                width: 50%;
                overflow: hidden;
                color: #ffd700;
            }
        </style>
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
                            <div>
                                <a href="lecture_start.do" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                    강의 시작</a>
                                <a href="../lecture/lecture_notice?lecture=${lecture.getLectureid()}&page=1" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                    강의실 입장</a>
                            </div>
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
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="review-tab" data-bs-toggle="tab"
                                                        data-bs-target="#review-tab-pane" type="button" role="tab"
                                                        aria-controls="review-tab-pane" aria-selected="false">
                                                    리뷰
                                                </button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="graph-tab" data-bs-toggle="tab"
                                                        data-bs-target="#graph-tab-pane" type="button" role="tab"
                                                        aria-controls="graph-tab-pane" aria-selected="false">
                                                    그래프
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
                                                        <div>
                                                            <select class="text-sm rounded-2 mb-2" id="stateList" onchange="regiListChange()" style="border-color:#d1d1d1;">
                                                                <option value="2">수강자</option>
                                                                <option value="0">강사</option>
                                                                <option value="1">스태프</option>
                                                            </select>
                                                            <select class="text-sm rounded-2 mb-2" id="dateList" onchange="regiListChange()" style="border-color:#d1d1d1;">
                                                                <c:forEach items="${lec_date}" var="date" varStatus="co">
                                                                    <option value="${date}">${co.count}회차 - ${date}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="table-responsive " id="regiList" >
                                                        <%--
                                                        <table class="table" width="100%"  cellspacing="0">
                                                            <colgroup>
                                                                <col style="width: 5%;">
                                                                <col style="width: 5%;">
                                                                <col style="width: 10%;">
                                                                <col style="width: 20%;">
                                                                <col style="width: 20%;">
                                                                <col style="width: 20%;">
                                                                <col style="width: 5%;">
                                                                <col style="width: 5%;">
                                                            </colgroup>
                                                            <thead>
                                                            <tr>
                                                                <th></th>
                                                                <th class="text-center">No.</th>
                                                                <th class="text-center">이름</th>
                                                                <th class="text-center">전화번호</th>
                                                                <th class="text-center">생년월일</th>
                                                                <th class="text-center">신청결과</th>
                                                                <th class="text-center">수락</th>
                                                                <th class="text-center">거절</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${regiList}" var="list" varStatus="co">
                                                                <c:if test="${list.getState() == 2 && list.getDate() eq lec_date[0]}">
                                                                    <tr>
                                                                        <th class="text-center"><input type="checkbox" id="check-${list.getId()}"></th>
                                                                        <th class="text-center">${fn:length(regiList)-co.index}</th>
                                                                        <th class="text-center">${list.getName()}</th>
                                                                        <th class="text-center">${list.getPhone()}</th>
                                                                        <th class="text-center">${list.getBirth()}</th>
                                                                        <th class="text-center">${list.getEnState()}</th>
                                                                        <th class="text-center"><input type="button" id="accept-${list.getId()}" value="수락"></th>
                                                                        <th class="text-center"><input type="button" id="refusal-${list.getId()}" value="거절"></th>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                                    </tbody>
                                                        </table>
                                                        --%>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--등록 설문 탭-->
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
                                            <!--강의 리뷰 탭-->
                                            <div class="tab-pane fade mt-3 " id="review-tab-pane" role="tabpanel" aria-labelledby="review-tab"
                                                 tabindex="0">
                                                <div class="row">
                                                    <div class="table-responsive ">
                                                        <table class="table" width="100%"  cellspacing="0">
                                                            <colgroup>
                                                                <col style="width: 10%;">
                                                                <col style="width: 20%;">
                                                                <col style="width: 30%;">
                                                                <col style="width: 30%;">
                                                            </colgroup>
                                                            <tr>
                                                                <th class="text-center">No.</th>
                                                                <th >리뷰</th>
                                                                <th class="text-center">평점</th>
                                                                <th class="text-center">작성 날짜</th>
                                                            </tr>
                                                            <c:forEach items="${reviewList}" var="review">
                                                                <tr>
                                                                    <td class="text-center">${review.getNo()}</td>
                                                                    <td >${review.getReview()}</td>
                                                                    <td class="text-center">
                                                                        <c:forEach begin="1" end="5" var="rate">
                                                                            <c:choose >
                                                                                <c:when test="${rate <= review.getGrade()}">
                                                                                    <label class="text-warning">★</label>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <label class="text-secondary">★</label>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </c:forEach>
                                                                    <td class="text-center">${review.getDate()}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                            <!--강의 그래프 탭-->
                                            <div class="tab-pane fade mt-3 " id="graph-tab-pane" role="tabpanel" aria-labelledby="graph-tab" tabindex="0">
                                                <div class="row">
                                                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                                                    <div style="display: flex;">
                                                        <div>
                                                            날짜별 신청 인원 <br>
                                                            <!-- 드롭다운 메뉴 -->
                                                            <select class="text-sm rounded-2 mb-2" id="dateDropdown" style="border-color:#d1d1d1;" onchange="updateChart()">
                                                                <c:forEach items="${lec_date}" var="date" varStatus="co">
                                                                    <option value="${date}">${date}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <canvas id="doughnutChart" width="500" height="500"></canvas>
                                                        </div>
                                                        <div>
                                                            설문별 참여 인원 <br> <br>
                                                            <canvas id="surveyChart" width="500" height="500"></canvas>
                                                        </div>
                                                        <div>
                                                            날짜별 출석 인원 <br> <br>
                                                            <canvas id="checkChart" width="500" height="500"></canvas>
                                                        </div>
                                                    </div>
                                                    <script>
                                                        // 도넛차트 (날짜별 신청 인원) 
                                                        var chartArea2 = document.getElementById('doughnutChart').getContext('2d');

                                                        var dates = ${dates};
                                                        var counts = ${counts};
                                                        var rec_num = ${rec_num};

                                                        // 차트를 생성한다.
                                                        var doughnutChart = new Chart(chartArea2, {
                                                            // ①차트의 종류(String)
                                                            type: 'doughnut',
                                                            // ②차트의 데이터(Object)
                                                            data: {
                                                                // ③x축에 들어갈 이름들(Array)
                                                                 labels: ['신청 인원', '최대 인원'],
                                                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                                                datasets: [{
                                                                        // ⑤dataset의 이름(String)
                                                                        label: '# 신청인원',
                                                                        // ⑥dataset값(Array)
                                                                        data: [counts[0], rec_num],
                                                                        // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                                                        backgroundColor: [
                                                                            'rgba(255, 99, 132, 0.2)',
                                                                            'rgba(54, 162, 235, 0.2)',
                                                                            'rgba(255, 206, 86, 0.2)',
                                                                            'rgba(75, 192, 192, 0.2)',
                                                                            'rgba(153, 102, 255, 0.2)',
                                                                            'rgba(255, 159, 64, 0.2)'
                                                                        ],
                                                                        // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                                                        borderColor: [
                                                                            'rgba(255, 99, 132, 1)',
                                                                            'rgba(54, 162, 235, 1)',
                                                                            'rgba(255, 206, 86, 1)',
                                                                            'rgba(75, 192, 192, 1)',
                                                                            'rgba(153, 102, 255, 1)',
                                                                            'rgba(255, 159, 64, 1)'
                                                                        ],
                                                                        // ⑨dataset의 선 두께(Number)
                                                                        borderWidth: 1
                                                                    }]
                                                            },
                                                            // ⑩차트의 설정(Object)
                                                            options: {
                                                                // ⑪축에 관한 설정(Object)
                                                                responsive: false,
                                                                scales: {
                                                                    // ⑫y축에 대한 설정(Object)
                                                                    y: {
                                                                        // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                                                                        beginAtZero: true,
                                                                        ticks: {
                                                                            stepSize: 1
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        });

                                                        // 드롭다운 메뉴에서 날짜 선택 시 차트 업데이트
                                                        function updateChart() {
                                                            var selectedDate = document.getElementById('dateDropdown').value;
                                                            var index = dates.indexOf(selectedDate);
                                                            if (index > -1) {
                                                                doughnutChart.data.datasets[0].data = [counts[index], rec_num];
                                                                doughnutChart.update();
                                                            }
                                                        }
                                                    </script>

                                                    <script>
                                                        // 막대바 (설문별 참여 인원) 
                                                        var chartArea = document.getElementById('surveyChart').getContext('2d');

                                                        var surveynames = ${surveynames};
                                                        var rowcounts = ${rowcounts}

                                                        // 차트를 생성한다. 
                                                        var surveyChart = new Chart(chartArea, {
                                                            // ①차트의 종류(String)
                                                            type: 'bar',
                                                            // ②차트의 데이터(Object)
                                                            data: {
                                                                // ③x축에 들어갈 이름들(Array)
                                                                labels: surveynames,
                                                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                                                datasets: [{
                                                                        // ⑤dataset의 이름(String)
                                                                        label: '# 설문 참여 인원',
                                                                        // ⑥dataset값(Array)
                                                                        data: rowcounts,
                                                                        // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                                                        backgroundColor: '#F2F3F6',
                                                                        // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                                                        borderColor: '#000000',
                                                                        // ⑨dataset의 선 두께(Number)
                                                                        borderWidth: 1
                                                                    }]
                                                            },
                                                            // ⑩차트의 설정(Object)
                                                            options: {
                                                                // ⑪축에 관한 설정(Object)
                                                                responsive: false,
                                                                scales: {
                                                                    // ⑫y축에 대한 설정(Object)
                                                                    y: {
                                                                        // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                                                                        beginAtZero: true,
                                                                        ticks: {
                                                                            stepSize: 1
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        });
                                                    </script>

                                                    <script>
                                                        // 도넛차트 (날짜별 출석 인원) 
                                                        var chartArea3 = document.getElementById('checkChart').getContext('2d');
                                                        // 차트를 생성한다.
                                                        var checkChart = new Chart(chartArea3, {
                                                            // ①차트의 종류(String)
                                                            type: 'doughnut',
                                                            // ②차트의 데이터(Object)
                                                            data: {
                                                                // ③x축에 들어갈 이름들(Array)
                                                                labels: dates,
                                                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                                                datasets: [{
                                                                        // ⑤dataset의 이름(String)
                                                                        label: '# 출석인원',
                                                                        // ⑥dataset값(Array)
                                                                        data: [20, 60],
                                                                        // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                                                        backgroundColor: [
                                                                            'rgba(255, 99, 132, 0.2)',
                                                                            'rgba(54, 162, 235, 0.2)',
                                                                            'rgba(255, 206, 86, 0.2)',
                                                                            'rgba(75, 192, 192, 0.2)',
                                                                            'rgba(153, 102, 255, 0.2)',
                                                                            'rgba(255, 159, 64, 0.2)'
                                                                        ],
                                                                        // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                                                        borderColor: [
                                                                            'rgba(255, 99, 132, 1)',
                                                                            'rgba(54, 162, 235, 1)',
                                                                            'rgba(255, 206, 86, 1)',
                                                                            'rgba(75, 192, 192, 1)',
                                                                            'rgba(153, 102, 255, 1)',
                                                                            'rgba(255, 159, 64, 1)'
                                                                        ],
                                                                        // ⑨dataset의 선 두께(Number)
                                                                        borderWidth: 1
                                                                    }]
                                                            },
                                                            // ⑩차트의 설정(Object)
                                                            options: {
                                                                // ⑪축에 관한 설정(Object)
                                                                responsive: false,
                                                                scales: {
                                                                    // ⑫y축에 대한 설정(Object)
                                                                    y: {
                                                                        // ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
                                                                        beginAtZero: true,
                                                                        ticks: {
                                                                            stepSize: 1
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        });
                                                    </script>
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


        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->

        <!-- Page level plugins -->
        <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>
        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5385b2bd1d614d808c86f0bb4257bc4&libraries=services"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script>
            // ArrayList 데이터를 담을 JavaScript 변수
            var list = [];
            
            var listIn = document.getElementById("regiList");
            var statedropdown = document.getElementById("stateList");
            var datedropdown = document.getElementById("dateList");
            // 스프링 컨트롤러에서 전달받은 데이터를 JavaScript 변수에 할당
            //모델로 넘겨받은 신청 리스트 옮기기
            window.onload = function(){
                <c:forEach items="${regiList}" var="data" varStatus="co">
                  list.push({
                    id : "${data.getId()}",
                    no : "${fn:length(regiList)-co.index}",
                    name : "${data.getName()}",
                    phone : "${data.getPhone()}",
                    birth : "${data.getBirth()}",
                    date : "${data.getDate()}",
                    state : "${data.getState()}",
                    enstate : "${data.getEnState()}"
                  });
                </c:forEach>
                statedropdown.addEventListener('change', regiListChange);
                datedropdown.addEventListener('change', regiListChange);
                regiListChange();
            };
            
            
            //신청 목록 변경 함수
            function regiListChange() {
                
                
                var stateselectedValue = statedropdown.value;
                var dateselectedValue = datedropdown.value;
                var str = `<table class="table" width="100%"  cellspacing="0">
                        <colgroup>
                            <col style="width: 5%;">
                            <col style="width: 5%;">
                            <col style="width: 10%;">
                            <col style="width: 20%;">
                            <col style="width: 20%;">
                            <col style="width: 20%;">
                            <col style="width: 10%;">
                            <col style="width: 10%;">
                        </colgroup>
                        <thead>
                        <tr>
                            <th></th>
                            <th class="text-center">No.</th>
                            <th class="text-center">이름</th>
                            <th class="text-center">전화번호</th>
                            <th class="text-center">생년월일</th>
                            <th class="text-center">신청결과</th>
                            <th class="text-center">수락</th>
                            <th class="text-center">거절</th>
                        </tr>
                        </thead> 
                        <tbody>`;
                        var co = 1;
                        
                        
                        var colist=[];
                list.forEach(function(item) {
                    if (item.state == stateselectedValue && item.date == dateselectedValue) {
                        str += `<tr scope="row">
                                <th class="text-center"><input type="checkbox" id="check-`+item.id+`"></th>
                                <th class="text-center" id="co-`+ co +`"></th>
                                <th class="text-center">`+item.name+`</th>
                                <th class="text-center">`+item.phone+`</th>
                                <th class="text-center">`+item.birth+`</th>
                                <th class="text-center">`+item.enstate+`</th>
                                <th class="text-center"><button class="btn btn-outline-info center" onclick="location.href='accept.do?str=accept-`+ item.id +`'" type="button">수락</th>
                                <th class="text-center"><button class="btn btn-outline-info center" onclick="location.href='accept.do?str=refusal-`+ item.id +`'" type="button">거절</th>
                              </tr>`;
                              colist.push("co-"+co);
                        co++;
                    }
                    
                  });
                  
                  str+=`</tbody></table>`;

                listIn.innerHTML = str;
                var count=0;
                  var total =colist.length;
                 colist.forEach(function(item){
                     document.getElementById(item).innerHTML = total-count;
                     count++;
                 });
            }


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
