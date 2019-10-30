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
        <style>

            #ad-card{
                display: flex;
                justify-content: space-evenly;
                align-items: center;
            }

            .card{
                border: 2px solid grey;
                border-radius: 30px 20px;
                padding: 10px;
            }

            img {
                width: 150px;
                height: 150px;
            }

        </style>
        <div id="ad-card">
            <div class="card" style="width: 18rem;">
                <img src= "https://cdn.vox-cdn.com/thumbor/CqUT8Og4fGolQSLnumdw9oS4X1Q=/0x0:2397x3000/1200x800/filters:focal(1018x523:1400x905)/cdn.vox-cdn.com/uploads/chorus_image/image/65570450/AP_19301725142822.0.jpg" class="card-img-top" alt="placeholder">
                <div class="card-body">
                    <h5 class="card-title"> (Ad title insert goes here) </h5>
                    <p class="card-text"> (Description of the ad here) </p>
                    <a href="/info?selectedad=horse" class="btn btn-primary"> Click to ad link! </a>
                </div>
            </div>

            <div class="card" style="width: 18rem;">
                <img src="https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12234558/Chinook-On-White-03.jpg" class="card-img-top" alt="placeholder">
                <div class="card-body">
                    <h5 class="card-title"> (Ad title insert goes here) </h5>
                    <p class="card-text"> (Description of the ad here) </p>
                    <a href="#" class="btn btn-primary"> Click to ad link! </a>
                </div>
            </div>

            <div class="card" style="width: 18rem;">
                <img src="https://media.familyminded.com/3b/0d/3b0d80ed89394877a47899a513ca04bd.jpeg" class="card-img-top" alt="placeholder">
                <div class="card-body">
                    <h5 class="card-title"> (Ad title insert goes here) </h5>
                    <p class="card-text"> (Description of the ad here) </p>
                    <a href="#" class="btn btn-primary"> Click to ad link! </a>
                </div>
            </div>
        </div>


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
