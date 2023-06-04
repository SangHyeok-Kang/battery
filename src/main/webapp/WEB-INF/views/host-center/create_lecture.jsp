<!DOCTYPE html>
<html lang="en">

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/ssac.png">
        <link rel="icon" type="image/png" href="../assets/img/ssac.png">
        <title>호스트 센터</title>

        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../assets/css/sb-admin-2.css" rel="stylesheet">
        <link href="../assets/css/sb-admin-2.min.css" rel="stylesheet">
        <script type="text/javascript" src="../js/lecture.js" ></script>
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="host-center-sidebar.jspf"%>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="host-center-topbar.jspf"%>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">강의 등록하기</h1>
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <form enctype="multipart/form-data" id="contact-form" method="post" action="insert_lecture.do" autocomplete="off"  onsubmit="insertLecture()">
                                        <table class="table" id="dataTable" width="100%" cellspacing="0">
                                            <colgroup>
                                                <col style="width: 20%;">
                                                <col style="width: 80%;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="thumbnail" class="text-black">썸네일 등록</label>
                                                    </th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <input type="file" id="thumbnail" name="thumbnail" accept=".jpg,.png,.jpeg"/>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="title" class="text-black">강의명</label>
                                                        <span class="text-warning">*</span>
                                                    </th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="input-group input-group-outline">
                                                                    <input type="text" id="title" name="title" maxlength="256" class="form-control" placeholder="강의명을 입력해주세요" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="text" class="text-black">강의 내용</label>
                                                    </th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="input-group input-group-outline">
                                                                    <textarea id="text" name="text" cols="50" rows="10" placeholder="강의 내용을 입력하세요" wrap="hard" class="form-control" style="resize: none;"></textarea>

                                                                </div>
                                                                <input type="file" id="text_image" name="text_image" accept=".jpg,.png,.jpeg"/>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="text" class="text-black">교육장소</label>
                                                        <span class="text-warning">*</span>
                                                    </th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-6 ">
                                                                <div class="input-group input-group-outline">
                                                                    <input type="text" id="postcode" name="postcode" placeholder="우편번호" class="form-control " required>
                                                                </div>
                                                            </div>
                                                            <div class="col-auto">
                                                                <button type="button" class="btn btn-outline-info" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="input-group input-group-outline">
                                                                    <input type="text" id="address" name="address" placeholder="주소" class="form-control" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="input-group input-group-outline">
                                                                    <input type="text" id="detail" name="detail" placeholder="상세주소" class="form-control" required>
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
                                                        <label for="text" class="text-black">모집 형태</label>
                                                        <span class="text-warning">*</span>
                                                    </th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-8 ">
                                                                <label class="text-black">모집 기간</label>
                                                                <div class="input-group input-group-outline">
                                                                    <input type="date" id="sRecruitment_date" name="sRecruitment_date" class="form-control" required/>&nbsp;
                                                                    <input type="time" id="eRecruitment_date" name="sRecruitment_time" class="form-control" required/>&nbsp;~&nbsp; 
                                                                    <input type="date" id="sRecruitment_time" name="eRecruitment_date" class="form-control" required/>&nbsp;
                                                                    <input type="time" id="eRecruitment_time" name="eRecruitment_time" class="form-control" required/><br>
                                                                </div>
                                                                <br><label class="text-black">모집 대상</label>
                                                                <div class="input-group input-group-outline">
                                                                    <input type="text" name="recruitment" class="form-control"/>
                                                                </div>
                                                                <br><label class="text-black">모집 인원</label>
                                                                <div class="input-group input-group-outline">
                                                                    <input name="people" type="number" onKeypress="this.value = this.value.replace(/[^0-9]/g, '');"  class="form-control" placeholder="숫자만 입력해주세요" required><br>
                                                                </div>
                                                                <input type="hidden" id="rec_dt" name="rec_dt">
                                                            </div>

                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="text" class="text-black">강의 일정</label>
                                                        <span class="text-warning">*</span>
                                                    </th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-8 ">
                                                                <div id="lecture-list">
                                                                    <div id="lecture1">
                                                                        <label>강의 날짜</label>
                                                                        <div class="input-group input-group-outline">
                                                                            <input type="date" id="sdate1" name="sdate1" class="form-control" required/>&nbsp;~&nbsp;
                                                                            <input type="date"  id="edate1" name="edate1" class="form-control" required/>
                                                                        </div>
                                                                        <label>강의 시간</label>
                                                                        <div class="input-group input-group-outline">
                                                                            <input type="time" id="stime1" name="stime1" class="form-control" required/>&nbsp;~&nbsp;
                                                                            <input type="time" id="etime1" name="etime1" class="form-control" />
                                                                        </div>
                                                                        <br>
                                                                    </div>
                                                                    <%--자바 스크립트를 이용해서 강의 일정을 추가--%>
                                                                </div>
                                                                <input type="hidden" id="datelist" name="datelist">
                                                                <div class="col-auto">
                                                                    <button type="button" class="btn btn-outline-info" onclick="addLectureDate()">일정 추가하기</button>
                                                                    <button type="button" class="btn btn-outline-info" onclick="delLectureDate()">일정 삭제하기</button>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="text" class="text-black">KeyWord</label>
                                                        <span class="text-warning">*</span>
                                                    </th>
                                                    <td>
                                                        <div class="col-md-6">
                                                            <select id="category" class="form-select ps-md-2">
                                                                <option value="">대분류 선택</option>
                                                                <option value="it">IT</option>
                                                                <option value="selfImpro">자기계발</option>
                                                                <option value="music">음악</option>
                                                                <option value="economy">경제</option>
                                                                <option value="art">미술</option>
                                                                <option value="engin">공학</option>
                                                                <option value="media">미디어</option>
                                                                <option value="language">언어</option>
                                                            </select>

                                                            <div id="subcategoryContainer" style="display: none">

                                                            </div>

                                                            <div id="selectedSubcategories"></div>
                                                            <input type="hidden" id="keyword" name="keyword">
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="text" class="text-black">가격</label>
                                                    </th>
                                                    <td>
                                                        <div class="input-group input-group-outline">
                                                            <input id="price" name="price" type="number"  class="form-control" onKeypress="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="숫자만 입력해주세요" min="0" ><br>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="text" class="text-black">신청 수락</label>
                                                        <span class="text-warning">*</span>
                                                    </th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <label><input type="radio" id="auto" name="acceptance" value="auto" checked>&nbsp;자동</label>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label><input type="radio" id="manual" name="acceptance" value="manual" >&nbsp;수동</label>
                                                            </div>


                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">
                                                        <label for="text" class="text-black">스태프 모집</label>
                                                        <span class="text-warning">*</span>
                                                    </th>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col-md-3">
                                                                <label><input type="radio" name="recruit" value="no" checked onchange="optionCheck()">&nbsp;미사용</label>
                                                            </div>
                                                            <div class="col-md-3">
                                                                <label><input type="radio" name="recruit" value="yes" onchange="optionCheck()">&nbsp;사용</label>
                                                            </div>
                                                        </div>
                                                        <div id="container">
                                                            <%-- 스태프 모집 사용 시 추가  --%>

                                                        </div>
                                                        <div class="input-group input-group-outline" id="staffefile" style="display:none">
                                                            <input type="file" id="resume" name="resume" />
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <button type="submit"  class="btn btn-outline-info" >강의 등록 하기</button>     
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--
                        <div class="card card-body shadow-xl mx-2 mx-md-6 mt-8">
                            <section class="py-7">
                                <div class="container ">
                                    <div class="row align-items-center justify-content-start">
                                        <form enctype="multipart/form-data" id="contact-form" method="post" action="insert_lecture.do" autocomplete="off"  onsubmit="insertLecture()">
                                            <table class="table">
                                                <colgroup>
                                                    <col style="width: 20%;">
                                                    <col style="width: 80%;">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="thumbnail" class="text-black">썸네일 등록</label>
                                                        </th>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <input type="file" id="thumbnail" name="thumbnail" accept=".jpg,.png,.jpeg"/>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="title" class="text-black">강의명</label>
                                                            <span class="text-warning">*</span>
                                                        </th>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="input-group input-group-outline">
                                                                        <input type="text" id="title" name="title" maxlength="256" class="form-control" placeholder="강의명을 입력해주세요" required>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="text" class="text-black">강의 내용</label>
                                                        </th>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="input-group input-group-outline">
                                                                        <textarea id="text" name="text" cols="50" rows="10" placeholder="강의 내용을 입력하세요" wrap="hard" class="form-control" style="resize: none;"></textarea>

                                                                    </div>
                                                                    <input type="file" id="text_image" name="text_image" accept=".jpg,.png,.jpeg"/>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="text" class="text-black">교육장소</label>
                                                            <span class="text-warning">*</span>
                                                        </th>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-6 ">
                                                                    <div class="input-group input-group-outline">
                                                                        <input type="text" id="postcode" name="postcode" placeholder="우편번호" class="form-control " required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-auto">
                                                                    <button type="button" class="btn btn-outline-info" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="input-group input-group-outline">
                                                                        <input type="text" id="address" name="address" placeholder="주소" class="form-control" required>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="input-group input-group-outline">
                                                                        <input type="text" id="detail" name="detail" placeholder="상세주소" class="form-control" required>
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
                                                            <label for="text" class="text-black">모집 형태</label>
                                                            <span class="text-warning">*</span>
                                                        </th>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-8 ">
                                                                    <label class="text-black">모집 기간</label>
                                                                    <div class="input-group input-group-outline">
                                                                        <input type="date" id="sRecruitment_date" name="sRecruitment_date" class="form-control" required/>&nbsp;
                                                                        <input type="time" id="eRecruitment_date" name="sRecruitment_time" class="form-control" required/>&nbsp;~&nbsp; 
                                                                        <input type="date" id="sRecruitment_time" name="eRecruitment_date" class="form-control" required/>&nbsp;
                                                                        <input type="time" id="eRecruitment_time" name="eRecruitment_time" class="form-control" required/><br>
                                                                    </div>
                                                                    <br><label class="text-black">모집 대상</label>
                                                                    <div class="input-group input-group-outline">
                                                                        <input type="text" name="recruitment" class="form-control"/>
                                                                    </div>
                                                                    <br><label class="text-black">모집 인원</label>
                                                                    <div class="input-group input-group-outline">
                                                                        <input name="people" type="number" onKeypress="this.value = this.value.replace(/[^0-9]/g, '');"  class="form-control" placeholder="숫자만 입력해주세요" required><br>
                                                                    </div>
                                                                    <input type="hidden" id="rec_dt" name="rec_dt">
                                                                </div>

                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="text" class="text-black">강의 일정</label>
                                                            <span class="text-warning">*</span>
                                                        </th>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-8 ">
                                                                    <div id="lecture-list">
                                                                        <div id="lecture1">
                                                                            <label>강의 날짜</label>
                                                                            <div class="input-group input-group-outline">
                                                                                <input type="date" id="sdate1" name="sdate1" class="form-control" required/>&nbsp;~&nbsp;
                                                                                <input type="date"  id="edate1" name="edate1" class="form-control" required/>
                                                                            </div>
                                                                            <label>강의 시간</label>
                                                                            <div class="input-group input-group-outline">
                                                                                <input type="time" id="stime1" name="stime1" class="form-control" required/>&nbsp;~&nbsp;
                                                                                <input type="time" id="etime1" name="etime1" class="form-control" />
                                                                            </div>
                                                                            <br>
                                                                        </div>
                                                                        <%--자바 스크립트를 이용해서 강의 일정을 추가--%>
                                                                    </div>
                                                                    <input type="hidden" id="datelist" name="datelist">
                                                                    <div class="col-auto">
                                                                        <button type="button" class="btn btn-outline-info" onclick="addLectureDate()">일정 추가하기</button>
                                                                        <button type="button" class="btn btn-outline-info" onclick="delLectureDate()">일정 삭제하기</button>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="text" class="text-black">KeyWord</label>
                                                            <span class="text-warning">*</span>
                                                        </th>
                                                        <td>
                                                            <div class="col-md-6">
                                                                <select id="category" class="form-select ps-md-2">
                                                                    <option value="">대분류 선택</option>
                                                                    <option value="it">IT</option>
                                                                    <option value="selfImpro">자기계발</option>
                                                                    <option value="music">음악</option>
                                                                    <option value="economy">경제</option>
                                                                    <option value="art">미술</option>
                                                                    <option value="engin">공학</option>
                                                                    <option value="media">미디어</option>
                                                                    <option value="language">언어</option>
                                                                </select>

                                                                <div id="subcategoryContainer" style="display: none">
                                                                    
                                                                </div>

                                                                <div id="selectedSubcategories"></div>
                                                                <input type="hidden" id="keyword" name="keyword">
                                                            </div>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="text" class="text-black">가격</label>
                                                        </th>
                                                        <td>
                                                            <div class="input-group input-group-outline">
                                                                <input id="price" name="price" type="number"  class="form-control" onKeypress="this.value = this.value.replace(/[^0-9]/g, '');" placeholder="숫자만 입력해주세요" min="0" ><br>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="text" class="text-black">신청 수락</label>
                                                            <span class="text-warning">*</span>
                                                        </th>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-3">
                                                                    <label><input type="radio" id="auto" name="acceptance" value="auto" checked>&nbsp;자동</label>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <label><input type="radio" id="manual" name="acceptance" value="manual" >&nbsp;수동</label>
                                                                </div>


                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <label for="text" class="text-black">스태프 모집</label>
                                                            <span class="text-warning">*</span>
                                                        </th>
                                                        <td>
                                                            <div class="row">
                                                                <div class="col-md-3">
                                                                    <label><input type="radio" name="recruit" value="no" checked onchange="optionCheck()">&nbsp;미사용</label>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <label><input type="radio" name="recruit" value="yes" onchange="optionCheck()">&nbsp;사용</label>
                                                                </div>
                                                            </div>
                                                            <div id="container">
                                                                <%-- 스태프 모집 사용 시 추가  --%>
                                                                
                                                            </div>
                                                            <div class="input-group input-group-outline" id="staffefile" style="display:none">
                                                                <input type="file" id="resume" name="resume" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <button type="submit"  class="btn btn-outline-info" >강의 등록 하기</button>                            
                                        </form>                
                                    </div>
                                </div>
                            </section>
                        </div>
                                                                    -->

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <%@include file="host-center-footer.jspf"%>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
        
        <%--
        모달 창 띄우기
        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        --%>
        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="../vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="../js/demo/chart-area-demo.js"></script>
        <script src="../js/demo/chart-pie-demo.js"></script>
        <script type="text/javascript" src="../js/info.js" ></script>


    </body>

</html>