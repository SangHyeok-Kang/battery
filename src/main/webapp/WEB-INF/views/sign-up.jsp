<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            회원가입
        </title>

        <!--font ??????-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap" rel="stylesheet">
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <!--css file-->
        <link id="pagestyle" href="${pageContext.request.contextPath}/assets/css/material-kit.css" rel="stylesheet" />
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    </head>

    <body class="about-us bg-gray-100">
        <!-- Navbar-->
        <nav class="navbar navbar-light py-3">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}" rel="tooltip" title="WeUs" data-placement="bottom">
                    <h4>보조배터리</h4>
                </a>
            </div>
            <div class="w-100 d-none d-md-block"></div>
            <div class="container">
                카테고리 뭐 들어가야 했더랑 까묵쓰
            </div>
        </nav>
        <!--end navbar-->
        <!--start 본문-->
        <!--현재 모바일 버전으로 하면 중앙 정렬 안됨... 수정 필요-->
        <div class="card card-body shadow-xl mx-2 mx-md-6 mt-8">
            <section class="py-7">
                <div class="container">
                    <div class="row align-items-center justify-content-start">
                        <p class="font-weight-bold text-2xl text-gradient-dark">회원가입</p>
                        <form id="contact-form" method="post" autocomplete="off">
                            <table class="table">
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: 80%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <label for="id" class="text-black">아이디</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="userid" name="userid" class="form-control" required>
                                                    </div>
                                                    <small>아이디 관련 설명 여기에 적어야 함</small>
                                                </div>
                                                <div class="col-auto">
                                                    <button type="button" class="btn btn-outline-info">중복 확인</button>
                                                    <!--중복 확인 관련 나중에 할거임-->
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="password" class="text-black">비밀번호</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="password" id="password" name="password"
                                                               class="form-control" required>
                                                    </div>
                                                    <small>비밀번호 규칙 여기에 적어야 함</small>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="name" class="text-black">이름</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="name" name="name" class="form-control"
                                                               required>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="name" class="text-black">성별</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <input type="radio" id="gender-male" name="gender" value="남자" required>
                                                    <label for="gender-male">남성</label>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="radio" id="gender-female" name="gender" value="여자" required>
                                                    <label for="gender-female">여성</label>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="birthdate" class="text-black">생년월일</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="date" id="birthdate" name="birthdate"
                                                               class="form-control" required>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="phone" class="text-black">전화번호</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-4 col-md-2">
                                                    <!--전화번호 앞 3자리-->
                                                    <select id="phone1" name="phone1" class="form-select ps-md-2" required>
                                                        <option value="">식별번호</option>
                                                        <option value="010">010</option>
                                                        <option value="011">011</option>
                                                        <!-- 옵션 추가 더 할거 있나?-->
                                                    </select>
                                                </div>
                                                <div class="col-4 col-md-2">
                                                    <!--전화번호 중간 4자리-->
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="phone2" name="phone2" class="form-control"
                                                               required>
                                                    </div>
                                                </div>
                                                <div class="col-4 col-md-2">
                                                    <!--전화번호 끝 4자리-->
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="phone3" name="phone3" class="form-control"
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
                                                <div class="col-md-6 ">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="postcode" name="postcode" placeholder="우편번호" class="form-control ">
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <button type="button" class="btn btn-outline-info" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="address" name="address" placeholder="주소" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="detail" name="detail" placeholder="상세주소" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="extra" name="extra" placeholder="참고항목" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="schooltype">학력</label>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <select id="schooltype" name="schooltype" onchange="showSchoolInfo()">
                                                        <option value="">--학교 유형--</option>
                                                        <option value="elementary">초등학교</option>
                                                        <option value="middle">중학교</option>
                                                        <option value="high">고등학교</option>
                                                        <option value="university">대학교</option>
                                                    </select>
                                                </div>
                                                <div id="schoolinfo"></div>
                                            </div>
                                        </td>

                                    </tr>
                                    <tr>
                                        관심사
                                    </tr>
                                <td>
                                    <label for="category">관심사:</label>
                                    <select id="category" name="category" class="form-control">
                                        <option value="">대분류 선택</option>
                                        <option value="sports">스포츠</option>
                                        <option value="music">음악</option>
                                        <option value="art">미술</option>
                                    </select>

                                    <label for="subcategory">세부 관심사:</label>
                                    <select id="subcategory" name="subcategory" class="form-control" multiple disabled>
                                        <option value="">소분류 선택</option>
                                    </select>

                                    <div id="badgeContainer"></div>

                                </td>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
        </div>
    </section>


    <script>
        document.getElementById('category').addEventListener('change', function () {
            var category = this.value;
            var subcategorySelect = document.getElementById('subcategory');
            var badgeContainer = document.getElementById('badgeContainer');

            // 기존의 소분류 항목들을 모두 제거
            subcategorySelect.innerHTML = '';

            // 선택된 대분류에 따라 소분류 항목들을 동적으로 추가
            if (category === 'sports') {
                subcategorySelect.innerHTML += '<option value="football">축구</option>';
                subcategorySelect.innerHTML += '<option value="basketball">농구</option>';
            } else if (category === 'music') {
                subcategorySelect.innerHTML += '<option value="rock">락</option>';
                subcategorySelect.innerHTML += '<option value="pop">팝</option>';
            } else if (category === 'art') {
                subcategorySelect.innerHTML += '<option value="painting">회화</option>';
                subcategorySelect.innerHTML += '<option value="sculpture">조각</option>';
            }

            // 다중 선택을 가능하게 설정하고 드롭다운 메뉴를 활성화
            subcategorySelect.multiple = true;
            subcategorySelect.disabled = false;

            // 배지 컨테이너 초기화
            badgeContainer.innerHTML = '';
        });

        document.getElementById('subcategory').addEventListener('change', function () {
            var selectedSubcategories = Array.from(this.selectedOptions).map(option => option.value);
            var badgeContainer = document.getElementById('badgeContainer');

            // 배지 컨테이너 초기화
            badgeContainer.innerHTML = '';

            // 선택된 소분류에 따라 배지 추가
            selectedSubcategories.forEach(function (subcategory) {
                var badge = document.createElement('span');
                badge.className = 'badge bg-primary me-2';
                badge.textContent = subcategory;
                badgeContainer.appendChild(badge);
            });
        });

        //주소 입력 스크립트
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extra").value = extraAddr;

                    } else {
                        document.getElementById("extra").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detail").focus();
                }
            }).open();
        }

        //학력입력 스크립트
        function showSchoolInfo() {
            var schooltype = document.getElementById("schooltype").value;
            var schoolinfo = document.getElementById("schoolinfo");
            if (schooltype === "university") {
                schoolinfo.innerHTML = `
                        <div class="input-group input-group-outline">
                            <input type="text" id="school" name="school" required placeholder="학교">
                        </div>
                        <div class="input-group input-group-outline">
                            <input type="text" id="major" name="major" required placeholder="학과">
                        </div>
                        <div class="input-group input-group-outline">
                            <input type="text" id="grade" name="grade" required placeholder="학년">
                        </div>
                        <div class="input-group input-group-outline">
                            <input type="text" id="status" name="status" required placeholder="상태">
                        </div>
                    `;
            } else if (schooltype === "elementary" || schooltype === "middle" || schooltype === "high") {
                schoolinfo.innerHTML = `
                        <div class="input-group input-group-outline">
                            <input type="text" id="school" name="school" required placeholder="학교">
                        </div>
                        <div class="input-group input-group-outline">
                            <input type="text" id="grade" name="grade" required placeholder="학년">
                        </div>
                        <input type="hidden" id="status" name="status" value ="">
                        <input type="hidden" id="major" name="major" value="" >
                    `;
            } else {
                schoolinfo.innerHTML = "";
            }
        }
    </script>

</body>

<script src="./assets/material-kit.min.js?v=3.0.4" type="text/javascript"></script> <!--이거 있어야 입력 폼 애니메이션 들어감-->

</html>