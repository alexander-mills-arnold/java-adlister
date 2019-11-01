<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String failedUsername = (String) request.getSession().getAttribute("failedusername");
    String failedEmail = (String) request.getSession().getAttribute("failedemail");
    String errorCodes = (String) request.getSession().getAttribute("errorCodes");
%>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group" id="username-div">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <div class="form-group" id="email-div">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text">
            </div>
            <div class="form-group" id="password-div">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group" id="confirm-password-div">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
    <p id="test"></p>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript">
    const failedUsername = "<%= failedUsername %>";
    const failedEmail = "<%= failedEmail %>";
    const errorCodes = "<%= errorCodes %>";

    if(errorCodes !== ""){
        if(errorCodes.indexOf("1") !== -1){
            $("#username-div").append("<p style='color: red'>You must enter a username</p>");
        }else if(errorCodes.indexOf("5") !== -1){
            $("#username-div").append("<p style='color: red'>Sorry. Username is taken</p>");
        }

        if(errorCodes.indexOf("2") !== -1){
            $("#email-div").append("<p style='color: red'>You must enter an email</p>");
        }

        if(errorCodes.indexOf("3") !== -1){
            $("#password-div").append("<p style='color: red'>You must enter a password</p>");
        }

        if(errorCodes.indexOf("4") !== -1){
            $("#confirm-password-div").append("<p style='color: red'>Passwords must match</p>");
        }
    }
    if(failedUsername !== "null"){
        $("#username").val(failedUsername);
    }

    if(failedEmail !== "null"){
        $("#email").val(failedEmail);
    }
</script>
</html>
