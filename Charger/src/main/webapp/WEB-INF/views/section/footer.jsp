<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="footer">
	<c:if test="${not empty sessionScope.user }">
		<span>${sessionScope.user.id} 님 반갑습니다.</span>
	</c:if>
	<c:if test="${empty sessionScope.user }">
		<span>BNK SYS</span>
	</c:if>
</div>
