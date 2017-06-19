<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#addBtn").click(function() {

			// 폼 내부의 데이터를 전송할 주소
			document.form2.action = "/product/productinsert"
			// 제출
			document.form2.submit();
		});
	});
</script>
<title>상품 목록</title>

</head>

<body>
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
	<form id="form2" name="form2" method="post">
		<input type="hidden" value="${sessionScope.avo.admin_id }">

		<h2>상품목록</h2>
		<table border="1">
			<tr>
				<th>상품 이미지</th>
				<td colspan="3"><input type="text" id="product_image"
					name="product_image"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td colspan="3"><input type="text" id="product_name"
					name="product_name"></td>
			</tr>

			<tr>
				<th>상품 가격</th>
				<td colspan="3"><input type="number" id="product_price"
					name="product_price"></td>
			</tr>
			<tr>
				<th>제조사</th>
				<td><input type="text" value="페카" id="product_company"
					name="product_company"></td>
				<th>원산지</th>
				<td><input type="text" value="미국" id="product_origin"
					name="product_origin"></td>
			</tr>
			<tr>
				<th>상품 상세설명</th>
				<td colspan="3"><textarea id="product_content"
						name="product_content"></textarea></td>
			</tr>
		</table>
		<button type="button" id="addBtn" name="addBtn">등록</button>
		<a href="/product/productlist"><button type="button" id="listBtn"
				name="listBtn">목록</button></a>
	</form>
</body>
</html>