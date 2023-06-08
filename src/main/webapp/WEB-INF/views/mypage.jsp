<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">

        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
    </head>
    <%@include file="header.jspf" %>
    <body>
        <div class="container m-5 mx-auto">
            <script>

            function validate() {
                var re = /^[a-zA-Z0-9]{4,12}$/
                var re2 = /^[0-9]{4,4}$/;
                var re4 = /^[A-Za-z0-9]{8,16}$/;

               
                var pw2 = document.getElementById("newPassword");
                var ph1 = document.getElementById("phone2");
                var ph2 = document.getElementById("phone3");


                if (!check(re4, pw2, "비밀번호는 8~16자의 영문 대소문자와 숫자로만 입력")) {
                    return false;
                }
                if (!check(re2, ph1, "전화번호는 숫자로만 입력할 수 있으며 4자리를 입력")) {
                    return false;
                }
                if (!check(re2, ph2, "전화번호는 숫자로만 입력할 수 있으며 4자리를 입력")) {
                    return false;
                }
                document.getElementById('keyword').value = document.getElementById('selectedSubcategories').innerText;
                sessionStorage.removeItem("user");
                function check(re, what, message) {
                    if (re.test(what.value)) {
                        return true;
                    }
                    alert(message);
                    what.value = "";
                    what.focus();
                }
            }
            </script>
            <h5>마이페이지</h5>


            <!--nav & tab-->
            <!-- 탭 목록-->
            <ul class="nav nav-tabs mt-5" id="myTab2" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                            data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane"
                            aria-selected="true">
                        회원정보 수정
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="list-tab" data-bs-toggle="tab"
                            data-bs-target="#list-tab-pane" type="button" role="tab"
                            aria-controls="list-tab-pane" aria-selected="false">
                        강의 목록
                    </button>
                </li>
            </ul>

            <!--탭 목록 속 내용-->
            <div class="tab-content" id="myTabContent2">
                <!--회원정보 수정 속 내용-->
                <div class="tab-pane fade show active mt-3" id="home-tab-pane" role="tabpanel"
                     aria-labelledby="home-tab" tabindex="0">
                   
                        <table class="table">
                            <colgroup>
                                <col style="width: 20%;">
                                <col style="width: 80%;">
                            </colgroup>
                            <tbody style="border-top:none;">

                                <tr>
                                    <th scope="row">
                                        <label for="id" class="text-black">아이디</label>
                                    </th>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-group input-group-outline mb-2">
                                                    <input class="form-control" type="text" id="userid" name="userid" value="${host}" required readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                 <form method="POST" onsubmit ="return validate();" role="form" action="changeInfo.do">
                                <tr>
                                    <th scope="row">
                                        <label for="password" class="text-black">현재 비밀번호</label>
                                        <span class="text-warning">*</span>
                                    </th>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-group input-group-outline">
                                                    <input type="password" class="form-control mb-2" id="currentPassword" name="currentPassword" required>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <label for="newPassword" class="text-black">변경할 비밀번호</label>
                                    </th>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-group input-group-outline">
                                                    <input type="password" class="form-control mb-2" id="newPassword" name="newPassword">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <c:choose>
                                            <c:when test="${sessionScope.state eq 1}">
                                                <label for="name" class="text-black">기업명</label>
                                            </c:when>
                                            <c:otherwise>
                                                <label for="name" class="text-black">이름</label>
                                            </c:otherwise>
                                        </c:choose>
                                    </th>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="input-group input-group-outline">
                                                    <c:choose>
                                                        <c:when test="${sessionScope.state eq 1}">
                                                            <input type="text" class="form-control mb-2" id="newPassword" value="${com_name}" id="name" name="name" readonly>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control mb-2" id="newPassword" value="${name}" id="name" name="name" readonly>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <c:if test="${sessionScope.state eq 1}">
                                    <tr>
                                        <th scope="row">
                                            <label for="name" class="text-black">대표자명</label>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" class="form-control mb-2" id="name" name="id" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                                <tr>
                                    <th scope="row">
                                        <label for="phone" class="text-black">전화번호</label>
                                        <span class="text-warning">*</span>
                                    </th>
                                    <td>
                                        <div class="row">
                                            <div class="col-lg-2 col-md-2 col-sm-12 pb-2">
                                                <!--전화번호 앞 3자리-->
                                                <select id="phone1" name="phone1" class="form-select ps-md-2" required>
                                                    <option value="">식별번호</option>
                                                    <option value="010">010</option>
                                                    <option value="011">011</option>
                                                    <!-- 옵션 추가 더 할거 있나?-->
                                                </select>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-12 pb-2">
                                                <!--전화번호 중간 4자리-->
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="phone2" name="phone2" class="form-control" maxlength="4" onKeydown="this.value = this.value.replace(/[^0-9]/g, '');"
                                                           value =${phone2} required>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-sm-12 pb-2">
                                                <!--전화번호 끝 4자리-->
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="phone3" name="phone3" class="form-control" maxlength="4" onKeydown="this.value = this.value.replace(/[^0-9]/g, '');"
                                                           value=${phone3} required>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">
                                        <label for="phone" class="text-black">주소</label>
                                        <span class="text-warning">*</span>
                                    </th>
                                    <td>
                                        <div class="row">
                                            <div class="col-md-6 pb-2">
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="postcode" name="postcode" value="${postcode}" placeholder="우편번호"
                                                           class="form-control" readonly>
                                                </div>
                                            </div>
                                            <div class="col-auto pb-2">
                                                <button type="button" class="btn btn-outline-info btn-sm mt-1"
                                                        onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                            </div>
                                            <div class="col-md-7 pb-2">
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="address" name="address" value="${address}" placeholder="주소"
                                                           class="form-control" readonly>
                                                </div>
                                            </div>
                                            <div class="col-md-7 pb-2">
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="detail" name="detail" value="${detail}" placeholder="상세주소"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-7">
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="extra" name="extra"  value="${extra}" placeholder="참고항목"
                                                           class="form-control" readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                        </table>
                        <div class="d-flex justify-content-center">
                            <input type="submit" class="btn btn-info me-2" value = "수정하기">
                            </form>
                            <button type="button" class="btn btn-danger me-2" onclick="doAction(0)">탈퇴하기</button>
                            <button type="button" class="btn btn-outline-none" onclick="doAction(1)">뒤로가기</button>
                        </div>
                </div>
            </div>

            <!--강의 목록 속 내용-->
            <div class="tab-pane fade mt-3" id="list-tab-pane" role="tabpanel" aria-labelledby="list-tab"
                 tabindex="0">
                <div class="row">
                    <div class="d-flex justify-content-between align-items-center">
                        <!-- 상태 선택 -->
                        <div class="col-lg-2 col-md-2 col-sm-4 my-3 px-2 text-sm">
                            <select class="form-select rounded-2 ps-2" style="height: 45px; border-color:#d1d1d1;">
                                <option value="none">선택</option>
                                <option value="value1">시작 전</option>
                                <option value="value2">진행 중</option>
                                <option value="value3">종료</option>
                            </select>
                        </div>
                        <!-- 검색 -->
                        <div class="col-lg-3 col-md-4 col-sm-12 d-flex mt-3 justify-contment-end">
                            <form class="d-flex" method="GET" role="form">
                                <div class="input-group input-group-outline">
                                    <input type="text" placeholder="강의명을 입력하세요" class="form-control" style="height:45px;">
                                </div>
                                <button class="btn btn-outline-info col-auto ms-2" style="height:45px;">검색</button>
                            </form>
                        </div>
                    </div>
                </div>



                <div style="overflow-x: auto;">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col"  class="text-center">No</th>
                                <th scope="col">강의명</th>
                                <th scope="col">개설자</th>
                                <th scope="col">수강기간</th>
                                <th scope="col">참여구분</th>
                                <th scope="col">신청상태</th>
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            <tr  style="cursor:pointer;"
                                onMouseover="this.style.color = '#1A73E8';" onMouseout="this.style.color = '#344767'";>
                                <c:set var="i" value = "${i+1}"/>
                                <c:forEach  var="lec" items="${lecList}" varStatus="co">                                                    
                                    <th scope="row" class="text-center">${fn:length(lecList)-co.index}</th>
                                    <td class="text-ellipsis" onClick="location.href = 'lecture/lecture_room?lecture=${lec.lectureid}'">${lec.title}</td>
                                    <td class="text-ellipsis">${lec.host}</td>
                                    <td class="text-ellipsis">${lec.date}</td>
                                    <td class="text-ellipsis">${lec.user_state}</td>
                                    <td class="text-ellipsis">${lec.enroll_state}</td>
                                </tr>
                            </c:forEach><tr></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script>
        function checkReg(event) {
            const regExp = /[^0-9]/g; // 숫자만 허용
            //   const regExp = /[^ㄱ-ㅎ|가-힣]/g; // 한글만 허용
            const del = event.target;
            if (regExp.test(del.value)) {
                del.value = del.value.replace(regExp, '');
            }
        }
        ;
    </script>
    <script>
        function doAction(event) {
            if (event == 1) {
                const link = '${pageContext.request.contextPath}';
                location.href = link;
            } else {
                const link = '${pageContext.request.contextPath}/delUser.do';
                location.href = link;
            }
        }
    </script>
    <script src="./assets/material-kit.min.js?v=3.0.4" type="text/javascript"></script> <!--이거 있어야 입력 폼 애니메이션 들어감-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/info.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
    crossorigin="anonymous"></script>
</html>

