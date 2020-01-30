<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function StationDetail(cno) {
		location.href = './stationdetail?cno=' + cno; //get방식
	}
	
</script>
</head>
<body>
<div id="map"></div>
<h2>Station list</h2>
<table>
<c:forEach var="b" items="${result }">
<tr onclick=StationDetail(${b.cno}) ><td>${b.cname }</td><td>${b.district }</td><td>${b.locdetail}</td><td>${b.starttime}~${b.endtime}</td></tr>
</c:forEach>
</table>
</body>
</html>