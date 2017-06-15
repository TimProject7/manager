<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>

<!-- 일반 메뉴 -->
<a href="/product/productlist">상품관리(목록)</a>
|
<a href="#">회원관리</a>
|
<a href="#">게시판관리</a>
|
<a href="#">통계</a>
|


<!-- 로그인, 로그아웃 -->
<c:choose>
	<c:when test="${sessionScope.admin_id != null}">
         ${sessionScope.admin_id}님이 로그인중입니다.
        <a href="/admin/logout">로그아웃</a>
	</c:when>

</c:choose>
<hr>