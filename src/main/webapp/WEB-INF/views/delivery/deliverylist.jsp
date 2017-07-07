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
		if ($("#msg") == "false1") {
			alert("배송상태가 취소가 아닌 상품이 선택되어 있습니다.");
		}
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

		//선택삭제 할때 아무것도 선택이안됬을시
		$("#deleteBtn")
				.click(

						function(e) {
							e.preventDefault();
							var chk = new Array();

							if ($(":checkbox[name='chk']:checked").length == 0) {
								alert("삭제할 항목을 하나이상 체크해주세요.");
								return;
							} else {

								if (confirm("정말 삭제하시겠습니까??") == true) {
									if ($(":checkbox[name=chk]:checked").val()) {

										/* 
															 $("#listForm").attr("method", "POST");

															 $("#listForm").attr("action",
															 "/admin/delivery/deliverydelete");
															 $("#listForm").submit();
										 */
										$
												.ajax({
													url : "/admin/delivery/deliverydelete", //전송url
													type : "POST", //전송방식
													data : $("#listForm")
															.serialize(),
													error : function(result) {
														alert('시스템오류')
													},
													success : function(result) {
														if (result == 0) {
															alert('배송상태를 확인해주세요.')

															$("#product_price")
																	.select();
														} else if (result == 1) {
															alert('삭제가 완료되었습니다.');
															location.href = "/admin/delivery/deliverylist";
														}
													}
												});
									} else {

									}

								} else {
									alert("삭제가 취소되었습니다.");
								}

							}
						});

		$("#deliveryBtn")
				.click(

						function(e) {
							e.preventDefault();
							var chk = new Array();

							if ($(":checkbox[name='chk']:checked").length == 0) {
								alert("배송할 항목을 하나이상 체크해주세요.");
								return;
							} else {

								if (confirm("배송상태를 배송중으로 바꾸시겠습니까?") == true) {
									if ($(":checkbox[name=chk]:checked").val()) {

										/* 
															 $("#listForm").attr("method", "POST");

															 $("#listForm").attr("action",
															 "/admin/delivery/deliverydelete");
															 $("#listForm").submit();
										 */
										$
												.ajax({
													url : "/admin/delivery/delivery", //전송url
													type : "POST", //전송방식
													data : $("#listForm")
															.serialize(),
													error : function(result) {
														alert('시스템오류')
													},
													success : function(result) {
														if (result == 0) {
															alert('배송상태를 확인해주세요.')

														} else if (result == 1) {
															alert('배송중으로 상태가 바뀌었습니다.');
															location.href = "/admin/delivery/deliverylist";

														}
													}
												});
									} else {

									}

								} else {
									alert("배송상태 변경이 취소되었습니다.");
								}

							}
						});
		//체크박스 전체선택 
		$("#checkAll").click(function() {
			//클릭되었으면

			if ($("#chk").is(":checked")) {
				$("input[name=chk]").prop("checked", false);
			} else {
				$("input[name=chk]").prop("checked", true);
			}

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

		<input type="hidden" name="msg" id="msg" value="${msg }">
		<form id="listForm" name="listForm">
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
								<td><input type="button" id="checkAll" name="checkAll"
									value="전체선택"></td>
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
											<td><input type="checkbox" id="chk" name="chk"
												value="${deliveryList.buy_number }"></td>
											<td>${deliveryList.user_number }</td>
											<td>${deliveryList.buy_product }</td>
											<td>${deliveryList.buy_image }</td>
											<td>${deliveryList.buy_price }</td>
											<td>${deliveryList.buy_quantity }</td>
											<td>${deliveryList.buy_day }</td>
											<td>${deliveryList.buy_address}</td>
											<td>${deliveryList.buy_status }<input type="hidden"
												name="buy_status" id="buy_status"
												value="${deliveryList.buy_status }"></td>

										</tr>
									</c:forEach>
									<tr>
										<td><button type="button" name="deleteBtn" id="deleteBtn">선택
												삭제</button>
											<button type="button" name="deliveryBtn" id="deliveryBtn">선택
												배송</button></td>
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
		</form>
	</div>

</body>
</html>