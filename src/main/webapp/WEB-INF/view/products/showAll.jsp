<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 2022/07/20
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>상품 전체보기</title>
</head>
<body>
<table>
    <c:forEach items="${list}" var="p">
        <tr>
            <td><img src="${p.imgPath}"> </td>
            상품명<td>${p.name }</td>
            가격<td>${p.price }</td>
            상품 정보<td>${p.info }</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
