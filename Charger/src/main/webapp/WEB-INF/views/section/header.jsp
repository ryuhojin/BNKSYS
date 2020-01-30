<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="header">
	<div class="logo">
		<a href="/app/"><span>CHARGER</span></a><span id="now">&nbspHOME</span>
	</div>
	<div class="menu">
		<a href="./board"><span>BOARD</span></a><a href="./station"><span>STATION</span></a><c:if test="${not empty sessionScope.user }"><a href="./logout"><span>LOGOUT</span></a></c:if>
	</div>
</div>