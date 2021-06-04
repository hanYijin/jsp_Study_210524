<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #map {
    height: 100%;
  }
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }
</style>
<script async
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2gUodnZWtOt7jEimuwuHyHQ2g9SgbXOE&callback=initMap">
</script>
<script type="text/javascript">

let map;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.568889, lng:  126.976667 },
    zoom: 8
  });
}

</script>


</head>
<body>
<div class></div>
<div id="map"></div>
</body>
</html>