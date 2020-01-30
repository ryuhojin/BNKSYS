<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="resources/css/base.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script>
    function updateF() {
    	document.getElementById("btitle").readOnly = false;
    	document.getElementById("bcontent").readOnly = false;
    	var el = document.getElementById("btitle");
    	var e2 = document.getElementById("bcontent");
    	var e3 = document.getElementById("changeF");
    	el.style.border = "1px solid black";
    	e2.style.border = "1px solid black";
    	e3.style.color = "red";
	}
    function deleteboard(bno) {
    	//alert("delete call")
    	location.href = "delete?bno="+bno
    	//location.href = "deleteBoard?bno="+bno
    }
    </script>
</head>
<body>
<div class="container">
   <jsp:include page="../section/header.jsp"></jsp:include>
    <div class="view_main">
        <div class="viewpanel">
            <form name="frm" action="updateBoard" method="post">
            	<a href="./board" style="text-align:right; text-decoration: none; padding-bottom:2vh; font-size:0.9em; color:grey;">목록으로</a> 
                <div style="display:flex; flex-direction: row; justify-content: center;">
                <span style="text-align: center; font-size:1.3em; font-weight: bold;  padding-right: 1vw;">글 상세내용</span><c:if test="${sessionScope.user.mno eq result.mno}"><span id="changeF" style="border-left: 1px solid black;padding-left:1vw; cursor:pointer; color:grey;" onclick="updateF()">수정하기</span></c:if>
                </div>
                <input type="hidden" name="bno" placeholder="${result.bno }" value="${result.bno }">
                <input type="number" name="mno" readonly="readonly" placeholder="${result.mno }"
                       value="${result.mno }">
                <input type="hidden" name="bdate" placeholder="${result.bdate }"
                       value="${result.bdate }">
                <input id="btitle" type="text" name="btitle" readonly="readonly" placeholder="${result.btitle }" value="${result.btitle }" placeholder="제목을 입력하세요">
                <textarea id="bcontent" name="bcontent" readonly="readonly">${result.bcontent }</textarea>
                <c:if test="${sessionScope.user.mno eq result.mno}">
                <div id="buttonCap" justify-self:center;">
                	<input type="submit" value="수정하기" style="width: 35%;
					background-color: #fff;
					border: 1px solid black;
					border-radius: 10px;
					text-align: center !important;"> 
					<input type="button" onclick=deleteboard(${result.bno}) style="width: 35%;
					background-color: #fff;
					border: 1px solid black;
					border-radius: 10px;
					text-align: center !important;" value="삭제하기">
                </div>
                </c:if> 
            </form>
        </div>
    </div>
    <jsp:include page="../section/footer.jsp"></jsp:include>
</div>
</body>
</html>