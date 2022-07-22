<%--
  Created by IntelliJ IDEA.
  User: mina
  Date: 2022/07/18
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>공지사항</title>
    <link rel="stylesheet" href="/static/css/noticeAll.css">
</head>
<body>
<jsp:include page="../nav.jsp"/>
<section class="notice">
    <div class="page-title">
        <div class="container">
            <h3>공지사항</h3>
        </div>
    </div>
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th>No</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <c:forEach items="${list }" var="n">
                    <tr onclick="location.href='/notice/showOne/${n.id}'">
                        <td>${n.id }</td>
                        <td>${n.title }</td>
                        <td>${nicknameMap[n.writerId] }</td>
                        <td><fmt:formatDate value="${n.writtenDate.time }"
                                            pattern="yy-MM-dd HH:mm:ss"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <div class="row pageNumArea">
        <div class="col">
            <a href='/notice/showAll/1' class="underLine">⟨</a>
            <c:choose>
                <c:when test="${currentPage < 3 and lastPageNo < 6}">
                    <c:forEach begin="1" end="${lastPageNo}" var="pageNo">
                        <c:choose>
                            <c:when test="${pageNo ne currentPage }">
                                <a href="/notice/showAll/${pageNo }" class="underLine">${pageNo }</a>
                            </c:when>
                            <c:otherwise>
                                <b class="underLine"> ${pageNo }</b>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:when>
                <c:when
                        test="${currentPage >= 3 and currentPage < lastPageNo - 2 }">
                    <c:forEach begin="${currentPage - 2}"
                               end="${currentPage + 2 }" var="pageNo">
                        <c:choose>
                            <c:when test="${pageNo ne currentPage }">
                                <a href="/notice/showAll/${pageNo }" class="underLine">${pageNo }</a>
                            </c:when>
                            <c:otherwise>
                                <b class="underLine"> ${pageNo }</b>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach begin="${lastPageNo - 4}" end="${lastPageNo}"
                               var="pageNo">
                        <c:choose>
                            <c:when test="${pageNo ne currentPage }">
                                <a href="/notice/showAll/${pageNo }" class="underLine">${pageNo }</a>
                            </c:when>
                            <c:otherwise>
                                <b class="underLine"> ${pageNo }</b>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            <a href='/notice/showAll/${lastPageNo }' class="underLine">⟩</a>
        </div>
    </div>
    <div onclick="location.href = '/notice/write'">글 작성하기</div>
    <div onclick="location.href = '/products/register'">상품등록</div>
</section>
</body>
</html>