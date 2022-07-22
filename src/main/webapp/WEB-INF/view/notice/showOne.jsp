<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>공지사항</title>
</head>
<body>
<jsp:include page="../nav.jsp"/>
글번호: ${n.id }
작성자: ${nickname }
작성일:
<fmt:formatDate value="${n.writtenDate.time }"
                pattern="yy년 MM월 dd일 HH시 mm분 ss초"/>
    <h4 class="card-title">${n.title }</h4>
    <p class="card-text">${n.content }</p>

    <c:if test="${n.writerId eq logInId }">
        <a href="/notice/update.jsp?id=${n.id }">수정하기</a>
        <a href="/notice/delete.jsp?id=${n.id }>">삭제하기</a>
    </c:if>

    <br/> <a href="/notice/showAll">목록으로</a>
</div>
</div>
</body>
</html>
