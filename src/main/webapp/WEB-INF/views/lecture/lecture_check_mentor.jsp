<%-- 
    Document   : lecture_check_mento
    Created on : 2023. 6. 7., 오후 6:07:08
    Author     : qntjd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
        <script>
            <c:if test="${!empty msg}">
            alert("${msg}");
            </c:if>

        </script>
    </head>
    <body>
        <%@include file="lecturemenu.jspf"%> 
        <h2>참여자 명단</h2>

        <select id="selectPeriod">
            <c:forEach items="${dateList}" var="list" varStatus="co">
                <option value="${list}">${list}</option>
            </c:forEach>
        </select>
        <select id="selectDay">

        </select>
        <div id="regiList">

        </div>
    </body>
    <script>
        var list = [];
        window.onload = function () {
        <c:forEach items="${regiList}" var="data">
            list.push({
                id: "${data.getId()}",
                name: "${data.getName()}",
                phone: "${data.getPhone()}",
                birth: "${data.getBirth()}",
                date: "${data.getDate()}",
                state: "${data.getState()}",
                enstate: "${data.getEnState()}"
            });
        </c:forEach>
        document.getElementById("regiList").addEventListener('change', getRegiList);
        document.getElementById("selectPeriod").addEventListener('change', getDateList);
            getDateList();
            getRegiList();

        };
        const inregi = document.getElementById("regiList");
        
        function getDateList() {
            const [startDate, endDate] = document.getElementById("selectPeriod").value.split('~');
            const start = new Date(startDate);
            const end = new Date(endDate);
            const dateList = [];

            while (start <= end) {
                const formattedDate = start.toISOString().slice(0, 10);
                dateList.push(formattedDate);
                start.setDate(start.getDate() + 1);
            }

            var str = ``;
            dateList.forEach(function (item) {
                str += `<option value="` + item + `">` + item + `</option>`
            });


            document.getElementById("selectDay").innerHTML = str;
        }

        function getRegiList() {
            var str=``;
            
            const selectDate = document.getElementById("selectPeriod").value;
            str=`<table class="table" width="100%"  cellspacing="0">
                        <colgroup>
                            <col style="width: 5%;">
                            <col style="width: 10%;">
                            <col style="width: 20%;">
                            <col style="width: 20%;">
                            <col style="width: 20%;">
                            <col style="width: 10%;">
                            <col style="width: 10%;">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="text-center">No.</th>
                            <th class="text-center">이름</th>
                            <th class="text-center">전화번호</th>
                            <th class="text-center">생년월일</th>
                            <th class="text-center">출석현황</th>
                            <th class="text-center">출석</th>
                            <th class="text-center">결석</th>
                        </tr>
                        </thead> 
                        <tbody>`;
            
            var co = 1;
            var colist=[];
            var total = list.length;
            const [startDate, endDate] = document.getElementById("selectPeriod").value.split('~');
            list.forEach(function(item){
                var count = total - co;
                if(item.state === '2' && item.date.includes(startDate) && item.date.includes(endDate) && item.enstate === '수락'){
                    str+=`<tr scope="row">
                                <th class="text-center" id="co-`+ co +`"></th>
                                <th class="text-center">`+item.name+`</th>
                                <th class="text-center">`+item.phone+`</th>
                                <th class="text-center">`+item.birth+`</th>
                                <th class="text-center">`+item.enstate+`</th>
                                <th class="text-center"><button class="btn btn-outline-info center" onclick="location.href='attend.do?str=accept-`+ item.id +`'" type="button">출석</th>
                                <th class="text-center"><button class="btn btn-outline-info center" onclick="location.href='attend.do?str=refusal-`+ item.id +`'" type="button">결석</th>
                              </tr>`;
                   colist.push("co-"+co);
                        co++;
                }
            });
            
            str+=`</tbody></table>`;
            inregi.innerHTML = str;
             var count=0;
                  var total =colist.length;
                 colist.forEach(function(item){
                     document.getElementById(item).innerHTML = total-count;
                     count++;
                 });
        }

    </script>
</html>
