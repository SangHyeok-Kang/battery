/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let lectureIndex = 2; // 강의 인덱스 초기값 설정
function addLectureDate() {
    const lectureList = document.getElementById('lecture-list');

    //Create a new lecture element
    const newLecture = document.createElement('div');
    newLecture.id = `lecture${lectureIndex}`;

    // Add the input fields for the new lecture element
    newLecture.innerHTML = `
                            <label>강의 날짜</label>
                            <div class="input-group input-group-outline">
                                <input type="date" id="sdate${lectureIndex}" name="sdate${lectureIndex}" class="form-control" required/> ~
                                <input type="date" id="edate${lectureIndex}" name="edate${lectureIndex}" class="form-control" required/>
                            </div>
                            <label>강의 시간</label>
                            <div class="input-group input-group-outline">
                                <input type="time" id="stime${lectureIndex}" name="stime${lectureIndex}" class="form-control" required/> ~
                                <input type="time" id="etime${lectureIndex}" name="etime${lectureIndex}" class="form-control" required/>
                            </div>
                            <br>
                            `;

    lectureList.appendChild(newLecture);
    // 강의 인덱스 1 증가
    lectureIndex++;
}



function delLectureDate() {
    if (lectureIndex === 2) {
        alert("강의날짜 제거는 할 수 없습니다!");
    } else {
        const childElement = document.querySelector(`#lecture` + (lectureIndex - 1));
        // #child 요소 제거
        childElement.remove();
        lectureIndex--;
    }
}


function optionCheck() {
    var radioValue = document.querySelector('input[name="recruit"]:checked').value;
    var childNodes = document.getElementById("container");
    if (radioValue === "yes") {
        childNodes.innerHTML = `<br>
                                <div class="row">
                                    <label class="text-black">강사 모집</label>
                                    <div class="col-md-3">
                                       <label><input " type="radio" name="recruit_t" value="t_no" checked onchange="optionCheckT()" checked>미사용</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label><input type="radio" name="recruit_t" value="t_yes" onchange="optionCheckT()">사용</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="input-group input-group-outline">
                                            <input id="teacher_num" name="teacher_num" type="number" onKeypress="this.value = this.value.replace(/[^0-9]/g, '');" class="form-control" placeholder="모집할 인원(숫자만)" disabled><br>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <label class="text-black">스태프 모집</label>
                                    <div class="col-md-3">
                                        <label><input type="radio" name="recruit_s" value="s_no" onchange="optionCheckS()" checked >미사용</label>
                                    </div>
                                    <div class="col-md-3">
                                        <label><input type="radio" name="recruit_s" value="s_yes" onchange="optionCheckS()" >사용</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="input-group input-group-outline">
                                            <input id="staffe_num" name="staffe_num" type="text" onKeypress="this.value = this.value.replace(/[^0-9]/g, '');" class="form-control" placeholder="모집할 인원(숫자만)" disabled>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <label class="text-black">조건 사항</label>
                                    <div class="col-md-6">
                                        <textarea name="recruit_text" cols="50" rows="10" wrap="hard" style="resize: none;" class="form-control" placeholder="1. 강사와 스태프 모집 조건을 입력해주세요!\n2. 지원서의 양식이 있다면 첨부해주세요!" ></textarea>
                                    </div>
                                    <div class="input-group input-group-outline">
                                        <input type="file" id="resume" name="resume" />
                                    </div>
                                </div>
                            `;
    } else {
        childNodes.innerHTML = ``;
    }
}

function optionCheckT() {
    var radioValue = document.querySelector('input[name="recruit_t"]:checked').value;
    var childNodes = document.getElementById("teacher_num");
    if (radioValue === "t_no") {
        childNodes.disabled = true;
    } else {
        childNodes.disabled = false;
    }
}

function optionCheckS() {
    var radioValue = document.querySelector('input[name="recruit_s"]:checked').value;
    var childNodes = document.getElementById("staffe_num");
    if (radioValue === "s_no") {
        childNodes.disabled = true;
    } else {
        childNodes.disabled = false;
    }
}

//강의 입력을 위해 배열 값으로 저장되는 항목을 String으로 변환하여 설정
function insertLecture() {
    var dateString = '';
    //강의일정 구분자 시작날짜%종료날짜%시작시간%종료시간@ 순서는 @로 구분 
    for (var i = 1; document.getElementById('sdate' + i); i++) {
        dateString += document.getElementById('sdate' + i).value + "%";
        dateString += document.getElementById('edate' + i).value + "%";
        dateString += document.getElementById('stime' + i).value + "%";
        dateString += document.getElementById('etime' + i).value + "@";
    }
    document.getElementById('datelist').value = dateString.slice(0, -1);
    
    //모집 날짜 설정
    document.getElementById('rec_dt').value = document.getElementById('sRecruitment_date').value
            + "%" + document.getElementById('eRecruitment_date').value
            + "%" + document.getElementById('sRecruitment_time').value
            + "%" + document.getElementById('eRecruitment_time').value;
    
    document.getElementById('keyword').value = document.getElementById('selectedSubcategories').innerText;
}