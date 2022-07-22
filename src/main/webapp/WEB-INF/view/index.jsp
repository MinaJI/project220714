<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Main</title>
    <link rel="stylesheet" href="/static/css/nav.css">
    <script src="/static/js/index.js"></script>
</head>
<body><script>
    location.href='<c:out value="${pageContext.request.contextPath}"/>${"/products/showAllIndex"}';
</script>
</body>
</html>