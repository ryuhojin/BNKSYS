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
    	</script>
</head>
<body>
<div class="container">
     <jsp:include page="../section/header.jsp"></jsp:include>
    <div class="board_main">
       <div class="tableP">
           <table>
               <caption><h1>게시판</h1></caption>
               <thead style="background-color:#f6f6f6;">
                    <tr style="height: 5vh"><th style="width:5vw;">No</th><th style="width:60vw;">제목</th><th style="width:10vw;">저자</th><th style="width:15vw;">일자</th></tr>
               </thead>
               <tbody>
               <c:forEach var="b" items="${result }">
               <tr onclick=boardDtail(${b.bno}) style="height:5vh;"><td style="text-align: center;">${b.bno }</td><td style="font-weight: bold">${b.btitle }</td><td>${b.mno }</td><td>${b.bdate}</td></tr>
               </c:forEach>
               </tbody>
           </table>
       </div>
       <c:if test="${not empty sessionScope.user.id }">
        <div class="buttonP">
            <button onclick="aaa()">글쓰기</button>
        </div>
        </c:if>
    </div>
     <jsp:include page="../section/footer.jsp"></jsp:include>
     <script>
    	function aaa(){
    		location.href='boardinsert';
    	}</script>
</div>
</body>
</html>