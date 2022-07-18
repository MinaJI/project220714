<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 2022/07/14
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/static/css/logIn.css">
    <title>로그인</title>
</head>
<body>
<div id="wrap">
    <div id="header"><p class="font3" style="text-align: left;">LOGIN</p>
    </div>
    <div id="contents">
    <form action="/user/logIn" method="post">
        <label>ID</label> <input type="text"
                                 placeholder="아이디를 입력해 주세요." name="username" required>
        <label>PASSWORD</label> <input type="password"
                                       placeholder="비밀번호를 입력해 주세요." name="password" required>
        <button type="submit" class="btn1">로그인</button>
    </form>
    </div>
</div>
</body>
</html>