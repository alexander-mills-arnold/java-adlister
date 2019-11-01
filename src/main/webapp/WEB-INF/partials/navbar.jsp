<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/partials/hompage_style.jsp" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=EB+Garamond|Overlock&display=swap" rel="stylesheet">
<nav class="navbar navbar-expand-md navbar-light">
    <span class="navbar-text d-none d-md-block">Feeling Lucky!</span>
    <a class="navbar-brand mx-md-auto mr-auto" href="/">
        <h1 id="header">ADLISTER</h1>
    </a>
    <span class="navbar-text d-block mt"> <form action="/ads" method="post">
                <input type="text" id="search" name="search">
                <button id="search-btn">Search</button>
            </form></span>
    <button class="navbar-toggler ml-lg-0" type="button" data-toggle="collapse" data-target="#navbarContent">
        <span class="navbar-toggler-icon"></span>
    </button>
</nav>
<nav class="navbar p-0 navbar-expand-md navbar-light">
    <div class="collapse navbar-collapse px-3" id="navbarContent">
        <ul class="navbar-nav mx-md-auto mx-0 w-50 align-items-start nav-fill">
            <c:if test="${sessionScope.user != null}">
                <li class="nav-item">
                    <a class="nav-link" href="/ads/create">Create an Ad</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/profile">View Profile</a>
                </li>
            </c:if>
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register">Register</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Log Out</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <li class="nav-item">
                <a class="nav-link"  href="/ads">View All Ads</a>
            </li>
        </ul>
    </div>
</nav>
<script>
    const searchInput = document.getElementById("search");
    const searchButton = document.getElementById("search-btn");
    searchButton.addEventListener("click", function () {
        const searchInput = searchInput.value();
        if(searchInput !== null){
            const newUrl = "http://localhost:8080/count?search=" + searchInput;
            document.location.href = newUrl;
        }
    });
</script>
