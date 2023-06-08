<%-- 
    Document   : review
    Created on : 2023. 6. 3., 오후 12:34:56
    Author     : parkchaebin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">

        <title>
            WeUs
        </title>

        <!--font ??????-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <!--css file-->
        <link id="pagestyle" href="${pageContext.request.contextPath}/assets/css/material-kit.css" rel="stylesheet" />
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>
    </head>
    <body>
        <h1>리뷰</h1>

        <div class="col-4">
            <div class="table-responsive col-11">
                <form id="contact-form" method="post" action="insertReview" autocomplete="off"  onsubmit="input()">
                    <label class=" h3 tex-black">강의 리뷰</label>
                    <table class="table" id="clssTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="text-center">이름</th>
                                <th class="text-center">평점</th>
                                <th class="text-center">평가 리뷰</th>
                            </tr>
                        </thead> 
                        <tbody>
                            <tr>
                                <th class="text-center">
                                    ${lec.getTitle()}
                                </th>
                                <th class="text-center">
                                    <select class="text-sm rounded-2 mb-2" name="lectureGrade" >
                                        <option value="-1">선택</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </th>
                                <th class="text-center">
                                    <div class="input-group input-group-outline" >
                                        <input class="form-control" type="text" name="lectureReview"/>
                                    </div>

                                </th>
                            </tr>
                            <tr>
                                <td class="text-center">
                                    ${lec.getHost()}
                                </td>
                                <td class="text-center">
                                    <select class="text-sm rounded-2 mb-2" name="hostGrade" >
                                        <option value="-1">선택</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </td>
                                <td class="text-center">
                                    <div class="input-group input-group-outline" >
                                        <input class="form-control" type="text" name="hostReview"/>
                                    </div>

                                </td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                    <label class=" h3 tex-black">수강자 리뷰</label>
                    <table class="table" id="menteeTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="text-center">이름</th>
                                <th class="text-center">평점</th>
                                <th class="text-center">평가 리뷰</th>
                            </tr>
                        </thead> 
                        <tbody>
                            <c:forEach items="${list}" var="list">
                                <c:if test="${list.getState() == 2 }">
                                    <tr>
                                        <td class="text-center">
                                            ${list.getName()}
                                        </td>
                                        <td class="text-center">
                                            <select class="text-sm rounded-2 mb-2" name="menteeGrade-${list.getId()}" >
                                                <option value="-1">선택</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </td>
                                        <td class="text-center">
                                            <div class="input-group input-group-outline" >
                                                <input class="form-control" type="text" name="menteeReview-${list.getId()}"/>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            <tr></tr>
                        </tbody>
                    </table>
                    <label class=" h3 tex-black">강사 리뷰</label>
                    <table class="table" id="teacharTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="text-center">이름</th>
                                <th class="text-center">평점</th>
                                <th class="text-center">평가 리뷰</th>
                            </tr>
                        </thead> 
                        <tbody>
                            <c:forEach items="${list}" var="list">
                                <c:if test="${list.getState() == 0 }">
                                    <tr>
                                        <td class="text-center">
                                            ${list.getName()}
                                        </td>
                                        <td class="text-center">
                                            <select class="text-sm rounded-2 mb-2" name="teacherGrade-${list.getId()}" >
                                                <option value="-1">선택</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </td>
                                        <td class="text-center">
                                            <div class="input-group input-group-outline" >
                                                <input class="form-control" type="text" name="teacherReview-${list.getId()}"/>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            <tr></tr>
                        </tbody>
                    </table>
                    <label class=" h3 tex-black">스태프 리뷰</label>
                    <table class="table" id="staffTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th class="text-center">이름</th>
                                <th class="text-center">평점</th>
                                <th class="text-center">평가 리뷰</th>
                            </tr>
                        </thead> 
                        <tbody>
                            <c:forEach items="${list}" var="list">
                                <c:if test="${list.getState() == 1 }">
                                    <tr>
                                        <td class="text-center">
                                            ${list.getName()}
                                        </td >
                                        <td class="text-center">
                                            <select class="text-sm rounded-2 mb-2" name="staffGrade-${list.getId()}" >
                                                <option value="-1">선택</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                        </td>
                                        <td class="text-center">
                                            <div class="input-group input-group-outline" >
                                                <input class="form-control" type="text" name="staffReview-${list.getId()}"/>
                                            </div>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            <tr></tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="data" name="data" value=""/>
                    <button type="submit" class="btn btn-outline-info">저장</button>
                </form>
            </div>
                                
        </div>
    </body>
    <script>
        var list = [];
        var sGrade=null;
        var sReview=null;
        var idList=[];
        
        <c:forEach items="${list}" var="regi">
            if (${regi.state} == 0) { //강사
                sGrade = `teacherGrade-${regi.getId()}`;
                sReview = `teacherReview-${regi.getId()}`;
            } else if (${regi.state} == 1) { //스탭
                sGrade = `staffGrade-${regi.getId()}`;
                sReview = `staffReview-${regi.getId()}`;
            } else if (${regi.state} == 2) { //학생
                sGrade = `menteeGrade-${regi.getId()}`;
                sReview = `menteeReview-${regi.getId()}`;
            }
            idList.push({
                reviewid: sReview,
                gradeid: sGrade
            });
        </c:forEach>
        
        
        var jsonString;
        function input() {
            list = [];
            idList.forEach(function(item){
                list.push({
                   id : item.gradeid.substring(item.gradeid.indexOf('-') + 1),
                   grade: document.getElementsByName(item.gradeid)[0].value,
                   review: document.getElementsByName(item.reviewid)[0].value
                });
            });
            jsonString = JSON.stringify(list);
            document.getElementById('data').value = jsonString;
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
    crossorigin="anonymous"></script>
</html>
