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
			document.form.action = "user/userboarddelete"
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

			<table border="1">

				<tr>
					<th colspan="3">제목</th>
					<th>등록일자</th>
				</tr>
				<tr>
					<td colspan="3">${userBoardDetail.userboard_title }</td>
					<td>${userBoardDetail.userboard_writedate}</td>
				</tr>
				<tr>
					<th colspan="3">내용</th>
					<th>이미지</th>
				</tr>
				<tr>
					<td>${userBoardDetail.userboard_content }</td>
					<td>${userBoardDetail.userboard_image }</td>
				</tr>

			</table>
			<button type="button" id="deleteBtn" name="deleteBtn">삭제</button>
		</form>
	</div>
</body>

</html>