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
<meta http-equiv="Content_Type" content="text/html; charset=UTF-8">
<title>Notice 글 리스트</title>

<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "/notice/noticewrite";
		});
	});
</script>


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

		<h2>Notice 게시글 목록</h2>

		<br>

		<%@ include file="../include/boardheader.jsp"%>

		<table border="1" width="660px">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${Notice_list == null}">

					<tr>
						<td colspan="5">등록된 Notice가 없다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="row" items="${Notice_list}">
						<tr>
							<td class="no">${row.notice_no}</td>
							<td style="width: 50%;"><a
								href="noticeview?notice_no=${row.notice_no}">${row.notice_title}</a></td>
							<td style="width: 9%;">${row.notice_writer}</td>
							<td style="width: 25%;">
								<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
									value="${row.notice_regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
							<td class="no" style="width: 8%;">${row.notice_viewcnt}</td>
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