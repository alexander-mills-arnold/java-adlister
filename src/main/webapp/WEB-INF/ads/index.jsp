<%@ page import="com.codeup.adlister.models.Ad" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Ad> ads = (List<Ad>) request.getAttribute("ads");
    int count = ads.size();
    int randomAd = (int) (Math.random() * count);
    long randomAdId = ads.get(randomAd).getId();
%>
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
<div class="container">
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <h1>Here Are all the ads!</h1>
    <button id="random-ad">Random</button>
<%--//========= AD GENERATOR ============//--%>
        <div id="ad-card">
    <c:forEach var="ad" items="${ads}">
            <div class="card col-md-6">
                <img src="..." class="card-img-top" alt="placeholder">
                <div class="card-body">
                    <h3 class="card-title">${ad.title}</h3>
                    <p class="card-text">${ad.description}</p>
                    <a href="/info?selectedad=${ad.id}" class="btn btn-primary"> Click to ad link! </a>
                </div>
            </div>
    </c:forEach>
        </div>

<%--//========= AD GENERATOR END ========//--%>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
    const randomAdId = "<%= randomAdId %>";
    $("#random-ad").click(function () {
        document.location.href = "http://localhost:8080/count?search=" + randomAdId;
    });
</script>
</body>
</html>
