<%-- 
    Document   : lecture_info
    Created on : 2023. 6. 5., 오전 9:30:17
    Author     : host
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>강의 상세 페이지</title>
        <style>
            .hidden {
                display: none;
            }
        </style>
        <script>
            // JavaScript 코드
            function updateButtons() {
                var paymentCondition = true; // 결제 조건에 따라 값을 조정하세요.

                var paymentButton = document.getElementById("paymentButton");
                var applyButton = document.getElementById("applyButton");

                if (paymentCondition) {
                    paymentButton.disabled = false; // 결제하기 버튼 활성화
                    applyButton.disabled = true; // 신청하기 버튼 비활성화
                    applyButton.classList.add("hidden"); // 신청하기 버튼 숨김
                } else {
                    paymentButton.disabled = true; // 결제하기 버튼 비활성화
                    applyButton.disabled = false; // 신청하기 버튼 활성화
                    paymentButton.classList.add("hidden"); // 결제하기 버튼 숨김
                }
            }
        </script>
    </head>
    <body onload="updateButtons()">
        <h1>강의 상세 페이지</h1>
        <br>
        ${juso}
        <hr>
        <br><br>
        <div id="map" style="width:500px;height:400px;"></div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5385b2bd1d614d808c86f0bb4257bc4&libraries=services"></script>
        <script>
        var address = '${juso}';
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
        </script> <br><br>
        <button id="paymentButton" disabled>결제하기</button>
        <button id="applyButton" disabled>신청하기</button>
    </body>
</html>
