<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String failedUsername = (String) request.getSession().getAttribute("wrongUsername");
    System.out.println(failedUsername);
    String errorCodes = (String) request.getSession().getAttribute("profileErrors");
    System.out.println(errorCodes);
%>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Please Log In</h1>
        <form action="/login" method="POST">
            <div class="form-group" id="username-div">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block" value="Log In">
        </form>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
    const failedUsername = "<%= failedUsername %>";
    const errorCodes = "<%= errorCodes %>";
    if(failedUsername !== "null"){
        $("#username").val(failedUsername);
    }

    if(errorCodes !== ""){
        if(errorCodes.indexOf("1") !== -1){
            $("#username-div").append("<p style='color: red'>Sorry. Username does not exist</p>");
        } else if(errorCodes.indexOf("2") !== -1){
            $("#username-div").append("<p style='color: red'>Username and password do not match</p>");
        }
    }
</script>
</html>

