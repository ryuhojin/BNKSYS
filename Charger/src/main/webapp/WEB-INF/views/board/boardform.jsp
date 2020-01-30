<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BOARD</title>
<link rel="stylesheet" type="text/css" href="resources/css/base.css">

</head>
<body>
	<div class="container">
		<jsp:include page="../section/header.jsp"></jsp:include>
		<div class="input_main">
			<div class="inputpanel">
				<form action="insertBoard" method="post">
					<h1 style="text-align: center">글 쓰기</h1>
					<input type="text" name="id" readonly="readonly"
						placeholder="${sessionScope.user.id }"
						value="${sessionScope.user.id }"> 
					<input type="hidden"
						name="mno" readonly="readonly"
						placeholder="${sessionScope.user.mno }"
						value="${sessionScope.user.mno }"> 
					<input type="text"
						name="btitle" placeholder="제목을 입력하세요">
					<textarea name="bcontent" placeholder="내용을 입력하세요"></textarea>
					<input type="submit" value="WRITE">
				</form>
			</div>
		</div>
		<jsp:include page="../section/footer.jsp"></jsp:include>
	</div>
</body>
</html>