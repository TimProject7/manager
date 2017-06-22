<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice 게시물 보기</title>

<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

a {
	text-decoration: none;
	color: green;
}

a:HOVER {
	font-size: 1.1em;
	color: teal;
}

h2{
	text-align: center;
}

th{
	text-align: left;
	background-color: black;
	color: white;
}

td{
	padding-left: 2%;
}

</style>

<script>
	$(document).ready(function() {

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "Notice_delete";
				document.form1.submit();
			}
		});

		$("#btnlist").click(function() {
			document.form1.action = "Notice_list";
			document.form1.submit();

		});

		$("#btnUpdete").click(function() {
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;
			var title = $("#notice_title").val();
			var content = $("#notice_content").val();
			if (title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			document.form1.action = "Notice_update"
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});

	});
</script>

</head>

<body>
	<c:choose>
		<c:when test="${not empty sessionScope.avo }">
			<%@include file="../include/header.jsp"%>
			<BR>



		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				self.location = "/"
			</script>
		</c:otherwise>
	</c:choose>

	<h2>게시글 보기</h2>
	
	<br>

	<form name="form1" method="post">
		<table>
			<tr>
				<th>작성일자</th>
				<td><fmt:formatDate value="${dto.notice_regdate}"
						pattern="yyyy-MM-dd a HH:mm:ss" /></td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${dto.notice_viewcnt}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input name="notice_title" id="notice_title" size="80"
					value="${dto.notice_title}"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea name="notice_content" id="notice_content"
						rows="4" cols="83">${dto.notice_content}</textarea></td>
			</tr>

			<tr>
				<th>작성자</th>
				<td><input name="notice_writer" id="notice_writer" size="80"
					value="${dto.notice_writer}" readonly="readonly"></td>
			</tr>
		</table>
		<div style="width: 650px; text-align: center;">
			<!-- 게시물번호를 hidden으로 처리 -->
			<input type="hidden" name="notice_no" value="${dto.notice_no}">
			<button type="button" id="btnUpdete">수정</button>
			<button type="button" id="btnDelete">삭제</button>
			<button type="button" id="btnlist">목록보기</button>
		</div>
	</form>

</body>
</html>