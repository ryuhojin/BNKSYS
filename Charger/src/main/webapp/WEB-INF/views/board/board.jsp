<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BOARD</title>
        <link rel="stylesheet" type="text/css" href="resources/css/base.css">
        <script>
    	function aaa(){
    		location.href='boardinsert';
    	}
    	function boardDtail(bno) {
    		location.href = './boarddetail?bno=' + bno; //get방식
    	}
    	function init() {
    		var strArr = document.location.href.split("/");
    		if(strArr[4]==""){
    			document.getElementById("now").innerHTML="&nbspHOME"
    		}else if(strArr[4].includes("detail")){
    			document.getElementById("now").innerHTML="&nbspDETAIL"
    		}else if(strArr[4].includes("insert")){
    			document.getElementById("now").innerHTML="&nbspINSERT"
    		}else if(strArr[4].includes("station")){
    			document.getElementById("now").innerHTML="&nbspSTATION"
    		}else if(strArr[4].includes("board")){
    			document.getElementById("now").innerHTML="&nbspBOARD"
    		}

		}
    	</script>
</head>
<body onload="init()">
<div class="container">
     <jsp:include page="../section/header.jsp"></jsp:include>
    <div class="board_main">
       <div class="tableP">
       <c:forEach var="b" items="${result }">
       <div class="board_li" onclick=boardDtail(${b.bno})>
       		<div class="board_mi">
       		<span>${b.btitle }</span>
       		</div>
       		<div class="board_sub">
       		<span>글번호 : ${b.bno }</span><span>저자 : ${b.mno }</span><span>작성시간 : ${b.bdate}</span>
       		</div>
       </div>
       </c:forEach>
       
    </div>
    <c:if test="${not empty sessionScope.user.id }">
        <div class="buttonP">
            <button onclick="aaa()">글쓰기</button>
        </div>
        </c:if>
     
     <script>
    	function aaa(){
    		location.href='boardinsert';
    	}</script>
</div>
<jsp:include page="../section/footer.jsp"></jsp:include>	
</body>
</html>