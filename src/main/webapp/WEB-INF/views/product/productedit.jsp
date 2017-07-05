<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#regBtn").click(function() {

			// 폼 내부의 데이터를 전송할 주소
			document.form.action = "/admin/product/productdelete"
			// 제출
			document.form.submit();
		});
	});
</script>
</head>
<body>
	<%@include file="../include/header.jsp"%>

	<h2>상품 상세정보</h2>
	<a href="/product/productlist"><button>상품목록</button></a>
	<form id="form" name="form">
		<input type="hidden" id="product_number" name="product_number"
			value="${productDetail.product_number }">
		<table border="1">
			<tr>
				<td><img src="/resources/images/${productDetail.product_image}"
					width="340" height="300"></td>
				<td>
					<table border="1" style="height: 300px; width: 400px;">
						<tr align="center">
							<td>상품명</td>
							<td colspan="3">${productDetail.product_name}</td>
						</tr>
						<tr align="center">
							<td>가격</td>
							<td colspan="3"><fmt:formatNumber
									value="${productDetail.product_price}" pattern="###,###,###" /></td>
						</tr>
						<tr align="center">
							<td width="25%">제조사</td>
							<td width="25%">${productDetail.product_company }</td>
							<td width="25%">원산지</td>
							<td width="25%">${productDetail.product_origin }</td>

						</tr>
						<tr align="center">
							<td>상품소개</td>
							<td colspan="3">${productDetail.product_content}</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<button id=regBtn>수정</button>
		<a href="/admin/product/productlist"><button>목록</button></a>


	</form>
</body>
</html>