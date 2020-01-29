<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function boardDtail(bno) {
		location.href = './findOneBoard?bno=' + bno; //get방식
	}
	function aaa(){
		location.href='board';
	}
</script>
</head>
<body>
<form>
<table>
<tr><th>글번호</th><th>글제목</th><th>글쓴이</th><th>날짜</th></tr>
<c:forEach var="b" items="${result }">
<tr onclick=boardDtail(${b.bno}) ><td>${b.bno }</td><td>${b.btitle }</td><td>${b.mno }</td><td>${b.bdate}</td></tr>
</c:forEach>
</table>
</form> 
<button onclick="aaa()">글쓰기</button>
</body>
</html>