<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <button class="nav-link" id="location-tab" data-bs-toggle="tab"
                            data-bs-target="#location-tab-pane" type="button" role="tab"
                            aria-controls="location-tab" aria-selected="false">
                        강의 목록
                    </button>
                </li>
            </ul>

            <!--탭 목록 속 내용-->
            <div class="tab-content mb-10" id="myTabContent2">
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
                                                <input class="form-control"type="text" id="userid" name="userid" value="${host}" required readonly>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        <form method="POST" role="form" action="changeInfo.do">
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
                                                        <input type="text" class="form-control mb-2" id="newPassword" value="${com_name}" id="name" name="name" readonly">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control mb-2" id="newPassword" value="${name}" id="name" name="name" readonly">
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
                                                       required>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-md-2 col-sm-12 pb-2">
                                            <!--전화번호 끝 4자리-->
                                            <div class="input-group input-group-outline">
                                                <input type="text" id="phone3" name="phone3" class="form-control" maxlength="4" onKeydown="this.value = this.value.replace(/[^0-9]/g, '');"
                                                       required>
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
                                            <button type="button" class="btn btn-outline-info"
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
                    <input type="submit" class="btn btn-sm btn-outline-info me-2" value = "수정하기">
                    </form>
                    <button type="button" class="btn btn-sm btn-outline-danger me-2" onclick="doAction(0)">탈퇴하기</button>
                    <button type="button" class="btn btn-sm btn-outline-none" onclick="doAction(1)">뒤로가기</button>
                </div>

                </div>

                <!--강의 목록 속 내용-->
                <div class="tab-pane fade mt-3 w-100 h-100" id="location-tab-pane" role="tabpanel" aria-labelledby="profile-tab"
                     tabindex="0">
                    sdaf
                    <br><br>
             <h4> 강의내역조회 </h4>
                <table border="1">
                    <th>과목명</th>
                    <th>개설자</th>                                         
                    <th>수강 기간</th>
                    <th>참여 구분</th>
                    <th>신청 상태</th>
                        <c:forEach  var="lec" items="${lecList}" >
                        <tr align="center">
                            <td>${lec.title}</td>
                            <td>${lec.host}</td>
                            <td>${lec.date}</td>                           
                            <td>${lec.user_state}</td> 
                            <td>${lec.enroll_state}</td>                                                                                     
                        </tr>
                    </c:forEach>
                    <%--
                        
                    --%>
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
                const link = '${pageContext.request.contextPath}/delUser.do?userid =' + ${host};
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

