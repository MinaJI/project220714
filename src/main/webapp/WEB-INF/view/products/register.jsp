<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 2022/07/20
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품등록</title>
</head>
<body>
<form action="/products/register" method="post" enctype="multipart/form-data">
    상품명 <input type="text" name="name" required>
    가격 <input type="text" name="price" required>
    분류 <input type="text" name="category" required>
    상품정보 <textarea id="info" name="info" style="height:200px"></textarea>
    상품사진 <input type="file" name="image" required>
    <button class="submitbtn" type="submit">등록</button>
</form>
</body>
</html>
