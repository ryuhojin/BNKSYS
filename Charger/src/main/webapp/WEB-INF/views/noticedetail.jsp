<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen,print" href="css/login.css" />
<link href="css/main.css" rel="stylesheet" type="text/css" media="all">
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all">
<title>SafeFood</title>
</head>
<div style="margin: 30px; text-align: right;">
	<div style="position: relative; z-index: 2;">
		<form action="" method="post" name="loginForm" id="_loginForm">
			<input type="hidden" name="action" value="loginForm" />
			<c:choose>
				<c:when test="${empty sessionScope.login }">
					<ul id="navi">
						<li>
							<a href="#" id="loginLabel">Login</a>
							<div class="loginbox" id="dd">
								<table id="areaLogin">
									<tr>
										<td>아이디</td>
										<td>
											<input type="text" id="_loginId" name="loginId" value="">
										</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td>
											<input type="password" id="_passwd" value="" name="passwd">
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<input type=button value="로그인" onclick="javascript:fnLogin()">
											<input type=button value="회원가입" onclick="javascript:fnRegi()">
										</td>
									</tr>
								</table>
							</div>
						</li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul id="navi" style="display: none;">
						<li>
							<a href="#" id="loginLabel">Login</a>
							<div class="loginbox" id="dd">
								<table id="areaLogin">
									<tr>
										<td>아이디</td>
										<td>
											<input type="text" id="_loginId" name="loginId" value="">
										</td>
									</tr>
									<tr>
										<td>비밀번호</td>
										<td>
											<input type="password" id="_passwd" value="" name="passwd">
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<input type=button value="로그인" onclick="javascript:fnLogin()">
											<input type=button value="회원가입" onclick="javascript:fnRegi()">
										</td>
									</tr>
								</table>
							</div>
						</li>
					</ul>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
	<c:choose>
		<c:when test="${empty sessionScope.login}">
			<table id="areaLogout" style="display: none;">
				<tr>
					<td>
						<div id="loginInfo"></div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="로그 아웃" onclick="fnLogout()">
					</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<form action="./logout" method="post" name="logoutForm" id="_logoutForm">
				<input type="hidden" name="action" value="logoutForm" />
				<table id="areaLogout">
					<tr>
						<td>
							<div id="loginInfo">[${sessionScope.login.name}]님 반갑습니다.</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="로그 아웃" onclick="fnLogout()">
							<input type="button" value="회원 정보 수정" onclick="fnUpdate('${login.id}')">
						</td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>
</div>

<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<a href="SafeFood.jsp">
				<img src="picture/ssafy.png" height="75" width="100" alt="오류">
			</a>
		</div>
		<div id="menu">
			<ul>
				<li class="m1">
					<a href="" accesskey="1" title="">공지사항</a>
				</li>
				<li class="m1">
					<a href='./foodcontrol?action=foodinfo' title="">상품 정보</a>
				</li>
				<li class="m1">
					<a href="" accesskey="3" title="">베스트 섭취 정보</a>
				</li>
				<li class="m1">
					<a href="./foodcontrol?action=eatinfo" accesskey="4" title="">내 섭취 정보</a>
				</li>
				<li class="m1">
					<a href="" accesskey="5" title="">예상 섭취 정보</a>
				</li>
			</ul>
		</div>
	</div>
</div>
<div id="banner">
	<div class="container">
		<div class="title">
			<img src="picture/main.png" width="500" height="250" alt="오류">
			<h2>WHAT WE PROVIDE</h2>
			<p>건강한 삶을 위한 먹거리 프로젝트</p>
		</div>
	</div>
</div>
<div id="banner2">
	<form action="" method="post" id="_frmFormSearch" class="banner2_input">
		<select name="s_category" style="padding-left: 10px; border: none; background-color: #B2CCFF; width: 100px; height: 26px;">
			<option value="title">제목</option>
			<option value="author">등록인</option>
		</select>
		<input type="text" onkeydown="JavaScript:Enter_Check();" name="s_keyword" style="margin-left: 7px; margin-top: 15px; border: none; background-color: #B2CCFF; width: 200px; height: 26px;">
		<input type="button" value="검색 " id="_btnSearch" class="button" style="width: 50px; margin-left: 7px;">
	</form>
</div>
<div>
	<form action="" method="post" id="_noticeupdateform">
		<br />
		<h3 id="_title" name="title" style="text-align: center;">${notice.title }</h3>
		<span  style="margin-left: 90%;">${notice.date }</span>
		<span name="author" style="margin-left: 90%;">${notice.author }</span>
		<hr>
		<br />
		<div style="margin-left: 10%;">${notice.content }</div>
		<input type="button" value="목록 " class="button" style="width: 50px; margin-left: 50%;" onclick="location.href='./foodcontrol?action=noticelist'">
		
		<c:if test="${notice.author eq sessionScope.login.id }">
			<input type="button" value="수정 " class="button" style="width: 50px; margin-left: 90%;" onclick="update();">
		</c:if>
	</form>
</div>
<%-- <div id="_recentPage" style="">
	<c:choose>
		<c:when test="${recentBlock == 1 }">
			<a style="color: black">PREV</a>
		</c:when>
		<c:otherwise>
			<a href="foodcontrol?action=&recentBlock=${recentBlock-1}&recentPage=${endPage - 3}">PREV</a>
		</c:otherwise>
	</c:choose>
	<c:forEach var="i" begin="${stPage }" end="${endPage }">
		<a href="foodcontrol?action=foodinfo&recentBlock=${recentBlock}&recentPage=${i }">
			<c:out value="${i }" />
		</a>
	</c:forEach>
	<c:choose>
		<c:when test="${recentBlock == totBlock }">
			<a style="color: black">NEXT</a>
		</c:when>
		<c:otherwise>
			<a href="foodcontrol?action=foodinfo&recentBlock=${recentBlock+1}&recentPage=${stPage + 3}">NEXT</a>
		</c:otherwise>
	</c:choose>
</div> --%>
<script type="text/javascript">
	function update() {
		var title = $('#_title').html();
		$('#_noticeupdateform').attr("action","./foodcontrol?action=noticeupdateform&n_num="+${notice.num}).submit();
	}

	/*****
	 *    로그인 함수 예제
	 *****/
	function fnLogin() {
		var id = $("#_loginId").val();

		var passwd = $("#_passwd").val();

		if (id.value == "") {
			alert("아이디를 입력하세요..!!");
			objLogin.focus();
			return;
		} else if (passwd.value == "") {
			alert("비밀번호를 입력하세요..!!");
			objPasswd.focus();
			return;
		}
		$('#_loginForm').attr("action", "./foodcontrol?action=login").submit();

	} // end function fnLogin()
	function fnLogout() {

		$('#_logoutForm').attr("action", "./foodcontrol?action=logout")
				.submit();

	}
	function fnRegi() {

		$('#_loginForm').attr("action", "./foodcontrol?action=signup2")
				.submit();

	}
	function fnUpdate(id) {
		location.href = './foodcontrol?action=mypage&id=' + id; //get방식
	}

	/*****
	 * 
	 /*****
	 *    패스워드 필드에서 엔터키를 누를 경우
	 *     fnLogin() 함수 실행
	 *****/
	function onKeyupPasswd(ev) {
		var evKeyup = null;

		if (ev) // firefox
			evKeyup = ev;
		else
			// explorer
			evKeyup = window.event;

		if (evKeyup.keyCode == 13) { // enter key code:13
			document.getElementById("passwd").blur();
			fnLogin();
		} // end if

	} // end function onKeyupPasswd()
</script>
<script type="text/javascript">
	(function($) {

		//로그인 버튼	 
		$("#loginLabel").click(function(e) {

			e.preventDefault();

			if ($('.loginbox').css('display') == 'none') {
				$('.loginbox').slideDown();
			} else {
				$('.loginbox').slideUp();
			}
		});

		//닫힘버튼
		$(".closeBtn").click(function(e) {

			$('.loginbox').slideUp();

		});
	})(jQuery);

	$("#_btnSearch").click(function() {
		$("#_frmFormSearch").attr({
			"target" : "_self",
			"action" : "./foodcontrol?action=noticesearch"
		}).submit();
	});

	function noticedetail(_num) {
		alert(_num);
		location.href = './foodcontrol?action=noticedetail&num=' + _num; //get방식
	}
</script>
</body>
</html>