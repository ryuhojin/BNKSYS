<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BOARD</title>
<link rel="stylesheet" type="text/css" href="resources/css/layout.css">

</head>
<body>
	<div class="container"
		style="background-image: url('resources/image/back.jpg'); background-size: cover;">
		<jsp:include page="../section/header.jsp"></jsp:include>
		<div class="main_insertBoard"">
			<form action="insertBoard" method="post">
				<input type="text" name="id" readonly="readonly" placeholder="${sessionScope.user.id }"
					value="${sessionScope.user.id }"> 
					<input type="hidden" name="mno" readonly="readonly" placeholder="${sessionScope.user.mno }"
					value="${sessionScope.user.mno }"> 
				<input type="text" name="btitle" placeholder="제목을 입력하세요">
				<textarea name="bcontent" placeholder="내용을 입력하세요"></textarea>
				
				<input type="submit" value="글쓰기">
			</form>
		</div>
		<jsp:include page="../section/footer.jsp"></jsp:include>
		<script>
			function aaa() {
				location.href = 'boardinsert';
			}
		</script>
	</div>
</body>
</html>