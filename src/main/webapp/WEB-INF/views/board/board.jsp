<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/tab_board.js"></script>
<link type="text/css" rel="stylesheet"
	href="/resources/css/board.css" />
</head>
<body>
	<div align="center">
		<ul class="tboard">
			<li><a href="#tboard1" class="selected1">notice</a></li>
			<li><a href="#tboard2">FAQ</a></li>
			<li><a href="#tboard3">question</a></li>

		</ul>
	</div>

	<br>

	<div id="container2">

		<ul class="pboard">


			<li id="tboard1"><%@ include file="notice/notice.jsp"%>

			</li>

			<li id="tboard2"><%@ include file="faq/faq.jsp"%>
			</li>

			<li id="tboard3"><%@ include file="question/question.jsp"%>
			</li>


		</ul>
	</div>
</body>
</html>