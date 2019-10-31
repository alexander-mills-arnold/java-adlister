<%--
  Created by IntelliJ IDEA.
  User: brancealexander
  Date: 10/30/19
  Time: 10:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/partials/head.jsp" />
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>Info</title>
    <jsp:include page="/WEB-INF/partials/page_content.jsp" />



</head>
<body>
    <div id="info">
        <h1><c:out value="${thisad.title}" /></h1>
        <p><c:out value="${thisad.description}" /></p>
        <p><c:out value="${thisad.postDate}" /></p>
        <p><c:out value="${adCreator.username}" /></p>
    </div>


    <!DOCTYPE html>
    <html>
    <head>
        <meta charset='utf-8' />
        <title>Add a geocoder</title>
        <meta name='viewport' content='initial-scale=1,maximum-scale=1,user-scalable=no' />
        <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v1.3.0/mapbox-gl.js'></script>
        <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v1.3.0/mapbox-gl.css' rel='stylesheet' />
        <style>
            body { margin:0; padding:0; }
            #map { position:absolute; top:0; bottom:0; height: 75%; width:75%; }
        </style>
    </head>
    <body>

    <script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.1/mapbox-gl-geocoder.min.js'></script>
    <link rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.1/mapbox-gl-geocoder.css' type='text/css' />
    <div id='map'></div>

    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoibWFybm9sZDkwIiwiYSI6ImNqemloYzI5NDE1dGgzY3BpNmUzMG5xZWkifQ.OAdTxO3ZKbcL92rtDrRezg';
        var map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [-79.4512, 43.6568],
            zoom: 13
        });

        map.addControl(new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            mapboxgl: mapboxgl
        }));
    </script>

    </body>
    </html>
</body>
</html>