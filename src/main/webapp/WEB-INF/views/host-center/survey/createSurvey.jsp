<%-- 
    Document   : createSurvey
    Created on : 2023. 4. 26., 오전 12:26:39
    Author     : parkchaebin
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <title>설문지 만들기</title>
        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/lecture.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/servey.js" ></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
                <c:if test="${!empty msg}">
                    alert("${msg}");
        </c:if>
    </script>
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <%@include file="../host-center-sidebar.jspf"%>
        <!-- End of Sidebar -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <%@include file="../host-center-topbar.jspf"%>
                <!-- End of Topbar -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">설문 생성하기</h1>
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <form action="createSurvey.do" method='POST'>
                                <table class="table" id="dataTable" width="100%" cellspacing="0">
                                    <colgroup>
                                        <col style="width: 20%;">
                                        <col style="width: 80%;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row">
                                                <label class="text-black">설문 명</label>
                                                <span class="text-warning">*</span>
                                            </th>
                                            <td>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="input-group input-group-outline">
                                                            <input class="form-control" type="text" name="surveyName" placeholder="설문지 이름을 입력해주세요" required/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <label class="text-black">설문 항목</label>
                                            </th>
                                            <td>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="addInput">
                                                            <div class="question">
                                                                <label>질문</label>
                                                                <span class="text-warning">*</span>
                                                                <div class="input-group input-group-outline">
                                                                    <input class="form-control" type="text" name="test" value="" placeholder="원하시는 질문을 입력해주세요" required>
                                                                </div>
                                                                <div class="input-group input-group-outline pt-1">
                                                                    <label class="input-group-text" for="test1">1번<span class="text-warning">*</span></label>
                                                                    <input class="form-control" type="text" id="test1" name="test1" value="" placeholder="1번 항목을 입력해주세요" required>
                                                                </div>
                                                                <div class="input-group input-group-outline pt-1">
                                                                    <label class="input-group-text" for="test1">2번<span class="text-warning">*</span></label>
                                                                    <input class="form-control" type="text" id="test2" name="test2" value="" placeholder="2번 항목을 입력해주세요" required>
                                                                </div>
                                                                <div class="input-group input-group-outline pt-1">
                                                                    <label class="input-group-text" for="test1">3번<span class="text-warning">*</span></label>
                                                                    <input class="form-control" type="text" id="test3" name="test3" value="" placeholder="3번 항목을 입력해주세요" required>
                                                                </div>
                                                                <div class="input-group input-group-outline pt-1">
                                                                    <label class="input-group-text" for="test1">4번<span class="text-warning">*</span></label>
                                                                    <input class="form-control" type="text" id="test4" name="test4" value="" placeholder="4번 항목을 입력해주세요" required>
                                                                </div>
                                                                <div class="input-group input-group-outline pt-1">
                                                                    <label class="input-group-text" for="test1">5번<span class="text-warning">*</span></label>
                                                                    <input class="form-control" type="text" id="test5" name="test5" value="" placeholder="5번 항목을 입력해주세요" required>
                                                                </div>
                                                                <button type="button" class="btn btn-outline-info mt-1" onclick="delQuestion(this)"> 문항 삭제 </button>
                                                                <hr class="sidebar-divider">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <label class="text-black">유형 추가하기</label>
                                            </th>
                                            <td>
                                                <div class="input-group input-group-outline">
                                                    <label class="radio-label">
                                                        <input type="radio" name="questionType" value="objective" checked>
                                                        객관식
                                                    </label>&nbsp;&nbsp;
                                                    <label class="radio-label">
                                                        <input type="radio" name="questionType" value="subjective">
                                                        주관식
                                                    </label>
                                                </div>
                                                <div class="mt-2">
                                                    <button type="button" class="btn btn-outline-info" onclick="addQuestion()">설문 문항 추가</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <%
                                    request.setCharacterEncoding("UTF-8");
                                    String[] test = request.getParameterValues("test");
                                    String[] test1 = request.getParameterValues("test1");
                                    String[] test2 = request.getParameterValues("test2");
                                    //  if (test == null || test.equals("")) {
                                %>
                                <input type="submit" value="저장" > 
                            </form> 
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Footer -->
    <%@include file="../host-center-footer.jspf"%>
    <!-- End of Footer -->

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/info.js" ></script>
    <script type="text/javascript">
                    // 설문 문항 추가
                    function addQuestion() {
                        // 문항 추가 시 선택된 라디오 버튼 값 가져옴
                        var questionType = $('input[name=questionType]:checked').val();
                        if (questionType === 'objective') {
                            // 객관식 문항 추가
                            $('.addInput').append(
                                    `<div class="question">
                                        <label>질문</label>
                                        <span class="text-warning">*</span>
                                        <div class="input-group input-group-outline">
                                            <input class="form-control" type="text" name="test" value="" placeholder="원하시는 질문을 입력해주세요" required>
                                        </div>
                                        <div class="input-group input-group-outline pt-1">
                                            <label class="input-group-text" for="test1">1번<span class="text-warning">*</span></label>
                                            <input class="form-control" type="text" id="test1" name="test1" value="" placeholder="1번 항목을 입력해주세요" required>
                                        </div>
                                        <div class="input-group input-group-outline pt-1">
                                            <label class="input-group-text" for="test1">2번<span class="text-warning">*</span></label>
                                            <input class="form-control" type="text" id="test2" name="test2" value="" placeholder="2번 항목을 입력해주세요" required>
                                        </div>
                                        <div class="input-group input-group-outline pt-1">
                                            <label class="input-group-text" for="test1">3번<span class="text-warning">*</span></label>
                                            <input class="form-control" type="text" id="test3" name="test3" value="" placeholder="3번 항목을 입력해주세요" required>
                                        </div>
                                        <div class="input-group input-group-outline pt-1">
                                            <label class="input-group-text" for="test1">4번<span class="text-warning">*</span></label>
                                            <input class="form-control" type="text" id="test4" name="test4" value="" placeholder="4번 항목을 입력해주세요" required>
                                        </div>
                                        <div class="input-group input-group-outline pt-1">
                                            <label class="input-group-text" for="test1">5번<span class="text-warning">*</span></label>
                                            <input class="form-control" type="text" id="test5" name="test5" value="" placeholder="5번 항목을 입력해주세요" required>
                                        </div>
                                        <button type="button" class="btn btn-outline-info mt-1" onclick="delQuestion(this)"> 설문 문항 삭제 </button>
                                        <hr class="sidebar-divider">
                                    </div>`
                                    );
                        } else {
                            // 주관식 문항 추가
                            // 주관식 문항의 경우 test1,test2값 "N/A"로 설정
                            $('.addInput').append(
                                    `<div class="question">
                                        <label>질문</label>
                                        <span class="text-warning">*</span>
                                        <div class="input-group input-group-outline">
                                            <input class="form-control" type="text" name="test" value="" placeholder="원하시는 질문을 입력해주세요" required>
                                        </div>
                                        <input type="hidden" name="test1" value="N/A">
                                        <input type="hidden" name="test2" value="N/A">
                                        <input type="hidden" name="test3" value="N/A">
                                        <input type="hidden" name="test4" value="N/A">
                                        <input type="hidden" name="test5" value="N/A">
                                        <button type="button" class="btn btn-outline-info mt-1" onclick="delQuestion(this)"> 설문 문항 삭제</button>
                                        <hr class="sidebar-divider">
                                    </div>`
                                    );
                        }

                        

                    }
                    // 설문 문항 삭제
                    function delQuestion(btn) {
                        btn.closest('.question').remove();
                    }
    </script>
</body>
</html>
