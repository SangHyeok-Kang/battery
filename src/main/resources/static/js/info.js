/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


//학교 정보 입력 스크립트
function showSchoolInfo() {
    var schooltype = document.getElementById("schooltype").value;
    var schoolinfo = document.getElementById("schoolinfo");
    if (schooltype == "university") {
        schoolinfo.innerHTML = `
                        <label for="school">학교:</label>
                        <input type="text" id="school" name="school" required style="width:auto"><br><br>
                        <label for="major">학과:</label>
                        <input type="text" id="major" name="major" required style="width:auto"><br><br>
                        <label for="grade">학년:</label>
                        <input type="text" id="grade" name="grade" required style="width:auto"><br><br>
                        <label for="status">상태:</label>
                        <input type="text" id="status" name="status" required style="width:auto"><br><br>
                    `;
    } else if (schooltype == "elementary" || schooltype == "middle" || schooltype == "high") {
        schoolinfo.innerHTML = `
                        <label for="school">학교:</label>
                        <input type="text" id="school" name="school" required style="width:auto"><br><br>
                        <label for="grade">학년:</label>
                        <input type="text" id="grade" name="grade" required style="width:auto"><br><br>
                        <input type="hidden" id="status" name="status" value ="">
                        <input type="hidden" id="major" name="major" value="" >
                    `;
    } else {
        schoolinfo.innerHTML = "";
    }
}

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

//키워드 시작
var categorySelect = document.getElementById('category');
var subcategoryContainer = document.getElementById('subcategoryContainer');
var subcategoryGroups = Array.from(subcategoryContainer.getElementsByClassName('subcategory-group'));
var selectedSubcategoriesContainer = document.getElementById('selectedSubcategories');
var selectedSubcategories = new Array(); // 선택한 소분류를 저장할 배열
var itArr = [["Web", "모바일", "IoT", "네트워크", "프로그래밍 언어"], ["web", "mobile", "iot", "network", "proraming"]];
var selfImproArr = [["취업", "힐링", "운동", "취미"], ["employ", "healing", "sport", "hobby"]];
var musicArr = [["K-pop", "클래식", "국악", "힙합"], ["kpop", "classic", "gukak", "hiphop"]];
var economyArr = [["주식", "펀드", "회계"], ["stock", "fund", "accounting"]];
var artArr = [["서양화", "동양화", "서예", "조소"], ["wpaint", "epaint", "calligraphy", "sculpture"]];
var enginArr = [["건축", "기계", "생명"], ["architecture", "engineering", "life"]];
var mediaArr = [["신문", "영상", "사진"], ["newspaper", "video", "photo"]];
var languageArr = [["영어", "일본어", "중국어", "아랍어"], ["eng", "japan", "china", "arab"]];

categorySelect.addEventListener('change', function () {
    var arr;
    var checkOnOff = "";
    var selectedCategory = this.value + "Gruop";
    var keyword = "";
    if (this.value === "") {
        subcategoryContainer.style.display = 'none';
    } else {
        if (this.value === "it") {
            arr = itArr;
        } else if (this.value === "selfImpro") {
            arr = selfImproArr;
        } else if (this.value === "music") {
            arr = musicArr;
        } else if (this.value === "economy") {
            arr = economyArr;
        } else if (this.value === "art") {
            arr = artArr;
        } else if (this.value === "engin") {
            arr = enginArr;
        } else if (this.value === "media") {
            arr = mediaArr;
        } else if (this.value === "language") {
            arr = languageArr;
        }
        subcategoryContainer.style.display = 'block';
        for (i = 0; i < arr[0].length; i++) {
            if (selectedSubcategories.includes(`${arr[1][i]}`)) {
                checkOnOff = "checked";
            } else {
                checkOnOff = "";
            }
            keyword += `<label><input type="checkbox" name="subcategory" value="${arr[1][i]}" ${checkOnOff}>${arr[0][i]}</label>`;
        }
        subcategoryContainer.innerHTML = `<div id="${selectedCategory}" class="subcategory-group">${keyword}</div>`;
    }
});

subcategoryContainer.addEventListener('change', function (check) {

    if (check.target.checked === true) {//체크 시 목록 추가
        // 최대 3개의 소분류만 선택 가능
        if (selectedSubcategories.length === 3) {
            // 초과된 항목의 체크 해제
            check.target.checked = false;
            // 부트스트랩의 알림 메시지 표시
            alert('최대 3개의 소분류만 선택할 수 있습니다.');
        } else {
            // 선택한 항목들을 배열에 저장
            selectedSubcategories.push(check.target.value);
        }
    } else {//체크 해제시 목록에서 제거
        selectedSubcategories.splice(selectedSubcategories.indexOf(check.target.value), 1);

    }
    // 선택된 소분류들을 동적으로 출력
    showSelectedSubcategories();
});

function showSelectedSubcategories() {
    selectedSubcategoriesContainer.innerHTML = '';
    if (selectedSubcategories.length > 0) {
        selectedSubcategories.forEach(function (subcategory, index) {
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
//키워드 끝