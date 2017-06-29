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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if (msg == true) {
			alter("답변 등록되었습니다.");
		} else if (msg == false) {
			alter("답변 등록에 실패했습니다.")
		} else if (msg == null) {

		} else {
			alter("시스템오류")
		}
	});
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>

	<%@ include file="../include/boardheader.jsp"%>
	<form>
		<div align="center">
			<table border="1">
				<tr>
					<Th>문의번호</Th>
					<Th>제목</Th>
					<Th>등록일자</Th>
					<th>답변여부</th>

				</tr>

				<c:choose>
					<c:when test="${not empty questionList }">

						<c:forEach var="questionList" items="${questionList}">

							<tr align="center">
								<td><a
									href="/admin/question/questiondetail/${questionList.question_number}?usernumber=${questionList.user_number}">${questionList.question_number}</a></td>
								<td><a
									href="/admin/question/questiondetail/${questionList.question_number}?usernumber=${questionList.user_number}">${questionList.question_title}</a></td>
								<td><a
									href="/admin/question/questiondetail/${questionList.question_number}?usernumber=${questionList.user_number}">${questionList.question_writedate}</a></td>
								<td><a
									href="/admin/question/questiondetail/${questionList.question_number}?usernumber=${questionList.user_number}"><c:choose>
											<c:when test="${questionList.question_status == 'N' }">
												<font style="color: red">답변중</font>

											</c:when>
											<c:otherwise>

												<font style="color: black;">답변완료</font>
											</c:otherwise>
										</c:choose> </a></td>
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