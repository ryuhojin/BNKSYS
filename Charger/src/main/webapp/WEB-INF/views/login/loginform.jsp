<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LOGIN</title>
    <link rel="stylesheet" type="text/css" href="resources/css/layout.css">
</head>
<body>
<div class="container" style="background-image: url('resources/image/back.jpg'); background-size:cover;">
     <jsp:include page="../section/header.jsp"></jsp:include>
    <div class="main">
        <div class="loginpanel">
            <form action="loginAf" method="post">
                <input type="text" name= "id" placeholder="아이디를 입력해주세요">
                <input type="password" name="pass" placeholder="비밀번호를 입력해주세요">
                <button>LOGIN</button>
            </form>
        </div>
    </div>
     <jsp:include page="../section/footer.jsp"></jsp:include>
</div>
</body>
</html>