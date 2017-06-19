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
<title>FAQ 글 리스트</title>



<script>
	$(document).ready(function() {
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "/faq/FAQ_write";
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

	<h2>게시글 목록</h2>
	<button type="button" id="btnWrite">글쓰기</button>
	<table border="1" width="600px">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${faq_list == null}">

				<tr>
					<td colspan="5">등록된 FAQ가 없다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="row" items="${faq_list}">
					<tr>
						<td>${row.faq_no}</td>
						<td><a href="FAQ_view?faq_no=${row.faq_no}">${row.faq_title}</a></td>
						<td>${row.faq_writer}</td>
						<td>
							<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 --> <fmt:formatDate
								value="${row.faq_regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
						</td>
						<td>${row.faq_viewcnt}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

</body>
</html>