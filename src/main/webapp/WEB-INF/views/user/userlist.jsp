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
<title>회원 목록</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/admin/resources/js/common.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
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
			"action" : "/admin/user/userlist"
		});
		$("#f_search").submit();

	}
</script>
<link rel="stylesheet" href="/admin/resources/css/style.css">
</head>
<body>
	<div class="div1">
		<%@include file="../include/header.jsp"%>
		<br> <br>


		<h2>회원 목록</h2>

		<br>
		<!-- 페이지 넘버 -->
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <input
				type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />
			<!--검색-->
			<table summary="검색">
				<tr>
					<td width="300px"><select name="search" id="search">

							<option value="all">전체</option>
							<option value="user_name">회원명</option>
					</select> <input type="text" name="keyword" id="keyword"
						placeholder="검색어를 입력하세요" value="" /> <input type="button"
						value="검색" id="searchData"></td>
				</tr>
			</table>
		</form>

		<form name="form" id="form">
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
	<!-- 페이지출력 -->
	<div id="buyListPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>

</body>
</html>