<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="header">
        <div class="logo">
            <a class="logos">CHARGER</a>
        </div>
        <div class="menu">
        <c:if test="${not empty sessionScope.user }">
        		 <a class="menus">${sessionScope.user.id}님</a>
        	</c:if>
            <a class="menus">BOARD</a>
            <a class="menus">STATION</a>
            <c:choose>
            <c:when test="${empty sessionScope.user }">
             <a class="menus"><span class="pointtospan">L</span>OGIN</a>
            </c:when>
            <c:otherwise>
				<a class="menus" href="./logout"><span class="pointtospan">L</span>OGOUT</a>
            </c:otherwise>
            </c:choose>
        </div>
    </div>