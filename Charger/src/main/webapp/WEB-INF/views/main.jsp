<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<link rel="stylesheet" type="text/css" href="resources/css/base.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function init() {
		if(${not empty sessionScope.user})
		{
			var el = document.getElementById("catchphrase");
			el.style.display = "flex";
		}
		var strArr = document.location.href.split("/");
		if(strArr[4]==""){
			document.getElementById("now").innerHTML="&nbspHOME"
		}else if(strArr[4].includes("detail")){
			document.getElementById("now").innerHTML="&nbspDETAIL"
		}else if(strArr[4].includes("logout")){
			document.getElementById("now").innerHTML="&nbspHOME"
		}else if(strArr[4].includes("insert")){
			document.getElementById("now").innerHTML="&nbspINSERT"
		}else if(strArr[4].includes("station")){
			document.getElementById("now").innerHTML="&nbspSTATION"
		}else if(strArr[4].includes("board")){
			document.getElementById("now").innerHTML="&nbspBOARD"
		}
		}
	function enterkey(){
		$.ajax({
			url: "idcheck",
			type: "POST",
			data:{
				"id":$('#id').val()
			},
			success: function(data){
				
				$('#id').attr("check_result",data)
				if(data=="true")
				{
					var e1 = document.getElementById("checkers")
					e1.style.backgroundColor = "green";
				}
				
			},
			error: function(){
				alert("서버에 문제가 있습니다")
			}
		});

	}
	function LoginOK()
	{
		if($('#id').attr("check_result") == "true")
			{
			alert("가입이 완료되었습니다.")
			return true
			}
		else
			{
			alert("이미 존재하는 아이디 입니다.")
			return false
			}
	}
	
</script>
</head>
<body onload="init()">
	<div class="container">
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="mdi mdi-close close"></span>
				<form action="signup" method="post" onSubmit="return LoginOK()">
					<div>
						<span>ACCOUNT</span><input type="button" onclick="enterkey()" id="checkers">
					</div>
					<input  type="text" id="id" name="id"
						placeholder="아이디를 입력해주세요" check_result="false" required> <input
						type="password" id="pass" name="pass" placeholder="비밀번호를 입력해주세요"
						required> 
						<input type="submit" value="SIGN UP">
				</form>
			</div>
		</div>
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