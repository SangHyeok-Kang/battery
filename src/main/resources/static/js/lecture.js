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
                                <input type="date" name="sdate${lectureIndex}" class="form-control"/> ~
                                <input type="date" name="edate${lectureIndex}" class="form-control"/>
                            </div>
                            <label>강의 시간</label>
                            <div class="input-group input-group-outline">
                                <input type="time" name="stime${lectureIndex}" class="form-control"/> ~
                                <input type="time" name="etime${lectureIndex}" class="form-control"/>
                            </div>
                            <br>
                            `;

    // Add the new lecture element to the lecture list
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
        childNodes.innerHTML=`<br>
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
                                            <input id="teacher_num" name="teacher_num" type="text" onKeyup="this.value = this.value.replace(/[^-0-9]/g, '');" class="form-control" placeholder="모집할 인원(숫자만)" disabled><br>
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
                                            <input id="staff_num" name="staff_num" type="text" onKeyup="this.value = this.value.replace(/[^-0-9]/g, '');" class="form-control" placeholder="모집할 인원(숫자만)" disabled>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <label class="text-black">조건 사항</label>
                                    <div class="col-md-6">
                                        <div class="input-group input-group-outline">
                                            <textarea name="recruit_text" cols="50" rows="10" wrap="hard" style="resize: none;" class="form-control" placeholder="강사와 스태프 모집 조건을 입력해주세요!" ></textarea>
                                        </div>
                                    </div>
                                </div>
                            `;
    } else {
        childNodes.innerHTML=``;
    }
}

function optionCheckT(){
     var radioValue = document.querySelector('input[name="recruit_t"]:checked').value;
     var childNodes = document.getElementById("teacher_num");
     if(radioValue==="t_no"){
         childNodes.disabled=true;
     }else{
         childNodes.disabled=false;
     }
}

function optionCheckS(){
    var radioValue = document.querySelector('input[name="recruit_s"]:checked').value;
     var childNodes = document.getElementById("staff_num");
     if(radioValue==="s_no"){
         childNodes.disabled=true;
     }else{
         childNodes.disabled=false;
     }
}