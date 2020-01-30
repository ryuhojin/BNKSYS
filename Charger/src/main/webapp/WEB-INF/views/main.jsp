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
</head>
<body>
	<div class="container">
		<jsp:include page="section/header.jsp"></jsp:include>
		<div class="indexmain">
			<div id="catchphrase">
				<span>WE ARE<br>ALWAYS<br>CHARGING
				</span>
			</div>
			<c:if test="${empty sessionScope.user }">
			<jsp:include page="login/loginform.jsp"></jsp:include>
			</c:if>
		</div>
		<jsp:include page="section/footer.jsp"></jsp:include>
	</div>
</body>
</html>