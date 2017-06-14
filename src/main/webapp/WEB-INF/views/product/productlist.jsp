<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	
</script>

<title>상품 목록</title>

</head>
<body>

	<h2>상품목록</h2>
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
		<c:forEach var="productList" items="${productList}">
			<tr>
				<td>${productList.product_number}</td>
				<td><a
					href="${path}/product/detail/${productList.product_number}"> <img
						src="${path}/images/${row.product_image}" width="120px"
						height="110px">
				</a></td>
				<td><a
					href="${path}/productdetail/${productList.product_number}">${productList.product_name}</a>
				</td>
				<td>${productList.product_company }</td>
				<td>${productList.product_origin }</td>
				<td>${productList.product_addDate }</td>
				<td><fmt:formatNumber value="${productList.product_	price}"
						pattern="###,###,###" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>