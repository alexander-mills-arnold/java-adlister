<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
        <jsp:include page="/WEB-INF/partials/page_content.jsp" />
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h3> Here is a look at what's currently in your profile...</h3>


        <c:forEach var="ad" items="${ads}">
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="placeholder">
                <div class="card-body <%--col-md-6--%>">
                    <h3 class="card-title">${ad.title}</h3>
                    <p class="card-text">${ad.description}</p>
                    <a href="#" class="btn btn-primary"> Click to ad link! </a>
                </div>
            </div>
        </c:forEach>

    </div>

</body>
</html>
