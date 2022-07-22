<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 2022/07/20
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>상품 인덱스 화면</title>
    <link rel="stylesheet" href="/static/css/showAllIndex.css">
    <script src="jquery-3.6.0.min.js"></script>
    <script src="/static/js/showAllIndex.js"></script>
</head>
<body>
<div class="container">
    <c:forEach items="${list}" var="p">
        <img src="${p.imgPath}" class="image">
        <div class="overlay">
            <div class="text">
                상품명 ${p.name }
                가격 ${p.price }
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>