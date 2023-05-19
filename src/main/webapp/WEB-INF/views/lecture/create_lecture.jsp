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
        <script type="text/javascript" src="../js/lecture.js" ></script>
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="index.html">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="${pageContext.request.contextPath}/lecture/create_lecture" >
                        <i class="fas fa-fw fa-cog"></i>
                        <span>강의 개설</span>
                    </a>
                </li>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Components</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Components:</h6>
                            <a class="collapse-item" href="buttons.html">Buttons</a>
                            <a class="collapse-item" href="cards.html">Cards</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                       aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Utilities</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                         data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Custom Utilities:</h6>
                            <a class="collapse-item" href="utilities-color.html">Colors</a>
                            <a class="collapse-item" href="utilities-border.html">Borders</a>
                            <a class="collapse-item" href="utilities-animation.html">Animations</a>
                            <a class="collapse-item" href="utilities-other.html">Other</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Addons
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                       aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Pages</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Login Screens:</h6>
                            <a class="collapse-item" href="login.html">Login</a>
                            <a class="collapse-item" href="register.html">Register</a>
                            <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                            <div class="collapse-divider"></div>
                            <h6 class="collapse-header">Other Pages:</h6>
                            <a class="collapse-item" href="404.html">404 Page</a>
                            <a class="collapse-item" href="blank.html">Blank Page</a>
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="charts.html">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Charts</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Tables</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

                <!-- Sidebar Message -->
                <div class="sidebar-card d-none d-lg-flex">
                    <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="...">
                    <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                    <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>


                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <!--
                            <!- - Nav Item - Alerts - ->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-bell fa-fw"></i>
                                    <!- - Counter - Alerts - ->
                                    <span class="badge badge-danger badge-counter">3+</span>
                                </a>
                                <!- - Dropdown - Alerts - ->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                    aria-labelledby="alertsDropdown">
                                    <h6 class="dropdown-header">
                                        Alerts Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 12, 2019</div>
                                            <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-success">
                                                <i class="fas fa-donate text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 7, 2019</div>
                                            $290.29 has been deposited into your account!
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-warning">
                                                <i class="fas fa-exclamation-triangle text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">December 2, 2019</div>
                                            Spending Alert: We've noticed unusually high spending for your account.
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                </div>
                            </li>
    
                            <!- - Nav Item - Messages - ->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-envelope fa-fw"></i>
                                    <!- - Counter - Messages - ->
                                    <span class="badge badge-danger badge-counter">7</span>
                                </a>
                                <!- - Dropdown - Messages - ->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                    aria-labelledby="messagesDropdown">
                                    <h6 class="dropdown-header">
                                        Message Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                                alt="...">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                                problem I've been having.</div>
                                            <div class="small text-gray-500">Emily Fowler · 58m</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                                alt="...">
                                            <div class="status-indicator"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">I have the photos that you ordered last month, how
                                                would you like them sent to you?</div>
                                            <div class="small text-gray-500">Jae Chun · 1d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                                alt="...">
                                            <div class="status-indicator bg-warning"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Last month's report looks great, I am very happy with
                                                the progress so far, keep up the good work!</div>
                                            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                                alt="...">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                                told me that people say this to all dogs, even if they aren't good...</div>
                                            <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                                </div>
                            </li>
    
                            <div class="topbar-divider d-none d-sm-block"></div>
                            -->
                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">여기에 이름 동적으로 가져오기</span>
                                    <img class="img-profile rounded-circle"
                                         src="assets/img/cow.jpg"> <!--프로필 이미지-->
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="card card-body shadow-xl mx-2 mx-md-6 mt-8">
                            <section class="py-7">
                                <div class="container">
                                    <div class="row align-items-center justify-content-start">
                                        <p class="font-weight-bold text-2xl text-gradient-dark">강의 등록하기</p>
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
                                                                        <input type="text" id="detail" name="detail" placeholder="상세주소" class="form-control" >
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
                                                                                <input type="date" id="sdate1" name="sdate1" class="form-control"/>&nbsp;~&nbsp;
                                                                                <input type="date"  id="edate1" name="edate1" class="form-control"/>
                                                                            </div>
                                                                            <label>강의 시간</label>
                                                                            <div class="input-group input-group-outline">
                                                                                <input type="time" id="stime1" name="stime1" class="form-control"/>&nbsp;~&nbsp;
                                                                                <input type="time" id="etime1" name="etime1" class="form-control"/>
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


                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2021</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

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