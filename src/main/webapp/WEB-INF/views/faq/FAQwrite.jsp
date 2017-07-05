<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAQ 글 작성</title>

<script>
	$(document).ready(function() {

		$("#btnList").click(function() {
			document.form1.action = "/admin/faq/FAQlist";
			document.form1.submit();

		});

		$("#btnSave").click(function() {
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;
			var title = $("#faq_title").val();
			var content = $("#faq_content").val();
			var writer = $("#faq_writer").val();
			if (faq_title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (faq_content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
	});
</script>

</head>
<body>

	<%@include file="../include/header.jsp"%>

	<h2>게시글 작성</h2>
	<form name="form1" method="post" action="/admin/faq/FAQinsert">
		<input type="hidden" id="admin_number" name="admin_number"
			value="${ sessionScope.avo.admin_number}">
		<div>
			제목 <input name="faq_title" id="faq_title" size="80"
				placeholder="제목을 입력해주세요">
		</div>
		<div>
			내용
			<textarea name="faq_content" id="faq_content" rows="4" cols="80"
				placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div>
			이름 <input name="faq_writer" id="faq_writer" readonly="readonly"
				value="${sessionScope.avo.admin_id }">
		</div>
		<div style="width: 650px; text-align: center;">
			<button type="button" id="btnSave">확인</button>
			<button type="reset" id="btnList">취소</button>
		</div>
	</form>

</body>
</html>