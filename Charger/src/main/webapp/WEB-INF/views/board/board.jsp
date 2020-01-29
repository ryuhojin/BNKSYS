<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BOARD</title>
        <link rel="stylesheet" type="text/css" href="resources/css/layout.css">
</head>
<body>
<div class="container" style="background-image: url('resources/image/back.jpg'); background-size:cover;">
     <jsp:include page="../section/header.jsp"></jsp:include>
    <div class="main">
    	<jsp:include page="boardlist.jsp"></jsp:include>
    </div>
     <jsp:include page="../section/footer.jsp"></jsp:include>
</div>
</body>
</html>