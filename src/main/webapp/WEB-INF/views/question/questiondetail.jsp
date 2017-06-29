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
				document.form1.action = "question/questionreply"
				// 제출
				document.form1.submit();

			}
		});
	});
</script>
</head>
<body>
	<div align="center">
		<%@include file="../include/header.jsp"%>
		<%@ include file="../include/boardheader.jsp"%>
		<table style="width: 500px;">

			<tr>
				<th>${questionDetail.question_title }</th>
				<td colspan="3" align="right">${questionDetail.question_writedate }</td>
			</tr>
			<tr>
				<td><hr></td>

			</tr>
			<tr>
				<td>${userInfo.user_id }님</td>
			</tr>
			<tr>

				<td colspan="4">${questionDetail.question_content }</td>
			</tr>
			<tr>

				<td><c:if test="${questionDetail.question_image != null }">
						<img src="/resources/images/${questionDetail.question_image }">
					</c:if></td>
			</tr>
			<tr align="right">
				<td align="right"><a href="/question/questionlist"><button
							type="button" name="listBtn" id="listBtn">목록</button></a></td>
			</tr>
		</table>

		<form name="form1" id="form1" method="post"
			enctype="multipart/form-data">
			<hr>
			<input type="hidden" name="question_number" id="question_number"
				value="${questionDetail.question_number }"> <input
				type="hidden" name="admin_number" id="admin_number"
				value="${sessionScope.avo.admin_number }">
			<table style="width: 500px;">

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
	</div>
</body>
</html>