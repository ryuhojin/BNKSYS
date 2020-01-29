<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function update(bno) {
	location.href = "./updateForm?bno="+bno;
}
function deleteboard(bno) {
	location.href = "./deleteBoard?bno="+bno;
}
</script>
</head>
<body>
<form >
<table>
<tr>
<tr><th>글쓴이</th><td>${result.mno }</tr>
<tr><th>작성시간</th><td>${result.bdate}"</tr>
<tr><th>title</th><td>${result.btitle }</td></tr>
<tr><th>content</th><td>${result.bcontent }</td></tr>
</table>
</form>
<a href="./selectAllBoard">목록으로</a> <button onclick=update(${result.bno})>수정하기</button><button onclick=deleteboard(${result.bno})>삭제하기</button>
</body>
</html>