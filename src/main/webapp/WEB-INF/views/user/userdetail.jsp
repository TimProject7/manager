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
<script type="text/javascript">
	$(document).ready(function() {
		$("#userRNDBtn").click(function() {

			// 폼 내부의 데이터를 전송할 주소
			document.form.action = "/admin/user/userrnd"
			// 제출
			document.form.submit();
		});

	});
</script>
<link rel="stylesheet" href="/admin/resources/css/style.css">
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<div align="center">
		<form name="form" id="form">

			<table border="1">

				<tr>
					<th>회원번호</th>
					<th>회원 명</th>
					<th>ID</th>
					<th>EMAIL</th>
					<th>생년월일</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>전화번호</th>
					<th>휴대전화</th>
					<th>성별</th>
					<th>약관1</th>
					<th>약관2</th>
					<th>약관3</th>

				</tr>
				<tr>
					<td><input type="text" name="user_number"
						value="${userDetail.user_number }" readonly="readonly"> <input
						type="hidden" name="user_status"
						value="${userDetail.user_status }"></td>
					<td>${userDetail.user_name }</td>
					<td>${userDetail.user_id }</td>
					<td>${userDetail.user_email }</td>
					<td>${userDetail.user_birthday }</td>
					<td>${userDetail.zip_code }</td>
					<td>${userDetail.user_address }</td>
					<td>${userDetail.detail_address }</td>
					<td>${userDetail.user_cell }</td>
					<td>${userDetail.user_phone }</td>
					<td>${userDetail.user_gender }</td>
					<td>${userDetail.user_privacyconsignment }</td>
					<td>${userDetail.user_termsofuse }</td>
					<td>${userDetail.user_receiveadvertising }</td>
				</tr>
			</table>
			<button type="button" id="userRNDBtn" name="userRNDBtn">
				<c:choose>
					<c:when test="${userDetail.user_status == 'Y' }">
						<font style="color: red;">탈퇴</font>
					</c:when>
					<c:otherwise>
						<font style="color: black;">복구</font>
					</c:otherwise>
				</c:choose>
			</button>
		</form>
	</div>

</body>
</html>