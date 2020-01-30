<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
	function init() {
		if(${not empty sessionScope.user})
		{
			var el = document.getElementById("catchphrase");
			el.style.display = "flex";
		}
		var strArr = document.location.href.split("/");
		if(strArr[4]==""){
			document.getElementById("now").innerHTML="&nbspHOME"
		}else if(strArr[4].includes("detail")){
			document.getElementById("now").innerHTML="&nbspDETAIL"
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
		<div class="cmain" style="overflow-x:hidden;">
			<div id="chartleft">
				<jsp:include page="chart3.jsp"></jsp:include>	
			</div>
			<div id="chartright">
				<div id="rightup">
					<jsp:include page="chart2.jsp"></jsp:include>
				</div>
				<div id="rightdown">
					<jsp:include page="chart.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<jsp:include page="../section/footer.jsp"></jsp:include>
	</div>
</body>
</html>