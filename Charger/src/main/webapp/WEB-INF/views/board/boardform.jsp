<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertBoard" method="post">
<table>
<tr>
<tr><th>글쓴이</th><td><input type="number" name="mno"></tr>
<tr><th>title</th><td><input type="text" name="btitle"></td></tr>
<tr><th>content</th><td><textarea name="bcontent"></textarea></tr></td>
</table>
<input type="submit" value="글쓰기">
</form>
</body>
</html>