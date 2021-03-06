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
<script type="text/javascript" src="/admin/resources/js/common.js"></script>
<meta http-equiv="Content_Type" content="text/html; charset=UTF-8">
<title>FAQ 글 리스트</title>



<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "/admin/faq/FAQwrite";
		});
	});
</script>

<link rel="stylesheet" href="/admin/resources/css/style.css">
</style>
</head>
<body>

	<div style="width: 60%;"">

		<%@include file="../include/header.jsp"%>
		<br> <br>

		<h2>FAQ 게시글 목록</h2>

		<br>

		<%@ include file="../include/boardheader.jsp"%>


		<table border="1" width="100%;">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${ empty faqlist}">

					<tr>
						<td colspan="5">등록된 FAQ가 없다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="row" items="${faqlist}">
						<tr>
							<td class="no">${row.faq_no}</td>
							<td style="width: 50%;"><a
								href="FAQview?faq_no=${row.faq_no}">${row.faq_title}</a></td>
							<td style="width: 9%;">${row.faq_writer}</td>
							<td style="width: 25;%;">
								<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
									value="${row.faq_regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td class="no" style="width: 8%;">${row.faq_viewcnt}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td style="width: 8%;"><button type="button" id="btnWrite"
						style="width: 100%;">글쓰기</button></td>
			</tr>
		</table>

	</div>
</body>
</html>