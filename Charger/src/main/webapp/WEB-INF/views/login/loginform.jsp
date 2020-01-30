<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var modal = document.getElementById("myModal");
	var btn = document.getElementById("myBtn");
	var span = document.getElementsByClassName("close")[0];
	function modalopen() {
		modal.style.display = "block";
	}

	span.onclick = function() {
		modal.style.display = "none";
	}

	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
<div id="login">
	<form action="loginAf" method="post">
		<h1>LOGIN</h1>
		<input type="text" name="id" placeholder="아이디를 입력해주세요"> <input
			type="password" name="pass" placeholder="비밀번호를 입력해주세요">
		<button>LOGIN</button>
		<span onclick="modalopen()">아직 회원이 아니십니까?</span>
	</form>
</div>
