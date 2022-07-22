<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page session="false" %>--%>
<%--<c:set var="username"--%>
<%--       value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('username')}"/>--%>
<c:set var="loginOutLink" value="${sessionScope.logIn.username==null ? '/user/logIn' : '/user/logOut'}"/>
<c:set var="loginOut" value="${sessionScope.logIn.username==null ? 'LOGIN' : 'LOGOUT'}"/>
<c:set var="regiMypageLink" value="${sessionScope.logIn.username==null ? '/user/register' : ''}"/>
<c:set var="regiMypage" value="${sessionScope.logIn.username==null ? 'JOIN US' : ''}"/>
<html>
<head>
  <title>Main</title>
  <link rel="stylesheet" href="/static/css/nav.css">
  <script src="/static/js/index.js"></script>
</head>
<body>
<div class="wrap">
  <div class="header">
    <div id="menu">
      <img src="/static/image/menu.png" width="35px" onclick="openNav()" style="cursor: pointer">
    </div>
    <div class="logo">
      <a href="<c:url value="/"></c:url> ">
      <img src="/static/image/sockslogo.png" width="150px"></a>
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
    <a href="/notice/showAll">NOTICE</a>
    <a href="#">Q&A</a>
    <a href="#">REVIEW</a>
  </div>
</div>
</body>
</html>