<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>STATION</title>
<link rel="stylesheet" type="text/css" href="resources/css/station.css">
<link rel="stylesheet" type="text/css" href="resources/css/base.css">
<link rel="stylesheet" type="text/css" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
<script>
    function init() {
		var strArr = document.location.href.split("/");
		if(strArr[4]==""){
			document.getElementById("now").innerHTML="&nbspHOME"
		}else if(strArr[4].includes("detail")){
			document.getElementById("now").innerHTML="&nbspDETAIL"
		}else if(strArr[4].includes("logout")){
			document.getElementById("now").innerHTML="&nbspHOME"
		}else if(strArr[4].includes("insert")){
			document.getElementById("now").innerHTML="&nbspINSERT"
		}else if(strArr[4].includes("station")){
			document.getElementById("now").innerHTML="&nbspSTATION"
		}else if(strArr[4].includes("board")){
			document.getElementById("now").innerHTML="&nbspBOARD"
		}

	}
    </script>
</head>
<body onload="init()">
	<div class="container">
		<jsp:include page="../section/header.jsp"></jsp:include>

		<div class="station_main">
			<div class="station_button">
				<a href="./chart">통계</a>&nbsp
				<a href="./stationlist">테이블</a>
			</div>
		<jsp:include page="stationmap.jsp"></jsp:include>
		</div>
		<jsp:include page="../section/footer.jsp"></jsp:include>
	</div>
</body>
</html>