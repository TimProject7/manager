<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 확인 및 답변</title>
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#addBtn").click(function() {
			var questionReplyContent = $("#questionReply_content").val();

			if (questionReplyContent == "") {
				alert("답변을 입력해주세요");
				questionReplyContent.foucs();
				return;
			} else {
				// 폼 내부의 데이터를 전송할 주소
				document.form1.action = "/admin/question/questionreply"
				// 제출
				document.form1.submit();

			}
		});
	});
</script>
<link rel="stylesheet" href="/admin/resources/css/style.css">
<style type="text/css">
#center {
	text-align: center;
}
</style>
</head>
<body>

	<div align="center">
		<%@include file="../include/header.jsp"%>
		<br>

		<h2>1:1문의 게시글 상세보기</h2>
		<br>
		<table style="width: 500px;">

			<tr>
				<th>제목</th>
				<td>${questionDetail.question_title }</td>
				<td align="right">${questionDetail.question_writedate }</td>
			</tr>
			<tr>
				<th>문의ID</th>
				<td colspan="2">${userInfo.user_id }님</td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td colspan="2">${questionDetail.question_content }</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td colspan="3"><c:if
						test="${questionDetail.question_image != null }">
						<a href="/resources/images/${questionDetail.question_image }"
							target="_blank"><img
							src="/resources/images/${questionDetail.question_image }"
							style="width: 200px; height: 200px;"></a>
					</c:if></td>
			</tr>
			<tr align="right">
				<td align="right" colspan="3"><a
					href="/admin/question/questionlist"><button type="button"
							name="listBtn" id="listBtn">목록</button></a></td>
			</tr>
		</table>
		<br>
		<hr>
		<br>
		<h2 id="center">관리자 1:1문의 답변글</h2>
		<br>
		<c:choose>
			<c:when test="${questionDetail.question_status=='Y' }">
				<table border="1" style="width: 700px;">
					<tr align="center">
						<th>제목</th>
						<td>${userInfo.user_id }님이&nbsp;문의하신&nbsp;내용에&nbsp;대한&nbsp;답변글입니다.</td>
						<td>${questionReply.questionReply_writedate }</td>
					</tr>
					<tr>
						<th>답변내용</th>
						<td colspan="2"><img alt=""
							src="/admin/resources/images/${questionReply.questionReply_image }">
							<p style="width: 400px">${questionReply.questionReply_content }</p></td>
					</tr>
				</table>
			</c:when>

			<c:otherwise>
				<a href="02">
					<button type="button">문의 삭제</button>
				</a>
				<form name="form1" id="form1" method="post"
					enctype="multipart/form-data">
					<hr>
					<input type="hidden" name="question_number" id="question_number"
						value="${questionDetail.question_number }"> <input
						type="hidden" name="admin_number" id="admin_number"
						value="${sessionScope.avo.admin_number }">
					<table style="width: 700px;">

						<tr>
							<td>답변</td>
						</tr>
						<tr>

							<td><textarea name="questionReply_content"
									id="questionReply_content" style="width: 100%; height: 250px;"></textarea></td>
						</tr>
						<tr align="right">
							<td align="right"><input type="file"
								name="questionReply_photo" id="questionReply_photo"></td>
						</tr>
						<tr align="right">
							<td align="right">
								<button type="button" name="addBtn" id="addBtn">답변 등록</button>
							</td>
						</tr>
					</table>
				</form>
			</c:otherwise>
		</c:choose>


	</div>
</body>
</html>