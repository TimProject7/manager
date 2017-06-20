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
	<h2>상품 상세정보</h2>
	<a href="/product/productlist"><button>상품목록</button></a>
	<table border="1">
		<tr>
			<td><img src="images/${productDetail.product_image}" width="340"
				height="300"></td>
			<td>
				<table border="1" style="height: 300px; width: 400px;">
					<tr align="center">
						<td>상품명</td>
						<td>${productDetail.product_name}</td>
					</tr>
					<tr align="center">
						<td>가격</td>
						<td><fmt:formatNumber value="${productDetail.product_price}"
								pattern="###,###,###" /></td>
					</tr>
					<tr align="center">
						<td>상품소개</td>
						<td>${productDetail.product_content}</td>
					</tr>



				</table>
			</td>
		</tr>
	</table>

</body>
</html>