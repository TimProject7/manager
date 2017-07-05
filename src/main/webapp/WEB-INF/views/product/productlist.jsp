<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#deleteBtn").click(function() {

			// 폼 내부의 데이터를 전송할 주소
			document.form.action = "/product/productdelete"
			// 제출
			document.form.submit();
		});
		$("#editBtn").click(function() {
			// 폼 내부의 데이터를 전송할 주소
			document.form.action = "/product/productedit"
			// 제출
			document.form.submit();

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
			"action" : "/admin/product/productlist"
		});
		$("#f_search").submit();

	}
</script>

<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

a:HOVER {
	font-size: 1.1em;
	color: teal;
}

a {
	text-decoration: none;
	color: black;
}

h2 {
	text-align: center;
}

.div1 {
	width: 43%;
}

th {
	color: white;
	background-color: black;
}

td {
	text-align: center;
}
</style>

</head>
<body>

	<div class="div1">

		<%@include file="../include/header.jsp"%>
		<h2>상품목록</h2>
		<a href="/admin/product/productwrite"><button>상품등록</button></a>
		<!-- 페이지 넘버 -->
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <input
				type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />
		</form>

		<form id="form" name="form">
			<table border="1" style="width: 660px;">
				<tr>
					<th>상품번호</th>
					<th>상품이미지</th>
					<th>상품명</th>
					<th>제조사</th>
					<th>원산지</th>
					<th>등록일자</th>
					<th>가격</th>
					<th>상태</th>
				</tr>

				<c:choose>
					<c:when test="${empty productList }">
						<tr>
							<td colspan="7" align="center">등록된 상품이 없습니다.</td>
						</tr>

					</c:when>
					<c:otherwise>

						<c:forEach var="productList" items="${productList}">
							<tr>
								<td class="no"><a
									href="productdetail/${productList.product_number}">${productList.product_number}</a></td>
								<td><a href="productdetail/${productList.product_number}">
										<img src="/resources/images/${productList.product_image}"
										width="120px" height="110px">
								</a></td>
								<td><a href="productdetail/${productList.product_number}">${productList.product_name}</a>
								</td>
								<td>${productList.product_company}</td>
								<td>${productList.product_origin}</td>
								<td>${productList.product_regdate}</td>
								<td><fmt:formatNumber value="${productList.product_price}"
										pattern="###,###,###" />원</td>
								<td><c:choose>

										<c:when test="${productList.product_status == 'Y' }">
											<font style="color: black;">판매중</font>
										</c:when>
										<c:otherwise>
											<font style="color: red;">판매중지</font>
										</c:otherwise>

									</c:choose></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</form>

	</div>
	<!-- 페이지출력 -->
	<div id="buyListPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div>



</body>
</html>