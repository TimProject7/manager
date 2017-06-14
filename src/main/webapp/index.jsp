<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/adminmain.css" />
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
	text-align: center;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").click(function() {
			$("#login").attr({
				"method" : "POST",
				"action" : "/admin/adminmain"
			});

			$("#login").submit();
		})

	})
</script>
</head>
<body>
	<c:choose>
		<c:when test="${not empty sessionScope.avo }">
			<script type="text/javascript">
				self.location = "admin/adminmain"
			</script>
		</c:when>
		<c:when test="${empty sessionScope.avo }">
			<form id="login">

				<table>
					<tr>
						<th>관리자 ID</th>
						<td><input type="text" id="admin_id" name="admin_id"
							autofocus="autofocus"></td>
					</tr>

					<tr>
						<th>PASSWORD</th>
						<td><input type="password" id="admin_password"
							name="admin_password"></td>
					</tr>


				</table>
			</form>
			<input type="button" id="loginBtn" value="로그인">
		</c:when>

	</c:choose>

</body>
</html>