<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

h2 {
	text-align: left;
}

.div1 {
	width: 43%;
}

.logout_table {
	width: 55%;
}

a {
	text-decoration: none;
	color: black;
}

a:HOVER {
	font-size: 1.1em;
	color: teal;
}

label {
	padding-left: 3%;
	padding-right: 3%;
}

th {
	color: white;
	background-color: black;
}

.no {
	text-align: center;
}
</style>
</head>
<body>
	<div class="div1">
		<%@include file="../include/header.jsp"%>
		<br> <br>


		<h2>회원 게시판 목록</h2>

		<br>
		<%@ include file="../include/boardheader.jsp"%>

		<form>
			<div align="center">
				<table border="1" style="width: 660px;">
					<tr>
						<Th>아이디</Th>
						<Th>회원명</Th>
						<Th>휴대전화</Th>
						<Th>이메일</Th>
						<Th>가입일자</Th>
						<th>상태</th>
					</tr>

					<c:choose>
						<c:when test="${not empty userList }">
							<c:forEach var="userList" items="${userList}">
								<input type="hidden" id="user_number" name="user_number"
									value="${userList.user_number }">
								<tr>

									<td><a href="userdetail/${userList.user_number }">${userList.user_id }</a></td>
									<td><a href="userdetail/${userList.user_number }">${userList.user_name }</a></td>
									<td>${userList.user_phone }</td>
									<td>${userList.user_email }</td>
									<td>${userList.user_regdate }</td>
									<td><c:choose>
											<c:when test="${userList.user_status == 'Y'}">
												<font style="color: black">일반회원</font>
											</c:when>
											<c:otherwise>
												<font style="color: red"> 탈퇴회원</font>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>

						</c:when>
						<c:otherwise>
							<td colspan="5">등록된 회원이 없습니다.</td>
						</c:otherwise>
					</c:choose>

				</table>
			</div>
		</form>
	</div>
</body>
</html>