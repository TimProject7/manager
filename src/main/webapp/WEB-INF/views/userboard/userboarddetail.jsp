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
<style type="text/css">
#usertb {
	width: 500px;
	height: 600px;
}

#usertb th {
	background: black;
	color: white;
}

#user td {
	
}
</style>
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<div align="center">
		<form name="form" id="form">
			<h2 align="center">회원게시판 게시글 상세보기</h2>
			<table border="1" id="usertb">

				<tr>
					<th height="5%;">제목</th>
					<td>${userBoardDetail.userboard_title }</td>
				</tr>

				<tr>
					<th height="5%;">등록일자</th>
					<td>${userBoardDetail.userboard_writedate}</td>
				</tr>

				<tr>
					<th>내용</th>
					<td>${userBoardDetail.userboard_content }</td>
				</tr>

				<tr>
					<th>이미지</th>
					<td><img
						src="/admin/resources/images/${userBoardDetail.userboard_image }"></td>
				</tr>
			</table>
			<button type="button" id="deleteBtn" name="deleteBtn">삭제</button>
			<a href="/admin/userboard/userboardlist">
				<button type="button" id="btnlist" name="btnlist">목록보기</button>
			</a>
		</form>
	</div>
</body>

</html>