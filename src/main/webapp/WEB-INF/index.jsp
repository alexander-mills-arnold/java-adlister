<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/partials/hompage_style.jsp" />


<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12 text-center">
<%--                    <h1 id="header">ADLISTER</h1>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class ="col-md-12 flex-container">
                <c:forEach var="heading" items="${headings}">
                    <div class="card col-md-12"id="item">

                            <div>
                                <div class="col-md-12 card-title text-center">
                                <h1>${heading.category}</h1>
                                </div>
                                <div class="p text-center">
                                    <div>
                                <c:forEach var="category" items="${categories}">
                                    <c:if test="${category.category == heading.category}">

                                            <p>${category.subcategory}</p>

                                    </c:if>
                                </c:forEach>
                                    </div>
                                </div>
                            </div>

                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%--    <h1>Welcome to the Adlister!</h1>--%>
<%--    <h1>CATEGORIES</h1>--%>


<%--    <c:forEach var="heading" items="${headings}">--%>
<%--        <div class="col-md-6">--%>
<%--            <h1>${heading.category}</h1>--%>
<%--    <c:forEach var="category" items="${categories}">--%>
<%--        <div class="col-md-6">--%>
<%--            <p>${category.subcategory}</p>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>


<%--<div class="row">--%>
<%--    <div class="col-md-12">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-12">--%>
<%--                <h1>Welcome to the Adlister!</h1>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="row">--%>
<%--    <div class="col-md-12">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-12 card">--%>
<%--                <c:forEach var="heading" items="${headings}">--%>
<%--                    <div class="card-body">--%>
<%--                        <div class="col-md-4 card-title">--%>
<%--                            <h1>${heading.category}</h1>--%>
<%--                            <c:forEach var="category" items="${categories}">--%>
<%--                                <c:if test="${category.category == heading.category}">--%>
<%--                                    <div class="col-md-4">--%>
<%--                                        <p>${category.subcategory}</p>--%>
<%--                                    </div>--%>
<%--                                </c:if>--%>
<%--                            </c:forEach>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--</div>--%>
