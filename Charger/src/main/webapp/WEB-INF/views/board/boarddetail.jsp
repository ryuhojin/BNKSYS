<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="resources/css/base.css">
    <link rel="stylesheet" type="text/css" href="resources/css/boarddetail.css">
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
    function init(){
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
    <div class="view_main">
        <div class="view_panel">
            <form name="frm" id="view_FRM" action="updateBoard" method="post">
            	<a href="./board" style="text-align:right; text-decoration: none; padding-bottom:2vh; font-size:0.9em; color:grey; margin-right:2vw;">목록으로</a> 
                <div style="display:flex; flex-direction: row; justify-content: center;">
                <span style="text-align: center; align-self:center; font-size:1.3em; font-weight: bold;  padding-right: 1vw;">글 상세내용</span><c:if test="${sessionScope.user.mno eq result.mno}"><span id="changeF" style="border-left: 1px solid black;padding-left:1vw; align-self:center; cursor:pointer; color:grey;" onclick="updateF()">수정하기</span></c:if>
                </div>
                <input type="hidden" name="bno" placeholder="${result.bno }" value="${result.bno }">
                <input type="number" name="mno" readonly="readonly" placeholder="${result.mno }"
                       value="${result.mno }">
                <input type="hidden" name="bdate" placeholder="${result.bdate }"
                       value="${result.bdate }">
                <input id="btitle" type="text" name="btitle" readonly="readonly" placeholder="${result.btitle }" value="${result.btitle }" placeholder="제목을 입력하세요">
                <textarea id="bcontent" name="bcontent" readonly="readonly">${result.bcontent }</textarea>
                <c:if test="${sessionScope.user.mno eq result.mno}">
                <div id="buttonCap" style="justify-self:center;">
                	<input type="submit" class="effectbtn" value="수정하기" style=""> 
					<input type="button" class="effectbtn" onclick=deleteboard(${result.bno}) value="삭제하기">
                </div>
                </c:if> 
            </form>
        </div>
    </div>
    <jsp:include page="../section/footer.jsp"></jsp:include>
</div>
</body>
</html>