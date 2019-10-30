<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--//========= MAIN TITLE ==============//--%>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
</jsp:include>
<%--//========= STYLING   ===============//--%>
<jsp:include page="/WEB-INF/partials/page_content.jsp" />
</head>
<body>
<%--//========= DYNAMIC NAVIGATION ======//--%>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>
<%--//========= AD GENERATOR ============//--%>
        <div id="ad-card">
    <c:forEach var="ad" items="${ads}">
            <div class="card col-md-6">
                <img src="..." class="card-img-top" alt="placeholder">
                <div class="card-body">
                    <h3 class="card-title">${ad.title}</h3>
                    <p class="card-text">${ad.description}</p>
                    <a href="#" class="btn btn-primary"> Click to ad link! </a>
                </div>
            </div>
    </c:forEach>
        </div>
<%--//========= AD GENERATOR END ========//--%>
</div>

</body>
</html>
