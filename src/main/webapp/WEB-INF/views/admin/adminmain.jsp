<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="/resources/css/adminmain.css" />
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

.btn {
	border: 0px solid #7eb9d0;
	-webkit-box-shadow: #B4B5B5 5px 5px 5px;
	-moz-box-shadow: #B4B5B5 5px 5px 5px;
	box-shadow: #B4B5B5 5px 5px 5px;
	-webkit-border-radius: 18px;
	-moz-border-radius: 18px;
	border-radius: 18px;
	font-size: 77px;
	font-family: impact, sans-serif;
	padding: 11px 11px 11px 11px;
	text-decoration: none;
	display: inline-block;
	text-shadow: 4px 4px 0 rgba(0, 0, 0, 0.3);
	font-weight: bold;
	color: #FFFFFF;
	background-color: #a7cfdf;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#a7cfdf),
		to(#23538a));
	background-image: -webkit-linear-gradient(top, #a7cfdf, #23538a);
	background-image: -moz-linear-gradient(top, #a7cfdf, #23538a);
	background-image: -ms-linear-gradient(top, #a7cfdf, #23538a);
	background-image: -o-linear-gradient(top, #a7cfdf, #23538a);
	background-image: linear-gradient(to bottom, #a7cfdf, #23538a);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
		startColorstr=#a7cfdf, endColorstr=#23538a);
	width: 100%;
	height: 335px;
}

.btn:hover {
	border: 0px solid #5ca6c4;
	background-color: #82bbd1;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#82bbd1),
		to(#193b61));
	background-image: -webkit-linear-gradient(top, #82bbd1, #193b61);
	background-image: -moz-linear-gradient(top, #82bbd1, #193b61);
	background-image: -ms-linear-gradient(top, #82bbd1, #193b61);
	background-image: -o-linear-gradient(top, #82bbd1, #193b61);
	background-image: linear-gradient(to bottom, #82bbd1, #193b61);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
		startColorstr=#82bbd1, endColorstr=#193b61);
}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <script src="/resources/js/tab.js"></script> -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 탭(ul) onoff
						$('.jq_tabonoff>.jq_cont').children().css('display',
								'none');
						$('.jq_tabonoff>.jq_cont div:first-child').css(
								'display', 'block');
						$('.jq_tabonoff>.jq_tab li:first-child').addClass('on');
						$('.jq_tabonoff')
								.delegate(
										'.jq_tab>li',
										'click',
										function() {
											var index = $(this).parent()
													.children().index(this);
											$(this).siblings().removeClass();
											$(this).addClass('on');
											$(this).parent().next('.jq_cont')
													.children().hide()
													.eq(index).show();
										});

						$("#btn_board_main").click(function() {
							$("#adminmain").attr({
								"action" : "/faq/FAQ_list"
							});

							$("#adminmain").submit();
						})

					});
</script>
</head>
<body>

	<c:choose>
		<c:when test="${not empty sessionScope.avo }">
			<table class="logout_table">
				<tr>
					<td>${sessionScope.avo.admin_id }님로그인하셨습니다.반갑습니다.</td>

					<td><a href="logout"><button>로그아웃</button> </a></td>
				</tr>
			</table>
			<br>
			<br>
			<form id="adminmain">

				<table style="width: 96%;">
					<tr>
						<td style="width: 50%"><button class="btn"
								id="btn_product_main">상품관리</button></td>
						<td><button class="btn" id="btn_users_main">회원관리</button></td>
					</tr>

					<tr>
						<td><button class="btn" id="btn_board_main">게시판 관리</button></td>
						<td><button class="btn" id="btn_statistics_main">통계</button></td>
					</tr>

				</table>
			</form>

		</c:when>
		<c:when test="${empty sessionScope.avo }">
			<script type="text/javascript">
				self.location = "/"
			</script>
		</c:when>
	</c:choose>

</body>
</html>