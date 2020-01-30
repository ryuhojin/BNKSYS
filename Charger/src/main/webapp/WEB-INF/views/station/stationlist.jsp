<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/base.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
	<div class="container">
		<jsp:include page="../section/header.jsp"></jsp:include>
		<div class="station_main">
			<h3 style="text-align:center;">충전소 리스트</h3>
			<table id="slist"
				style="background-color:#fff; align-self:center; width: 90vw; height: 60vh; display: flex; flex: row; justify-content: center; align:center; overflow: scroll; overflow-x:hidden;">
				<tr><th>이름</th><th>지역</th><th>운영시간</th></tr>
				<c:forEach var="b" items="${result }">
					<tr onclick=StationDetail(${b.cno}) >
						<td>${b.cname }</td>
						<td>${b.district }</td>
						<td>${b.starttime}~${b.endtime}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<jsp:include page="../section/footer.jsp"></jsp:include>
	</div>

</body>
</html>