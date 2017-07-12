<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 게시판 디테일</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#deleteBtn").click(function() {

			// 폼 내부의 데이터를 전송할 주소
			document.form.action = "/admin/userboard/userboarddelete"
			// 제출
			document.form.submit();
		});

	});
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<div align="center">
		<form name="form" id="form">
			<input type="hidden" id="userboard_number" name="userboard_number"
				value="${userBoardDetail.userboard_number }">
			<button>LIST</button>
			<button type="button" id="deleteBtn" name="deleteBtn">DEL</button>
			<table border="1">
				<tr>
					<th>제 목</th>
					<td>${userBoardDetail.userboard_title }</td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td>${userBoardDetail.userboard_writedate}</td>
				</tr>
				<tr>
					<th>내 용</th>
					<td>${userBoardDetail.userboard_content }</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><img
						src="/resources/images/${userBoardDetail.userboard_image }"
						style="width: 250px; height: 200px;"></td>
				</tr>
			</table>

		</form>
		<br>
		<hr>
		<br>
	</div>
</body>

</html>