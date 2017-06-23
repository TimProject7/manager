<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		function combobox(combo) {
			alert(combo.value + "전원욱 쩔었다");
		}
	});
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

		<c:choose>
			<c:when test="${not empty sessionScope.avo }">
				<%@include file="../include/header.jsp"%>
				<BR>



			</c:when>
			<c:otherwise>
				<script type="text/javascript">
					self.location = "/"
				</script>
			</c:otherwise>
		</c:choose>
		<h2>상품목록</h2>
		<select name="select" onchange="javascript:combobox(this)">
			<option value="menu1" selected="selected">메뉴1</option>
			<option value="menu2">메뉴2</option>
			<option value="menu3">메뉴3</option>
		</select> <a href="/product/productwrite"><button>상품등록</button></a>
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
					<c:when test="${productList==null }">
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
								<td> <c:choose>

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


</body>
</html>