<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <c:if test="${sessionScope.user != null}">
                <li><a href="/ads/create">Create an Ad</a></li>
                <li><a href="/profile">View Profile</a></li>
            </c:if>
            <c:choose>
                <c:when test="${sessionScope.user == null}">
                    <li><a href="/login">Login</a></li>
                    <li><a href="/register">Register Here</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/logout">Logout</a></li>
                </c:otherwise>
            </c:choose>
            <li>    <form action="/ads" method="post">
                <input type="text" id="search" name="search">
                <button id="search-btn">Search</button>
            </form></li>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
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
