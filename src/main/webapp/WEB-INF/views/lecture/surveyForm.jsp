<%-- 
    Document   : surveyForm
    Created on : 2023. 6. 8., 오후 8:19:23
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/assets/css/sb-admin-2.css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/js/lecture.js" ></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../header.jspf" %>
        <div class="container-fluid">
            <%
                String surveyTitle = (String) request.getAttribute("surveyTitle");
                String surveyContent = (String) request.getAttribute("surveyContent");
            %>

            <% if (surveyContent != null) {%>
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800"><%= surveyContent%></h1>
            <% }%>
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <form action="createResult.do" method="POST">
                            <input type="hidden" name="title" value="<%=surveyContent%>"><!-- comment -->
                            <input type="hidden" name="surveyTitle" value="<%=surveyTitle%>">
                            <%
                                String[] survey = (String[]) request.getAttribute("survey");

                                if (survey != null) {
                                    for (int i = 0; i < survey.length; i += 6) {
                                        String question = survey[i];
                                        boolean isType = !survey[i + 1].equals("N/A");
                            %>

                            <tr scopr="row">
                            <p><b>질문: <%=question%></b></p>
                            <% if (isType) { %>
                            <p>답변:
                                <% for (int j = 1; j <= 5; j++) {%>
                                <label><input type="radio" name="answer<%=i / 6%>" value="<%=survey[i + j]%>" required><%=survey[i + j]%></label> 
                                    <% } %>
                            </p>
                            <% } else {%>
                            <p>답변: <input type="text" name="answer<%=i / 6%>" required></p> 
                                <% }%>

                            <input type="hidden" name="question" value="<%=question%>">
                            </tr>

                            <% } %>



                            <%
                                } else {
                                    System.out.println("null");
                                }%>
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <button class="btn btn-primary" type="submit">제출</button>
                    </div>
                    </form>
                </div>
            </div><!-- comment -->
        </div>
    </body>
</html>
