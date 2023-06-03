<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">

    <head>
        <script src="./js/kakao_api/kakao_login.js" type="text/javascript"></script>
        <!-- 카카오 js -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        
        <%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

        <!-- favicon 설정 -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">

        <title>
            로그인
        </title>

        <!--font 설정-->
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
    <body>
        <div class="container mt-9 mx-auto">
            <div class="text-center mb-5">
                <a href="${pageContext.request.contextPath}">
                    <h3>보조배터리</h3>
                </a>
            </div>
            <div class="row justify-content-center mt-3">
                <div class="d-flex flex-column align-items-center col-lg-4 col-md-6 col-sm-10 pe-5">
                    <form method="POST" role="form" class="text-start" style="width: 300px;" action="${pageContext.request.contextPath}/login.do">
                        <h6>로그인</h6>
                        <div class="input-group input-group-outline my-3">
                            <input type="radio" name="chk_state" value="user" checked>사용자&nbsp;&nbsp;
                            <input type="radio" name="chk_state" value="business">비즈니스
                        </div>
                        <div class="input-group input-group-outline my-3">
                            <label class="form-label">Id</label>
                            <input type="text" class="form-control" name="userid">
                        </div>
                        <div class="input-group input-group-outline mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password">
                        </div>
                        <div class="text-center">
                            <input type="submit" value="Sign in"class="btn bg-gradient-info my-4 mb-3" style="width: 300px;">
                            <!--❗이게 카카오 로그인 버튼❗-->
                            <a href="#service" id="kakao" class="mb-2" onclick="kakao_login();" style="text-decoration: none;"><img src="assets/img/kakao_login_medium_wide.png"></a>
                           <!-- <button type="button" id="kakao" class="mb-2" onclick="kakao_login()"><img src="assets/img/kakao_login_medium_wide.png"></button>-->
                        </div>
                    </form>

                    <div class="row justify-content-center mt-3">
                        <p class="text-center col-auto"><a href="#" class="link-secondary link-offset-2" style="font-size: 15px;">아이디 찾기</a></p>
                        <p class="text-center col-auto"><a href="#" class="link-secondary link-offset-2" style="font-size: 15px;">비밀번호 찾기</a></p>
                    </div>
                    <div class="vertical-line d-none d-lg-block" style="height: 100%;"></div><!--수직선-->
                    <div class="d-block d-lg-none my-5" style="width: 100%; border-top: 1px solid #99a3ab;"></div> <!--수평선-->
                </div>
                <div class="d-fex flex-colum col-lg-4 col-md-6 col-sm-10 mx-3">
                    <div class="row mb-6">
                        <h6>회원가입</h6>
                    </div>
                    <div class="row">
                        <div class="col text-center border-end">
                            일반 회원
                            <button type="button" onclick="location.href = 'sign-up'" class="btn btn-outline-info w-100 my-4 mb-2">가입하기</button>
                        </div>
                        <div class="col text-center">
                            비즈니스 회원
                            <button type="button" onclick="location.href = 'business-sign-up'" class="btn btn-outline-info w-100 my-4 mb-2">가입하기</button>
                        </div>
                        <div class="mb-5"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!--bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <script src="./assets/material-kit.min.js?v=3.0.4" type="text/javascript"></script> <!--이거 있어야 입력 폼 애니메이션 들어감-->
</body>
</html>