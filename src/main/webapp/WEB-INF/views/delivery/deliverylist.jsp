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
<script type="text/javascript" src="/admin/resources/js/common.js"></script>
<script type="text/javascript">
	$(function() {

		if ('${param.delivery}' == '전체') {
			$("input[id=delivery_all]").prop("checked", true);
		} else if ('${param.delivery}' == '배송전') {
			$("input[id=delivery_before]").prop("checked", true);
		} else if ('${param.delivery}' == '배송중') {
			$("input[id=delivering]").prop("checked", true);
		} else if ('${param.delivery}' == '배송완료') {
			$("input[id=delivery_completed]").prop("checked", true);
		}

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
															$("input[name=chk]")
																	.prop(
																			"checked",
																			false);

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
									$("input[name=chk]").prop("checked", false);
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
		//When page loads...
		$(".tab_content").hide(); //Hide all content
		$("ul.tabs li:first").addClass("active").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content

		//On Click Event
		$("ul.tabs li").click(function() {

			$("ul.tabs li").removeClass("active"); //Remove any "active" class
			$(this).addClass("active"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content

			var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active ID content
			return false;
		});

		// 리스트 전체
		$("#delivery_all").click(function() {
			$("#delivery_all").val()

			goPage(1)
		})

		// 배송전
		$("#delivery_before").click(function() {
			$("#delivery_before").val()

			goPage(1)
		})
		// 배송중
		$("#delivering").click(function() {
			$("#delivering").val()

			goPage(1)
		})

		$("#delivery_completed").click(function() {
			$("#delivery_completed").val()

			goPage(1)
		})

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
body {
	font-family: "Malgun Gothic";
	font-size: 0.8em;
}
/*TAB CSS*/
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	border: 1px solid #fff;
	outline: none;
}

ul.tabs li a:hover {
	background: #ccc;
}

html ul.tabs li.active, html ul.tabs li.active a:hover {
	/*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	/*--Makes the active tab look like it's connected with its content--*/
	border-bottom: 1px solid #fff;
}

/*Tab Conent CSS*/
.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
}

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}
</style>




</head>
<body>

	<div class="div1" align="center">
		<%@include file="../include/header.jsp"%>

		<h2>배송목록</h2>

		<!-- 페이지 넘버 -->
		<form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <input
				type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />

			<label for="delivery_all">전체<input type="radio"
				id="delivery_all" name="delivery" value="전체"></label> <label
				for="delivery_before">배송전<input type="radio"
				id="delivery_before" name="delivery" value="배송전"></label> <label
				for="delivering">배송중<input type="radio" id="delivering"
				name="delivery" value="배송중"></label><label for="delivery_completed">배송완료<input
				type="radio" id="delivery_completed" name="delivery" value="배송완료"></label>
			<!--검색-->
			<table summary="검색" style="width: 1100px;">
				<tr align="left">
					<td width="300px"><select name="search" id="search">

							<option value="all">전체</option>
							<option value="user_name">회원명</option>

					</select> <input type="text" name="keyword" id="keyword"
						placeholder="검색어를 입력하세요" value="" /> <input type="button"
						value="검색" id="searchData"></td>
				</tr>
			</table>
		</form>
		<input type="hidden" name="msg" id="msg" value="${msg }">
		<form id="listForm" name="listForm">
			<table border="1" style="width: 1100px;">
				<tr align="center">
					<td><input type="button" id="checkAll" name="checkAll"
						value="전체선택"></td>
					<th style="width: 7%;">배송번호</th>
					<th style="width: 8%;">상품이미지</th>
					<th style="width: 7%;">회원명</th>
					<th style="width: 7%;">상품명</th>
					<th style="width: 7%;">가격</th>
					<th style="width: 7%;">수량</th>
					<th style="width: 8%;">구매신청일</th>
					<th style="width: 40%;">배송지</th>
					<th style="width: 7%;">배송상태</th>
				</tr>
				<c:choose>
					<c:when test="${not empty deliveryList}">
						<c:forEach var="deliveryList" items="${deliveryList }">

							<tr align="center">
								<td><input type="checkbox" id="chk" name="chk"
									value="${deliveryList.buy_number }"></td>
								<td>${deliveryList.buy_number }</td>
								<td><img
									src="/admin/resources/images/${deliveryList.buy_image}"
									width="100" height="100" /></td>
								<td>${deliveryList.user_name }</td>
								<td>${deliveryList.buy_product }</td>
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
							<td colspan="10"><button type="button" name="deleteBtn"
									id="deleteBtn">선택 삭제</button>
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

			<div id="buyListPage" align="center">
				<tag:paging page="${param.page}" total="${total}"
					list_size="${data.pageSize}" />
			</div>

			<br>


		</form>
	</div>

</body>
</html>