<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.avo }">
			<h2>${sessionScope.avo.admin_id }님로그인</h2>
			<a href="/logout"><button>로그아웃한다.</button> </a>
		</c:when>
	</c:choose>
</body>
</html>