<%--
  Created by IntelliJ IDEA.
  User: mitchellarnold
  Date: 2019-11-01
  Time: 08:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <h1>Edit the ad</h1>
    <form action="/profile" method="post">
        <div class="form-group">
            <label for="edit">Edit ad:</label>
            <textarea id="edit" name="edit" class="form-control" type="text"></textarea>
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
