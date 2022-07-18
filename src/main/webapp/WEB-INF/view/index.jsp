<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 2022/07/14
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="username"
       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('username')}"/>
<c:set var="loginOutLink" value="${username=='' ? '/user/logIn' : '/user/logOut'}"/>
<c:set var="loginOut" value="${username=='' ? 'LOGIN' : 'LOGOUT'}"/>
<c:set var="regiMypageLink" value="${username=='' ? '/user/register' : '/user/mypage'}"/>
<c:set var="regiMypage" value="${username=='' ? 'JOIN US' : ''}"/>
<html>
<head>
    <title>Main</title>
    <link rel="stylesheet" href="/static/css/index.css">
    <script src="/static/js/index.js"></script>
</head>
<body>
<div class="wrap">
    <div class="header">
        <div id="menu">
            <img src="/static/image/menu.png" width="35px" onclick="openNav()" style="cursor: pointer">
        </div>
        <div class="logo">
            <img src="/static/image/sockslogo.png" width="150px">
        </div>
        <div class="mypage">
            <img src="/static/image/mypage.png" width="35px">
        </div>
        <div class="cart">
            <img src="/static/image/cart.png" width="35px">
        </div>
    </div>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="menu1">
            <i><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></i>
            <i><a href="<c:url value='${regiMypageLink}'/>">${regiMypage}</a></i>
            <br>
        </div>
        <div class="menu2">
            <a href="#" onclick="dropdown()" class="dropdown-btn">SHOP</a></div>
            <div id="dropdown-container">
                <a href="#">ALL</a>
                <a href="#">MENS</a>
                <a href="#">WOMENS</a>
                <a href="#">KIDS</a>
            </div>
        <a href="/board/noticeAll">NOTICE</a>
        <a href="#">Q&A</a>
        <a href="#">REVIEW</a>
        </div>
    </div>
</div>
<
</div>
</body>
</html>