<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="header">
        <div class="logo">
            <a class="logos" href="/app/">CHARGER</a>
        </div>
        <div class="menu">
            <a class="menus" href="./board">BOARD</a>
            <a class="menus" href="./station">STATION</a>
            <c:choose>
            <c:when test="${empty sessionScope.user }">
             <a class="menus" href="/app/login">LOGIN</a>
            </c:when>
            <c:otherwise>
				<a class="menus" href="./logout">LOGOUT</a>
            </c:otherwise>
            </c:choose>
        </div>
    </div>