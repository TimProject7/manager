<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>x
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="/resources/css/adminmain.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/tap.js"></script>
</head>
<body>

	<c:choose>
		<c:when test="${not empty sessionScope.avo }">
			<table class="logout_table">
				<tr>
					<td>${sessionScope.avo.admin_id }님로그인하셨습니다.반갑습니다.</td>

					<td><a href="logout"><button>로그아웃</button> </a></td>
				</tr>
			</table>

			<br>
			<br>

			<div align="center">
				<ul class="tab">
					<li><a href="#tab1" class="selected">상품관리</a></li>
					<li><a href="#tab2">회원관리</a></li>
					<li><a href="#tab3">게시판관리</a></li>
					<li><a href="#tab4">통계</a></li>
				</ul>
			</div>

			<br>

			<div id="container2">

				<ul class="panel">


					<li id="tab1">
						<%@ include file="../product/product.jsp"%>

					</li>

					<li id="tab2">
						<%@ include file="../usermanagement/usermanagement.jsp"%>
					</li>

					<li id="tab3"><%@ include file="../board/notice/notice.jsp"%>
					</li>

					<li id="tab4">
						<%@ include file="../board/notice/notice.jsp"%>
					</li>
				</ul>
			</div>

		</c:when>
	</c:choose>

</body>
</html>