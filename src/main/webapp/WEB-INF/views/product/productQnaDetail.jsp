<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품QnA 상세보기</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//수정
		$("#productQnaReplyBtn").click(function() {
			$("#form").attr({
				"method" : "POST",
				"action" : "/admin/product/productqnareply"
			});
			$("form").submit();
		})
	})
</script>
</head>
<body>
	<div align="center">
		<%@include file="../include/header.jsp"%>
		<br>
		<h2>상품Q&A 상세보기</h2>
	</div>

	<input type="hidden" id="productQna_number" name="productQna_number"
		value="${productQnaDetail.productQna_number}">

	<table border="1">
		<tr>
			<td>작성자</td>
			<td><input type="text" readonly="readonly"
				value="${productQnaDetail.user_id}" /></td>
			<td>작성일</td>
			<td><input type="text" id="productQna_writedate"
				name="productQna_writedate"
				value="${productQnaDetail.productQna_writedate}" /></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><input type="text" id="productQna_content"
				name="productQna_content"
				value="${productQnaDetail.productQna_content}" /></td>
		</tr>

	</table>


	<c:choose>

		<c:when test="${not empty productQnaReplyDetail }">
			<table>
				<tr>
					<td>안녕하세요. ${productQnaDetail.productQna_name }님</td>
					<td>${productQnaReplyDetail.productQnaReply_writedate}</td>
				</tr>
				<tr>
					<td colspan="2">${productQnaReplyDetail.productQnaReply_content}</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			<form name="form" id="form">
				<input type="hidden" name="productQna_number" id="productQna_number"
					value="${productQnaDetail.productQna_number }"> <input
					type="hidden" name="admin_number" id="admin_number"
					value="${sessionScope.avo.admin_number }"> <input
					type="hidden" id="user_number" name="user_number"
					value="${productQnaDetail.user_number}"> <input
					type="hidden" id="product_number" name="product_number"
					value="${productQnaDetail.product_number }">
				<table>
					<tr align="center">
						<td>답변작성</td>
					</tr>
					<tr align="center">

						<td><textarea id="productQnaReply_content"
								name="productQnaReply_content"></textarea></td>
					</tr>
				</table>
				<button type="button" id="productQnaReplyBtn"
					name="productQnaReplyBtn">등록</button>
			</form>
		</c:otherwise>

	</c:choose>


</body>
</html>