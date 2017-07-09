<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/admin/resources/js/common.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#addBtn").click(function() {
					var productName = $("#product_name").val();
					var productPrice = $("#product_price").val();
					var productContent = $("#product_content").val();
					var productImage = $("#product_photo").val();

					if (productName == "") {
						alert("상품명을 입력해주세요");
						productName.foucs();
						return;
					} else if (productPrice == "") {
						alert("상품 가격을 입력해주세요");
						productPrice.focus();
						return;
					} else if (productContent == "") {
						alert("상품 설명을 입력해주세요");
						productContent.focus();
						return;
					} else if (productImage == "") {
						alert("상품 사진을 입력해주세요");
						productImage.focus();
						return;
					} else {
						// 폼 내부의 데이터를 전송할 주소
						document.form.action = "/admin/product/productinsert"
						// 제출
						document.form.submit();
					}
				});
				$("#product_name_chk").click(
						function() {
							if (!chkSubmit($("#product_name"))) {
								return;
							} else {
								$.ajax({
									url : "/admin/product/productNameChk", //전송url
									type : "POST", //전송방식
									data : $("#product_name").serialize(),
									error : function(result) {
										alert('시스템오류')
									},
									success : function(result) {
										if (result == 0) {
											alert('사용가능한 상품명입니다')
											$("#msg").text("사용가능한 상품명입니다").css(
													"color", "blue");
											$("#product_price").select();
										} else if (result == 1) {
											$("#msg").text("중복된 상품명입니다").css(
													"color", "red");
											$("#product_name").select();
											alert('이미사용한 상품명입니다');
										}
									}
								});
							}
						})

			});
</script>
<title>상품 목록</title>
<link rel="stylesheet" href="/admin/resources/css/style.css">
</head>

<body>
	<%@include file="../include/header.jsp"%>
	<form id="form" name="form" enctype="multipart/form-data" method="post">
		<input type="hidden" id="admin_number" name="admin_number"
			value="${sessionScope.avo.admin_number }">

		<h2>상품목록</h2>
		<table border="1">
			<tr>
				<th>상품 이미지</th>
				<td colspan="3"><input type="file" id="product_photo"
					name="product_photo"></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td colspan="3"><input type="text" id="product_name"
					name="product_name">
					<button type="button" id="product_name_chk" name="product_name_chk">중복확인</button>
					<span id="msg"></span></td>
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
		<a href="/admin/product/productlist"><button type="button"
				id="listBtn" name="listBtn">목록</button></a>
	</form>
</body>
</html>