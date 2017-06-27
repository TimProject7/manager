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

	<%@ include file="../include/boardheader.jsp"%>
	<form>
		<div align="center">
			<table border="1">
				<tr>
					<Th>문의번호</Th>
					<Th>제목</Th>
					<Th>등록일자</Th>

				</tr>

				<c:choose>
					<c:when test="${not empty questionList }">

						<c:forEach var="questionList" items="${questionList}">
							<input type="hidden" name="user_number" id="user_number"
								value="${questionList.user_number }">
							<tr align="center">
								<td><a
									href="/question/questiondetail/${questionList.question_number}?user_number=${questionList.user_number}">${questionList.question_number}</a></td>
								<td><a
									href="/question/questiondetail/${questionList.question_number}">${questionList.question_title}</a></td>
								<td><a
									href="/question/questiondetail/${questionList.question_number}">${questionList.question_regdate}</a></td>



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
</body>
</html>