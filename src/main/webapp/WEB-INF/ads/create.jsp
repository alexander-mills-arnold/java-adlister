<%@ page import="java.util.List" %>
<%@ page import="com.codeup.adlister.models.Tag" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String failedTitle = (String) request.getSession().getAttribute("failedTitle");
    System.out.println(failedTitle);
    String failedDescription = (String) request.getSession().getAttribute("failedDescription");
    System.out.println(failedDescription);
    String createErrors = (String) request.getSession().getAttribute("createErrors");
    System.out.println(createErrors);
%>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group" id="title-div">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group" id="description-div">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group" id="select-div">
                <select id="category-select" name="category-select">
                    <option value="default">Choose an option</option>
                    <option value="community">Community</option>
                    <option value="services">Services</option>
                    <option value="housing">Housing</option>
                    <option value="for-sale">For Sale</option>
                    <option value="jobs">Jobs</option>
                </select>
            </div>
            <div id="community-tag-div" class="form-group">
                <c:forEach var="tag" items="${communityTags}">
                    <input type="radio" value="${tag.id}" name="tag_id" id="${tag.id}"> <label for="${tag.id}">${tag.title}</label>
                </c:forEach>
            </div>
            <div id="services-tag-div" class="form-group">
                <c:forEach var="tag" items="${servicesTags}">
                    <input type="radio" value="${tag.id}" name="tag_id" id="${tag.id}"> <label for="${tag.id}">${tag.title}</label>
                </c:forEach>
            </div>
            <div id="housing-tag-div" class="form-group">
                <c:forEach var="tag" items="${housingTags}">
                    <input type="radio" value="${tag.id}" name="tag_id" id="${tag.id}"> <label for="${tag.id}">${tag.title}</label>
                </c:forEach>
            </div>
            <div id="for-sale-tag-div" class="form-group">
                <c:forEach var="tag" items="${forSaleTags}">
                    <input type="radio" value="${tag.id}" name="tag_id" id="${tag.id}"> <label for="${tag.id}">${tag.title}</label>
                </c:forEach>
            </div>
            <div id="jobs-tag-div" class="form-group">
                <c:forEach var="tag" items="${jobsTags}">
                    <input type="radio" value="${tag.id}" name="tag_id" id="${tag.id}"> <label for="${tag.id}">${tag.title}</label>
                </c:forEach>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
    $("#community-tag-div").hide();
    $("#services-tag-div").hide();
    $("#housing-tag-div").hide();
    $("#for-sale-tag-div").hide();
    $("#jobs-tag-div").hide();

    const failedTitle = "<%= failedTitle %>";
    console.log(failedTitle);
    const failedDescription = "<%= failedDescription %>";
    console.log(failedDescription);
    const createErrors = "<%= createErrors %>";
    console.log(createErrors);

    if(failedTitle !== "null"){
        $("#title").val(failedTitle);
    }

    if(failedDescription !== "null"){
        $("#description").val(failedDescription);
    }

    if(createErrors !== ""){
        if(createErrors.indexOf("1") !== -1){
            $("#title-div").append("<p style='color: red'>You must enter a title</p>");
        }

        if(createErrors.indexOf("2") !== -1){
            $("#description-div").append("<p style='color: red'>You must enter a descritption</p>");
        }

        if(createErrors.indexOf("3") !== -1){
            $("#select-div").append("<p style='color: red'>You must select a category and tag</p>");
        }
    }
    
    $("#category-select").change(function () {
        $("#community-tag-div").hide();
        $("#services-tag-div").hide();
        $("#housing-tag-div").hide();
        $("#for-sale-tag-div").hide();
        $("#jobs-tag-div").hide();
        let selectedCategory = $(this).children("option:selected").val();

        switch (selectedCategory) {
            case "community":
                $("#community-tag-div").fadeIn();
                break;
            case "services":
                $("#services-tag-div").fadeIn();
                break;
            case "housing":
                $("#housing-tag-div").fadeIn();
                break;
            case "for-sale":
                $("#for-sale-tag-div").fadeIn();
                break;
            case "jobs":
                $("#jobs-tag-div").fadeIn();
                break;
        }
    })
</script>
</html>
