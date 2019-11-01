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
        <h3 class="title"> Here is a look at what's currently in your profile...</h3>

<%--//========= AD GENERATOR ============//--%>
        <div id="ad-card">
            <c:forEach var="ad" items="${userAds}">
                <div class="card col-md-6">
                    <img src="..." class="card-img-top" alt="placeholder">
                    <div class="card-body">
                        <a href="/info?selectedad=${ad.id}"><h3 class="card-title">${ad.title}</h3></a>
                        <p class="card-text">${ad.description}</p>
                        <%--EDIT AND DELETE--%>
                        <div class="edit-delete">
                            <button><a href="/edit?selectedad=${ad.id}"> Edit / Delete </a></button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
<%--//========= AD GENERATOR END ========//--%>
    </div> <%---------container end--%>



<%--&lt;%&ndash;//========= SCRIPTING   ===============//&ndash;%&gt;--%>

<%--<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>--%>
<%--<script>--%>

<%--    $("button").on("click", function(){--%>
<%--        $(this).remove();--%>
<%--    });--%>
<%--    $(".btn :button").live("click", function(){--%>
<%--        $(this).remove();--%>
<%--    });--%>

<%--    function add() {--%>
<%--        // $(".btn").append("<button> new one </button>");--%>
<%--        $("<button> new one </button>").insertAfter(".btn");--%>
<%--    };--%>
<%--</script>--%>

</body>
</html>


