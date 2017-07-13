<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/admin/resources/js/common.js"></script>
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
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "/admin/notice/noticewrite";
		});
		/* 검색후 검색 대상과 검색단어 출력 */
		if ("<c:out value='${data.keyword}'/>" != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
		}
		/* /* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});
		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("글 목록 전체");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
			;
		});

		//검색버튼
		$("#searchData").click(function() {
			//검색조건이 전체가 아닐시 키워드로 검색
			if ($("#search").val() == "all") {
				$("#keyword").val("");
			} else {
				if (!chkSubmit($('#keyword'), "검색어를")) {
					return;
				}
			}
			goPage(1);
		});

	});
	//검색한페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/question/questionlist"
		});
		$("#f_search").submit();

	}
</script>
<link rel="stylesheet" href="/admin/resources/css/style.css">
</head>
<body>
	<div style="width: 60%;">
		<%@include file="../include/header.jsp"%>
		<br> <br>


		<h2>1:1문의 게시글 목록</h2>

		<br>
		<%@ include file="../include/boardheader.jsp"%>

		<!-- 페이지 넘버 -->
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <input
				type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />
		</form>

		<form>
			<div align="center">
				<table border="1" style="width: 100%;">
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
													<font style="color: red">답변대기</font>

												</c:when>
												<c:when test="${questionList.question_status == 'Y' }">
													<font style="color: black;">답변완료</font>
												</c:when>
												<c:otherwise>


												</c:otherwise>
											</c:choose> </a></td>
								</tr>

							</c:forEach>

						</c:when>
						<c:otherwise>
							<td colspan="4">등록된 회원이 없습니다.</td>
						</c:otherwise>
					</c:choose>

				</table>
			</div>
		</form>
	</div>

	<!-- 페이지출력 -->
	<div id="buyListPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>

</body>

</html>