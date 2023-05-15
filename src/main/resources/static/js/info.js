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

//키워드 시작
var categorySelect = document.getElementById('category');
var subcategoryContainer = document.getElementById('subcategoryContainer');
var subcategoryGroups = Array.from(subcategoryContainer.getElementsByClassName('subcategory-group'));
var selectedSubcategoriesContainer = document.getElementById('selectedSubcategories');

var selectedSubcategories = []; // 선택한 소분류를 저장할 배열

categorySelect.addEventListener('change', function () {
    var selectedCategory = this.value;

    // 대분류 선택 여부에 따라 소분류 그룹 표시/숨김
    subcategoryContainer.style.display = selectedCategory ? 'block' : 'none';

    // 선택한 대분류에 해당하는 소분류 그룹을 보여줌
    subcategoryGroups.forEach(function (group) {
        group.style.display = (group.id === selectedCategory + 'Group') ? 'block' : 'none';
    });

    // 선택된 소분류 유지
    showSelectedSubcategories();
});

subcategoryContainer.addEventListener('change', function () {
    var checkedCheckboxes = Array.from(this.querySelectorAll('input[type="checkbox"]:checked'));
    var checkedSubcategories = checkedCheckboxes.map(function (checkbox) {
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