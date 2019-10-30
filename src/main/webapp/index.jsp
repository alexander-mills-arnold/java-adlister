<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Welcome to the Adlister!</h1>
    <h1>CATEGORIES</h1>

    <c:forEach var="categor" items="${searchResults}">
        <h3>
            <c:out value="${product.name}"/>
            <small><c:out value="${product.price}"/></small>
        </h3>
    </c:forEach>
</div>
</body>
</html>
