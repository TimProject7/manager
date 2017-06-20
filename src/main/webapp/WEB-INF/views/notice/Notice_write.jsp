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
<title>Notice 글 작성</title>

<script>
	$(document).ready(function() {

		$("#btnList").click(function() {
			document.form1.action = "Notice_list";
			document.form1.submit();

		});

		$("#btnSave").click(function() {
			//var title = document.form1.title.value; ==> name속성으로 처리할 경우
			//var content = document.form1.content.value;
			//var writer = document.form1.writer.value;
			var title = $("#notice_title").val();
			var content = $("#notice_content").val();
			if (notice_title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if (notice_content == "") {
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			}
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.action="/notice/Notice_insert"
			document.form1.submit();
		});
	});
</script>


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
		</c:when>
	</c:choose>

	<h2>게시글 작성</h2>
	<form id="form1" name="form1" method="post"
		action="/notice/Notice_insert">
		<input type="hidden" id="admin_id" name="admin_id"
			value="${ sessionScope.avo.admin_id}">
		<div>
			제목 <input name="nocite_title" id="notice_title" size="80"
				placeholder="제목을 입력해주세요">
		</div>
		<div>
			내용
			<textarea name="notice_content" id="notice_content" rows="4"
				cols="80" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div>
			이름 <input name="notice_writer" id="notice_writer" readonly="readonly"
				value="${sessionScope.avo.admin_id }">
		</div>
		<div style="width: 650px; text-align: center;">
			<button type="button" id="btnSave">확인</button>
			<button type="reset" id="btnList">취소</button>
		</div>
	</form>

</body>
</html>