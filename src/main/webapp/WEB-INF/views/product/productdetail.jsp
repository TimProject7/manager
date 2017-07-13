<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#salesBtn").click(function() {

			// 폼 내부의 데이터를 전송할 주소
			document.form1.action = "/admin/product/productsalesmanagement"
			// 제출
			document.form1.submit();
		});

	});
</script>
<link rel="stylesheet" href="/admin/resources/css/style.css">
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<br>
	<h2>상품 상세정보</h2>
	<p align="center">
		<a href="/admin/product/productlist"><button>상품목록</button></a>
	</p>

	<form id="form1" name="form1" method="post">
		<input type="hidden" id="product_number" name="product_number"
			value="${productDetail.product_number }"> <input
			type="hidden" id="product_status" name="product_status"
			value="${productDetail.product_status }">
		<table border="1">
			<tr>
				<td><img
					src="/admin/resources/images/${productDetail.product_image}"
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
							<td>판매상태</tb>
							<td colspan="3"><c:choose>

									<c:when test="${productDetail.product_status == 'Y' }">
										<font style="color: black;">판매중</font>
									</c:when>
									<c:otherwise>
										<font style="color: red;">판매중지</font>
									</c:otherwise>
								</c:choose></td>
						</tr>
						<tr align="center">
							<td>상품소개</td>
							<td colspan="3">${productDetail.product_content}</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<c:if test="${productDetail.product_status != 'Y' }">
			<%-- <a href="/admin/product/productedit/${productDetail.product_number }">
				수정</a> --%>
		</c:if>
		<p align="center">
			<button id="salesBtn">
				<c:choose>

					<c:when test="${productDetail.product_status == 'Y' }">

						<font style="color: red;">판매중지</font>
					</c:when>
					<c:otherwise>
						<font style="color: black;">판매</font>
					</c:otherwise>
				</c:choose>
			</button>
		</p>
		<br>
		<hr>
		<br>
		<c:choose>

			<c:when test="${not empty ProductQnaList }">

				<table border="1">
					<tr align="center">
						<td>QNA 번호</td>
						<td>카테고리</td>
						<td>제목</td>
						<td>회원명</td>
						<td>작성일</td>
						<td>답변상태</td>
					</tr>
					<c:forEach var="ProductQnaList" items="${ProductQnaList}">
						<tr align="center">

							<td id="center">${ProductQnaList.productQna_number}</td>

							<td>${ProductQnaList.productQna_type}</td>
							<td id="title"><a
								href="/admin/product/productQnaDetail/${ProductQnaList.productQna_number}">${ProductQnaList.productQna_content}</a></td>
							<td id="writer">${ProductQnaList.productQna_name}</td>
							<td id="center">${ProductQnaList.productQna_writedate}</td>
							<td id="center">${ProductQnaList.productQna_status}</td>
						</tr>



					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
				<div align="center">
					<table>
						<tr align="center">
							<td>등록된 게시물이 존재하지않습니다.</td>
						</tr>
					</table>
				</div>
			</c:otherwise>

		</c:choose>

	</form>
</body>
</html>