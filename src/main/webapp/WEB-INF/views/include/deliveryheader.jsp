<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {

		$(".tab_content").hide();
		$(".tab_content:first").show();

		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#333");
			//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			$(this).addClass("active").css("color", "darkred");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
	});
</script>
<style type="text/css">
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #eee;
	border-left: 1px solid #eee;
	width: 100%;
	font-family: "dotum";
	font-size: 12px;
}
</style>
</head>
<body>
	<div id="container">
		<ul class="tabs">
			<li class="active" rel="tab1">전체</li>
			<li rel="tab2">배송전</li>
			<li rel="tab3">배송중</li>
			<li rel="tab4">배송완료</li>
		</ul>
		<div class="tab_container">
			<div id="tab1" class="tab_content"></div>
			<!-- #tab1 -->
			<div id="tab2" class="tab_content"></div>
			<!-- #tab2 -->
			<div id="tab3" class="tab_content"></div>
			<!-- #tab3 -->
		</div>
		<!-- .tab_container -->
	</div>
	<!-- #container -->
</body>
</html>