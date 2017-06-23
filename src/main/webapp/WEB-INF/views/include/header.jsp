<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>



<!-- 일반 메뉴 -->
<center>
<a href="/product/productlist">상품관리(목록)</a>
|
<a href="/user/userlist">회원관리</a>
|
<a href="/notice/noticelist">게시판관리</a>
|
<a href="#">통계</a>
|

<!-- 로그인, 로그아웃 -->
<c:choose>
	<c:when test="${not empty sessionScope.avo.admin_id}">&nbsp;&nbsp;&nbsp;&nbsp;
         ${sessionScope.avo.admin_id} 님이 로그인중입니다.
        <a href="/admin/logout">로그아웃</a>
	</c:when>

</c:choose>
<hr>
</center>