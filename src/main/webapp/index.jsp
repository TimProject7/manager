<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<form id="login">
		<table>
			<tr>
				<th>관리자 ID</th>
				<td><input type="text" id="admin_id" name="admin_id"></td>
			</tr>

			<tr>
				<th>PASSWORD</th>
				<td><input type="password" id="admin_password"
					name="admin_password"></td>
			</tr>


		</table>
	</form>
	<input type="button" id="loginBtn" value="로그인">


</body>
</html>