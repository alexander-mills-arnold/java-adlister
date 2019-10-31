<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%--//========= MAIN TITLE ==============//--%>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
<%--//========= STYLING   ===============//--%>
        <jsp:include page="/WEB-INF/partials/page_content.jsp" />
</head>
<body>
<%--//========= DYNAMIC NAVIGATION ======//--%>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h3> Here is a look at what's currently in your profile...</h3>

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

    <c:forEach var="ad" items="${userAds}">
        <div class="col-md-6">
            <h2><a href="/info?selectedad=${ad.id}">${ad.title}</a></h2>
            <p>${ad.description}</p>
            <p>${ad.postDate}</p>
        </div>
    </c:forEach>

</body>
</html>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title> test </title>
    <script src="jquery-1.6.2.js"></script>
    <script>
        /*
          $(document).ready(function(){
            $(".btn :button").click(function(){
              $(this).remove();
          });
        */
        $(".btn :button").live("click", function(){
            $(this).remove();
        });

        function add() {
            // $(".btn").append("<button> new one </button>");
            $("<button> new one </button>").insertAfter(".btn");
        };
    </script>
</head>
<body>
<div class="btn">
    <button> test </button>
</div>
<br /><br />
<div class="adding">
    <button onclick='add()'> add </button>
</div>
</body>
</html>