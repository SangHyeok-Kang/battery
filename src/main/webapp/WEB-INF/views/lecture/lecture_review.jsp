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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review</title>
    </head>
    <body>
        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>
        </script>
        <h1>리뷰</h1>

        <form action="insertReview" method='POST'>
            
            강의 리뷰 :  
            <select name="lectureGrade" >
                <option value="-1">선택</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
           

            
            <input type="text" name="lectureReview" value=""> <br> <br>

            <hr>

            강사 리뷰 :
            <select name="instructorGrade" >
                <option value="-1">선택</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>  
            <input type="text" name="instructorReview" value=""> <br> <br>

            <hr>

            스탭 리뷰 : 
            <select name="staffGrade" >
                <option value="-1">선택</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
 
            <input type="text" name="staffReview" value=""> <br> <br>

            <hr>

             기업 리뷰 : 
            <select name="businessGrade" >
                <option value="-1">선택</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <input type="text" name="businessReview" value="">
            
 


            <br> <input type="submit" value="저장" > 

        </form>
    </body>
</html>
