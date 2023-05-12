/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


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