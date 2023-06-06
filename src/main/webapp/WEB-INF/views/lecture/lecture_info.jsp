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
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">

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
                                <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="../sign-in" id="signIn">로그인</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="../mypage" id="mypage">마이페이지</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <c:if test="${sessionScope.state eq 1}">
                        <li class="nav-item mx-2 flex-grow-1">
                            <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="${pageContext.request.contextPath}/host-center/" id="hostCenter">호스트센터</a>
                        </li>
                    </c:if>
                    <c:if test="${host ne null}">
                        <li class="nav-item mx-2 flex-grow-1">
                            <a class="nav-link ps-2 cursor-pointer d-flex align-items-end" href="../logout.do" id="logout">로그아웃</a>
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

    <body>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-11 col-lg-8"> <!--강의 썸네일-->
                    <div class="card thumbnail">
                        <img src="../resource/thumbnail/${result.getThumbnail()}"/>
                    </div>
                </div>
                <div class="col-md-11 col-lg-4 h-100">
                    <!--창 크기 클때만 적용-->
                    <div class="d-none d-lg-block ">
                        <div class="card card-body position-fixed w-25 p-4">
                            <div class="d-flex justify-content-between text-secondary text-sm mb-2">
                                <a href="#">${result.getKeyword()}</a> <!--강의 카테고리-->
                                <div>
                                    <i class="bi bi-eye pe-2"></i>${result.getSel_count()} <!--조회수 동적으로 가져오기-->
                                </div>
                            </div>

                            <p class="text-bold text-2xl">${result.getTitle()}</p> <!--강의명-->
                            <div class="d-flex justify-content-start">
                                <!--<img src="assets/img/cow.jpg" class="rounded-circle thumbnail"
                                     style="width:35px; height: 35px;">-->
                                <a href="#" class="ps-2 pt-1 text-bold">${result.getComname()} ></a> <!--기업명 가져오기-->
                            </div>

                            <!--option에서 default값 포함 2개 이하면 select box 안뜨게 설정해뒀음(페이지 하단 script 참조)-->
                            <!--option에서 default값 포함 3개 이상이면 select box 뜨고 option 하나 선택 후 신청하기 버튼 누르면 페이지 이동(페이지 하단 script 참조)-->
                            <select id="selectBox2" class="my-3 px-2 text-sm rounded-2"
                                    style="height: 45px; border-color:#d1d1d1;">
                                <option value="none">선택</option>
                                <c:forEach items="${lec_date}" var="date" varStatus="co">
                                    <option value="${date}">${date}</option>
                                </c:forEach>
                            </select>

                            <!--선택한 option에 따라 내용 동적으로 변경해야 함-->
                            <div id="cardContainer2" class="card bg-gray-100 shadow-none rounded-2 my-2 px-3 py-3 text-sm"
                                 style="display: none;">
                                <div id="selectOption2"></div> <!--사용자가 선택한 option값 가져오기-->
                                <div class="d-flex justify-content-between mt-3">
                                    <div class="text-info">${result.getPrice()}</div> <!--가격-->
                                    <div class="text-body">0/${result.getRec_num()}</div> <!--선착순인 경우 띄우고, 아니면 안보이게 해야 함-->
                                </div>
                            </div>
                            <!--페이지 이동은 하단 script 참조-->
                            <button id="submitButton2" class="btn btn-info mt-3 text-sm">신청하기</button>
                        </div>
                    </div>
                </div>

                <!--창 크기 줄였을 때 적용-->
                <div class="d-block d-lg-none">
                    <div class="col-md-11 col-lg-8">
                        <div class="d-flex justify-content-between text-secondary text-sm mt-3">
                            <a href="#">${result.getKeyword()}</a> <!--강의 카테고리-->
                            <div>
                                <i class="bi bi-eye pe-2"></i>${result.getSel_count()} <!--조회수 동적으로 가져오기-->
                            </div>
                        </div>

                        <p class="text-bold text-2xl">${result.getTitle()}</p><!--강의명-->
                        <div class="d-flex justify-content-start">
                            <img src="assets/img/cow.jpg" class="rounded-circle thumbnail"
                                 style="width:35px; height: 35px;">
                            <a href="#" class="ps-2 pt-1 text-bold">${result.getComname()} ></a> <!--기업명 가져오기-->
                        </div>
                    </div>

                    <div class="row">
                        <!--버튼 페이지 하단에 고정-->
                        <div class="position-fixed bottom-0 start-50 translate-middle-x bg-white z-index-2">
                            <hr>
                            <select id="selectBox" class="col-12 my-3 px-2 text-sm rounded-2"
                                    style="height: 45px; border-color:#d1d1d1; display: none;">
                                <option value="none">선택</option>
                                <c:forEach items="${lec_date}" var="date" varStatus="co">
                                    <option value="${date}">${date}</option>
                                </c:forEach>

                            </select>
                            <div id="cardContainer" class="card bg-gray-100 shadow-none rounded-2 my-2 px-3 py-3 text-sm"
                                 style="display: none;">
                                <div id="selectOption"></div> <!--사용자가 선택한 option값 가져오기-->
                                <div class="d-flex justify-content-between mt-3">
                                    <div class="text-info">${result.getPrice()}</div> <!--가격-->
                                    <div class="text-body">선착순 0/${result.getRec_num()}</div> <!--선착순인 경우 띄우고, 아니면 안보이게 해야 함-->
                                </div>
                            </div>
                            <!--페이지 이동은 하단 script 참조-->
                            <button id="showSelectButton" class="btn btn-info text-sm col-12 p-3">신청하기</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!--nav & tab-->
                <div class="col-md-11 col-lg-8 mt-4">
                    <!-- 탭 목록-->
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                    data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane"
                                    aria-selected="true">
                                강의 설명
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="location-tab" data-bs-toggle="tab"
                                    data-bs-target="#location-tab-pane" type="button" role="tab"
                                    aria-controls="location-tab" aria-selected="false">
                                위치
                            </button>
                        </li>
                    </ul>

                    <!--탭 목록 속 내용-->
                    <div class="tab-content mb-10" id="myTabContent">
                        <!--강의 설명 속 내용-->
                        <div class="tab-pane fade show active mt-3" id="home-tab-pane" role="tabpanel"
                             aria-labelledby="home-tab" tabindex="0">
                            <!--<div class="table-responsive">-->
                            <table class="table col-md-11 col-lg-8 mt-4" width="100%" cellspacing="0">
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: 80%;">
                                </colgroup>
                                <tbody>
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
                                                    <label class="text-black">${result.getAgree()}</label>
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
                                                    <label class="text-black">${result.getRec_target()}</label>
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
                                                    <label class="text-black">${result.getKeyword()}</label>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label class="text-black">강의 내용</label>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="text-black">${result.getText()}</label>
                                                </div>

                                            </div>
                                        </td>

                                    </tr>
                                    <tr></tr>
                                </tbody>
                            </table>
                            <!--</div>-->
                            <c:if test="${not result.getText_image() eq null}">
                                <img class="w-100" src = "../resource/text_image/${result.getText_image()}"/>
                            </c:if>
                        </div>

                        <!--위치 속 내용-->
                        <div class="tab-pane fade mt-3 w-100 h-100" id="location-tab-pane" role="tabpanel" aria-labelledby="profile-tab"
                             tabindex="0">
                            <table class="table col-md-11 col-lg-8 mt-4" width="100%" cellspacing="0">
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: 80%;">
                                </colgroup>
                                <tr>
                                    <th scope="row">
                                        <label class="text-black">주소</label>
                                    </th>
                                    <td>
                                        <label class="text-black" for="address">${juso[0]} ${juso[2]}</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <label class="text-black">상세주소</label>
                                    </th>
                                    <td>
                                        <label class="text-black" for="addressdetail">${juso[1]}</label>
                                    </td>
                                </tr>
                                <tr></tr>
                            </table>
                            <div class="w-100 height-500">
                                <div id="map" class="w-100 h-100 z-index-1" ></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5385b2bd1d614d808c86f0bb4257bc4&libraries=services"></script>
    <script>
            //창 줄였을 때
            const showSelectButton = document.getElementById('showSelectButton');
            const selectBox = document.getElementById('selectBox');
            const cardContainer = document.getElementById('cardContainer');
            const selectOption = document.getElementById('selectOption');

            if (selectBox.options.length <= 2) { //option이 2개 이하면
                cardContainer.style.display = 'block'; //보이게

                showSelectButton.addEventListener('click', function () {
                    window.location.href = '#'; //이동할 페이지 링크 걸면 됨
                });
            } else { //option이 3개 이상인 경우
                showSelectButton.addEventListener('click', function () {
                    selectBox.style.display = 'block'; //안보이게
                });

                selectBox.addEventListener('change', function () {
                    if (selectBox.value !== 'none') { //option 선택하면
                        cardContainer.style.display = 'block'; //보이게
                        selectOption.innerHTML = selectBox.value;
                    } else { //option 선택 안하면
                        cardContainer.style.display = 'none'; //안보이게
                    }
                });

                showSelectButton.addEventListener('click', function () {
                    if (selectBox.value !== 'none') { //option 선택하면
                        window.location.href = '${pageContext.request.contextPath}/lecture/insert_staff.do?date=' + selectBox.value; //이동할 페이지 링크 걸면 됨
                    }
                });
            }

            document.addEventListener('click', function (event) {
                if (!selectBox.contains(event.target)) {
                    selectBox.blur();
                }
            });

            //창 크기가 클 때(위랑 로직은 비슷)
            const selectBox2 = document.getElementById('selectBox2');
            const cardContainer2 = document.getElementById('cardContainer2');
            const selectOption2 = document.getElementById('selectOption2');
            const submitButton2 = document.getElementById('submitButton2');

            selectBox2.addEventListener('change', function () {
                const selectedValue = selectBox2.value;
                if (selectedValue !== 'none') {
                    submitButton2.removeAttribute('disabled');
                    cardContainer2.style.display = 'block';
                    selectOption2.innerHTML = selectBox2.value;

                } else {
                    submitButton2.setAttribute('disabled', 'disabled');
                    cardContainer2.style.display = 'none';

                }
            });

            submitButton2.addEventListener('click', function () {
                const selectedValue = selectBox2.value;
                if (selectedValue !== 'none') {
                    const link = '${pageContext.request.contextPath}/lecture/insert_staff.do?date=' + selectedValue;
                    window.location.href = link; // 이동할 URL
                }
            });
      
            document.addEventListener('click', function (event) {
                if (!selectBox.contains(event.target)) {
                    selectBox.blur();
                }
            });

            window.addEventListener('DOMContentLoaded', function () {
                const optionCount = selectBox2.options.length;
                if (optionCount <= 2) {
                    cardContainer2.style.display = 'block';
                    selectBox2.style.display = 'none';
                    submitButton2.addEventListener('click', function () {
                        window.location.href = '#'; // 이동할 URL
                    });
                } else {
                    cardContainer2.style.display = 'none';
                    selectBox2.style.display = 'block';
                }
            });


            /*//주소 받기
            var address = '${juso}';
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };
            */
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
    <!--bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
    crossorigin="anonymous"></script>
</body>

</html>