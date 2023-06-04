<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : createSurvey
    Created on : 2023. 4. 26., 오전 12:26:39
    Author     : parkchaebin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>설문 생성</title>
    </head>
    <body>

        <script src="http://code.jquery.com/jquery-latest.min.js"></script>

        <form action="createSurvey.do" method='POST'>
           
            설문 이름 : <input type="text" name="surveyName" required>
            
            <div class="addInput">
                <p>설문 유형:
                    <label><input type="radio" name="questionType" value="objective" checked>객관식</label>
                    <label><input type="radio" name="questionType" value="subjective">주관식</label>
                </p>
                <div class="question">
                    <p> 문제 : <input type="text" name="test" value="" required></p>
                    <p> 1번 : <input type="text" name="test1" value="" required> 
                        2번 : <input type="text" name="test2" value="" required>
                        3번 : <input type="text" name="test3" value="" required>
                        4번 : <input type="text" name="test4" value="" required>
                        5번 : <input type="text" name="test5" value="" required></p>
                    <button type="button" class="btnRemove"> 설문 문항 삭제 </button> <br><br>
                </div>
            </div>
            <button type="button" class="btnAdd">설문 문항 추가</button>

            <%
                request.setCharacterEncoding("UTF-8");  
                String[] test = request.getParameterValues("test");
                String[] test1 = request.getParameterValues("test1");
                String[] test2 = request.getParameterValues("test2");
              //  if (test == null || test.equals("")) {
            %>

            <input type="submit" value="저장" > 

        </form> 

            

              
        <script type="text/javascript">
            $(document).ready(function () {
                // 설문 문항 추가
                $('.btnAdd').click(function () {
                    // 문항 추가 시 선택된 라디오 버튼 값 가져옴
                    var questionType = $('input[name=questionType]:checked').val();
                    if (questionType === 'objective') {
                        // 객관식 문항 추가
                        $('.addInput').append(
                                '<div class="question">' +
                                '<p> 문제 : <input type="text" name="test" value="" required></p>' +
                                '<p> 1번 : <input type="text" name="test1" value="" required> \n\
                                     2번 : <input type="text" name="test2" value="" required> \n\
                                     3번 : <input type="text" name="test3" value="" required> \n\
                                     4번 : <input type="text" name="test4" value="" required> \n\
                                     5번 : <input type="text" name="test5" value="" required></p>' +
                                '<button type="button" class="btnRemove"> 설문 문항 삭제 </button>' +
                                '</div><br>'
                                );
                    } else {
                        // 주관식 문항 추가
                        // 주관식 문항의 경우 test1,test2값 "N/A"로 설정
                        $('.addInput').append(
                                '<div class="question">' +
                                '<p>문제 : <input type="text" name="test" value="" required></p>' +
                                '<input type="hidden" name="test1" value="N/A">  \n\
                                 <input type="hidden" name="test2" value="N/A">  \n\
                                 <input type="hidden" name="test3" value="N/A">  \n\
                                 <input type="hidden" name="test4" value="N/A">  \n\
                                 <input type="hidden" name="test5" value="N/A"></p>' +
                                '<button type="button" class="btnRemove"> 설문 문항 삭제 </button>' +
                                '</div><br>'
                                );
                    }

                    // 설문 문항 삭제
                    $('.btnRemove').on('click', function () {
                        $(this).parent('.question').remove();
                    });
                });
            });
        </script>


    </body>
</html>

