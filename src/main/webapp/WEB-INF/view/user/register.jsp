<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 2022/07/14
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/static/css/register.css">
    <title>회원가입</title>
</head>
<body>
<div id="leftwrap">
    <div id="header">
        <p class="font1">Create An Account.</p>
        <P class="font2">이미 계정이 있으신가요? <span onclick="location.href='/user/logIn'" style="cursor: pointer"><u>로그인 하러가기</u></span></P>
    </div>
</div>


<div id="rightwrap">
    <div id="registerForm" class="font3">
        <form action="/user/register" method="post">
            <label>아이디<br><input type="text" name="username" id="username" required></label>
            <br>
            <label>비밀번호<br><input type="password" name="password" id="password" required></label>
            <br>
            <label>이름<br><input type="text" name="nickname" id="nickname" required></label>
            <br>
            <label>핸드폰번호<br><input type="text" name="phone" id="phone" required></label>
            <br>
            <label>이메일<br><input type="text" name="email" id="email" required></label>
            <p>소식을 받아보시겠습니까?</p>

            <div class="join_btn">
                <button class="submitbtn" type="submit">Create account</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>