<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 2022/07/18
  Time: 7:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>공지 작성</title>
</head>
<body>
<div class="container">
    <form action="/notice/write" method="post">

        <label for="title">제목</label>
        <input type="text" id="title" name="title" placeholder="글 제목을 입력해주세요.">

        <label for="content">내용</label>
        <textarea id="content" name="content" placeholder="내용을 입력해주세요." style="height:200px"></textarea>

        <input type="submit" value="Submit">

    </form>
</div>

</body>
</html>
