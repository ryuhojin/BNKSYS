<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table style="width:80vw; border:1px solid white;
	box-shadow:1px 1px 10px 3px grey; color:white; text-align:center; height:60vh;">
	<script>
	function boardDtail(bno) {
		location.href = './boarddetail?bno=' + bno; //get방식
	}
</script>
	<thead style="background-color:#fff;">
		<tr style="color:black;">
			<th style="width:5vw;">No</th>
			<th style="width:45vw;">제목</th>
			<th style="width:15vw;">저자</th>
			<th style="width:15vw;">날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="b" items="${result }">
			<tr onclick=boardDtail(${b.bno})>
				<td >${b.bno }</td>
				<td >${b.btitle }</td>
				<td >${b.mno }</td>
				<td>${b.bdate}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

