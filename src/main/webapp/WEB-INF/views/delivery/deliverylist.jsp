<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {

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
			"action" : "/admin/delivery/deliverylist"
		});
		$("#f_search").submit();

	}
</script>
<meta http-equiv="Content_Type" content="text/html; charset=UTF-8">
<title>배송관리</title>


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
	padding: 2px;
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
		<!-- 페이지 넘버 -->
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <input
				type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />
		</form>



		<div id="container">
			<ul class="tabs">
				<li class="active" rel="tab1">전체</li>
				<li rel="tab2">배송전</li>
				<li rel="tab3">배송중</li>
				<li rel="tab4">배송완료</li>
			</ul>
			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<table border="1">
						<tr>
							<td></td>
							<td>회원번호</td>
							<td>상품명</td>
							<td>상품이미지</td>
							<td>가격</td>
							<td>수량</td>
							<td>구매신청일</td>
							<td>배송지</td>
							<td>배송상태</td>

						</tr>
						<c:choose>
							<c:when test="${not empty deliveryList}">
								<c:forEach var="deliveryList" items="${deliveryList }">
									<tr>
										<td><input type="checkbox" id="chk" name="chk"></td>
										<td>${deliveryList.user_number }</td>
										<td>${deliveryList.buy_product }</td>
										<td>${deliveryList.buy_image }</td>
										<td>${deliveryList.buy_price }</td>
										<td>${deliveryList.buy_quantity }</td>
										<td>${deliveryList.buy_day }</td>
										<td>${deliveryList.buy_address}</td>
										<td>${deliveryList.buy_status }</td>
									</tr>
								</c:forEach>
								<tr>
									<td><button type="button" name="deleteBtn" id="deleteBtn">선택
											삭제</button></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="9">등록된 배송요청이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
				<div id="buyListPage" align="center">
					<tag:paging page="${param.page}" total="${total}"
						list_size="${data.pageSize}" />
				</div>

				<br>

				<!-- #tab1 -->
			</div>
			<!-- .tab_container -->
		</div>
		<!-- #container -->

	</div>
</body>
</html>