<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateBoard" method="post">
<table>
<tr>
<tr><input type="hidden" name="bno" value="${result.bno}"></tr>
<tr><th>글쓴이</th><td><input type="number" name="mno" value="${result.mno }"></tr>
<tr><th>작성시간</th><td><input type="text" name="bdate" value="${result.bdate}" readonly	></tr>
<tr><th>title</th><td><input type="text" name="btitle" value="${result.btitle }"></td></tr>
<tr><th>content</th><td><textarea name="bcontent">${result.bcontent }</textarea></td></tr>
</table>
<input type="submit" value="수정하기">
</form>
</body>
</html>