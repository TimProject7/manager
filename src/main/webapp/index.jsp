<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<td>아이디<input type="text" id="admin_id" name="admin_id"></td>
			</tr>
			<tr>
				<td>비밀번호<input type="text" id="admin_password"
					name="admin_password"></td>
			</tr>
		</table>
	</form>
	<input type="button" id="loginBtn" value="로그인">


</body>
</html>