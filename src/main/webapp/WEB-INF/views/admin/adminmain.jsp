<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="/resources/css/adminmain.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/tab.js"></script>

</head>
<body>

	<c:choose>
		<c:when test="${not empty sessionScope.avo }">
			<%@include file="../include/header.jsp"%>
			<BR>
			<h1>관리자 페이지에 오신것을 환영합니다.</h1>

		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				self.location = "/"
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>