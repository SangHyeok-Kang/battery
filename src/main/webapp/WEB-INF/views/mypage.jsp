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
         <script>
            <c:if test="${!empty msg}">
                alert("${msg}");
            </c:if>
        </script>
    </head>
    <body>
        <h1>마이페이지</h1>
        <div class ="mypage">
            <div>
                <label for="userid">아이디:</label>
                <input type="text" id="userid" name="userid" value="${host}" required style="width:auto" readonly>                    
            </div>

            <form method="POST" role="form" class="text-start" style="width: 300px;" action="changeInfo.do">
                <label for="password">현재 비밀번호:</label>
                <input type="password" id="currentPassword" name="currentPassword" required style="width:auto"; ><br>
                <label for="newPassword">변경할 비밀번호:</label>
                <input type="password" id="newPassword" name="newPassword" style="width:auto"; ><br>                 


                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="${name}" required style="width:auto" readonly><br><br>

                <label for="phone">전화번호:</label>
                <input type="tel" id="phone1" name="phone1" maxlength="3" value="${phone1}" required onkeyup="checkReg(event)">
                -
                <input type="tel" id="phone2" name="phone2" maxlength="4" value="${phone2}" required onkeyup="checkReg(event)">
                -
                <input type="tel" id="phone3" name="phone3" maxlength="4" value="${phone3}" required onkeyup="checkReg(event)"> <br><br>


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
                <br>

                <input type="submit" value = "수정하기">
                <button type="submit" formaction="${pageContext.request.contextPath }/delUser.do">탈퇴하기</button>
                <button onclick="history.back()">뒤로가기</button>
            </form>
        </div>
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
    </body>
    <script src="./assets/material-kit.min.js?v=3.0.4" type="text/javascript"></script> <!--이거 있어야 입력 폼 애니메이션 들어감-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/info.js" ></script>
</html>

