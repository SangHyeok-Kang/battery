<%-- 
    Document   : surveymanager
    Created on : 2023. 6. 4., 오후 3:59:39
    Author     : qntjd, parkchaebin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <title>호스트 센터</title>
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
                        <h1 class="h3 mb-2 text-gray-800">설문 관리하기</h1>
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <button type="button" class="btn btn-outline-info" onclick="location.href = 'createSurvey'">등록 하기</button>
                                <button type="button" class="btn btn-outline-info" onclick="delServey(13)">삭제 하기</button>
                                <hr class="sidebar-divider">
                                <div class="sidebar-heading">
                                    <label class="h5 mb-4 text-gray-800">설문지 목록</label>
                                </div>
                                <div class="row">
                                    <%
                                        String[] surveyList = (String[]) request.getAttribute("surveyList");
                                        boolean[] isDelChecked = (boolean[]) request.getAttribute("isChecked");
                                        if (surveyList == null || surveyList.length == 0) {
                                    %>
                                    <p>생성한 설문이 없습니다.</p>
                                    <%
                                    } else {
                                    %>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>설문명</th>
                                                <th>삭제</th>
                                                <th>다운로드</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <%
                                                for (int i = 0; i < surveyList.length; i++) {
                                                    String surveyName = surveyList[i];
                                                    boolean currentDelCheck = isDelChecked[i];
                                            %>
                                            <tr>
                                                <td><%= surveyName%></td>
                                                <td>
                                                    <form action="deleteSurvey" method="POST">
                                                        <input type="hidden" name="surveyName" value="<%= surveyName%>">
                                                        <input type="submit" name="delete" value="삭제" <%= currentDelCheck ? "disabled" : ""%>>

                                                    </form>
                                                </td>
                                                <td>
                                                    <form action="downloadSurvey" method="POST">
                                                        <input type="hidden" name="surveyName" value="<%= surveyName%>">
                                                        <input type="submit" name="download" value="다운로드">
                                                    </form>
                                                </td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
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
    </body>
</html>