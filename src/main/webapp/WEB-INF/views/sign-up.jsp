<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">

<head>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
            <a class="navbar-brand" href="${pageContext.request.contextPath}" rel="tooltip" title="WeUs"
                data-placement="bottom">
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
                                                    <input type="text" id="userid" name="userid" class="form-control"
                                                        required>
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
                                                <input type="radio" id="gender-female" name="gender" value="여자"
                                                    required>
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
                                            <div class="col-md-6 pb-2">
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="postcode" name="postcode" placeholder="우편번호"
                                                        class="form-control ">
                                                </div>
                                            </div>
                                            <div class="col-auto pb-2">
                                                <button type="button" class="btn btn-outline-info"
                                                    onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                            </div>
                                            <div class="col-md-7 pb-2">
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="address" name="address" placeholder="주소"
                                                        class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-7 pb-2">
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="detail" name="detail" placeholder="상세주소"
                                                        class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-7">
                                                <div class="input-group input-group-outline">
                                                    <input type="text" id="extra" name="extra" placeholder="참고항목"
                                                        class="form-control">
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
                                    <th scope="row">
                                        <label for="interest" class="text-black">관심사</label>
                                    </th>
                                    <td>
                                        <div class="col-md-6">
                                            <select id="category" class="form-select ps-md-2">
                                                <option value="">대분류 선택</option>
                                                <option value="sports">스포츠</option>
                                                <option value="music">음악</option>
                                                <option value="art">미술</option>
                                            </select>

                                            <div id="subcategoryContainer" style="display: none">
                                                <div id="sportsGroup" class="subcategory-group">
                                                    <label><input type="checkbox" name="subcategory" value="football">
                                                        축구</label>
                                                    <label><input type="checkbox" name="subcategory" value="basketball">
                                                        농구</label>
                                                    <label><input type="checkbox" name="subcategory" value="baseball">
                                                        야구</label>
                                                </div>
                                                <div id="musicGroup" class="subcategory-group">
                                                    <label><input type="checkbox" name="subcategory" value="rock">
                                                        락</label>
                                                    <label><input type="checkbox" name="subcategory" value="pop">
                                                        팝</label>
                                                    <label><input type="checkbox" name="subcategory" value="hiphop">
                                                        힙합</label>
                                                </div>
                                                <div id="artGroup" class="subcategory-group">
                                                    <label><input type="checkbox" name="subcategory" value="painting">
                                                        회화</label>
                                                    <label><input type="checkbox" name="subcategory" value="sculpture">
                                                        조각</label>
                                                    <label><input type="checkbox" name="subcategory"
                                                            value="photography">
                                                        사진</label>
                                                </div>
                                            </div>

                                            <div id="selectedSubcategories"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                            </tbody>
                        </table>
                        <div class="col-auto text-center pt-4">
                            <button type="button" class="btn btn-info ">회원 가입</button>
                        </div>
                    </form>
                </div>
            </div>
    </div>
    </section>


<script>
   var categorySelect = document.getElementById('category');
        var subcategoryContainer = document.getElementById('subcategoryContainer');
        var subcategoryGroups = Array.from(subcategoryContainer.getElementsByClassName('subcategory-group'));
        var selectedSubcategoriesContainer = document.getElementById('selectedSubcategories');
      
        var selectedSubcategories = []; // 선택한 소분류를 저장할 배열
      
        categorySelect.addEventListener('change', function() {
          var selectedCategory = this.value;
      
          // 대분류 선택 여부에 따라 소분류 그룹 표시/숨김
          subcategoryContainer.style.display = selectedCategory ? 'block' : 'none';
      
          // 선택한 대분류에 해당하는 소분류 그룹을 보여줌
          subcategoryGroups.forEach(function(group) {
            group.style.display = (group.id === selectedCategory + 'Group') ? 'block' : 'none';
          });
      
          // 선택된 소분류 유지
          showSelectedSubcategories();
        });
      
        subcategoryContainer.addEventListener('change', function() {
          var checkedCheckboxes = Array.from(this.querySelectorAll('input[type="checkbox"]:checked'));
          var checkedSubcategories = checkedCheckboxes.map(function(checkbox) {
            return checkbox.value;
          });
      
          // 최대 3개의 소분류만 선택 가능
          if (checkedSubcategories.length > 3) {
            // 초과된 항목의 체크 해제
            checkedCheckboxes[3].checked = false;
      
            // 부트스트랩의 알림 메시지 표시
            alert('최대 3개의 소분류만 선택할 수 있습니다.');
          }
      
          // 선택한 항목들을 배열에 저장
          selectedSubcategories = checkedSubcategories.slice(0, 3);
      
          // 선택된 소분류들을 동적으로 출력
          showSelectedSubcategories();
        });
      
        function showSelectedSubcategories() {
          selectedSubcategoriesContainer.innerHTML = '';
      
          if (selectedSubcategories.length > 0) {
            selectedSubcategories.forEach(function(subcategory, index) {
              var subcategoryText = document.createElement('span');
              subcategoryText.textContent = subcategory;
              subcategoryText.style.color = '#1A73E8'; // 파란색으로 설정
      
              if (index !== selectedSubcategories.length - 1) {
                subcategoryText.textContent += ', '; // 마지막 항목이 아니면 , 추가
              }
      
              selectedSubcategoriesContainer.appendChild(subcategoryText);
            });
          }
        }
      
        // 페이지 로드 시 초기 설정
        subcategoryContainer.style.display = 'none'; // 소분류 컨테이너 숨김
        showSelectedSubcategories(); // 선택한 소분류 출력

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