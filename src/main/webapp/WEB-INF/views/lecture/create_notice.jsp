<%-- 
    Document   : create_notice
    Created on : 2023. 5. 20., 오전 6:43:56
    Author     : qntjd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>공지사항 작성하기</h1>
        <hr/>
        <form action="insert_notice.do" method="POST" enctype="multipart/form-data">
            <h3>제목</h3>
            <input type="text" name="title" maxlength="5" required>
            <hr/>
            <h3>본문</h3>
            <textarea name="text" cols="50" rows="10" wrap="hard" style="resize: none;" required></textarea><br>
            <input type="file" name="file" style="border: solid 1px gray"/>
            <hr/>
            <input type="submit" value="작성하기"/>
        </form>
    </body>
</html>
