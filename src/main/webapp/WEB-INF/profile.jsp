<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h3> Here is a look at what's currently in your profile...</h3>
        <jsp:include page="/WEB-INF/partials/page_content.jsp" />


    </div>

    <c:forEach var="ad" items="${userAds}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <p>${ad.postDate}</p>
        </div>
    </c:forEach>

</body>
</html>
