<%--
  Created by IntelliJ IDEA.
  User: brancealexander
  Date: 10/30/19
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/partials/head.jsp" />
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Info</title>
    <jsp:include page="/WEB-INF/partials/page_content.jsp" />
</head>
<body>
    <h1><c:out value="${thisad.title}" /></h1>
    <p><c:out value="${thisad.description}" /></p>
    <p><c:out value="${thisad.postDate}" /></p>
    <p><c:out value="${adCreator.username}" /></p>
</body>
</html>