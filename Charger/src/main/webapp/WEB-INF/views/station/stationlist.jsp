<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/base.css">
<link rel="stylesheet" type="text/css" href="resources/css/s_list.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function StationDetail(cno) {
		location.href = './stationdetail?cno=' + cno; //get방식
	}
</script>
<script>
	function btnclick(){
		$.ajax({
				url : 'search',
				data : {
					s_category : $("#s_category").val(),
					s_keyword : $("#s_keyword").val()
				},
				success : function(data) {
					console.log("data확인" + data);
					//alert(data);
					$('.list_table tr:gt(0)').remove();
					var addData = '';
					var addData ='';
					$.each(data, function(i, ddd){
						addData += "<tr onclick='StationDetail("+ddd['cno']+")'>"
						addData += "<td>"+ddd['cname']+"</td>"
						addData += "<td>"+ddd['district']+"</td>"
						addData += "<td>"+ddd['starttime']+"~"+ddd['endtime']+"</td></tr>"
					})
					$('.list_table tr').after(addData);
					}
				})
	}
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../section/header.jsp"></jsp:include>
		<div class="station_main">
			<div class="station_page_name">
				<span>충전소 목차</span>
				<div>
				<select name="s_category" id='s_category'>
					<option value="cname">이름</option>
					<option value="district">지역구</option>
				</select>
				<input type="text" name="s_keyword" id='s_keyword'>
				<input type="button" onclick="btnclick()" value="검색 " id="sbtn">
				</div>
			</div>

			<table id="slist" class="list_table">
				<tr>
					<th>이름</th>
					<th>지역</th>
					<th>운영시간</th>
				</tr>
				<c:forEach var="b" items="${result }">
					<tr onclick=StationDetail(${b.cno})>
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
