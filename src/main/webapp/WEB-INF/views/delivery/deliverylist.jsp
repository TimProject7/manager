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
<script type="text/javascript">
	$(function() {

		$(".tab_content").hide();
		$(".tab_content:first").show();

		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#333");
			//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			$(this).addClass("active").css("color", "darkred");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
	});
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
				<!-- #tab1 -->
				<div id="tab2" class="tab_content">
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
									<c:if test="${deliveryList.buy_status == '배송전' }">
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
									</c:if>
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
				<!-- #tab2 -->
				<div id="tab3" class="tab_content">
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
									<c:if test="${deliveryList.buy_status == '배송중' }">
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
									</c:if>
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
				<!-- #tab3 -->

				<div id="tab4" class="tab_content">
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
									<c:if test="${deliveryList.buy_status == '배송완료' }">
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
									</c:if>
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
				<!-- #tab4 -->
			</div>
			<!-- .tab_container -->
		</div>
		<!-- #container -->

	</div>
</body>
</html>