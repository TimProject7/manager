<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 목록</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
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
	<h2>상품목록</h2>


	<form>
		<table border="1">
			<tr>
				<th>상품번호</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>제조사</th>
				<th>원산지</th>
				<th>등록일자</th>
				<th>가격</th>
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
							<td>${productList.product_number}</td>
							<td><a href="productdetail/${productList.product_number}">
									<img src="/images/${productList.product_image}" width="120px"
									height="110px">
							</a></td>
							<td><a href="productdetail/${productList.product_number}">${productList.product_name}</a>
							</td>
							<td>${productList.product_company}</td>
							<td>${productList.product_origin}</td>
							<td>${productList.product_regdate}</td>
							<td><fmt:formatNumber value="${productList.product_price}"
									pattern="###,###,###" />원</td>

						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>


</body>
</html>