<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<table>

			<tr>
				<th>${questionDetail.question_title }</th>
				<td colspan="3" align="right">${questionDetail.question_regdate }</td>
			</tr>
			<tr>
				<td><hr></td>

			</tr>
			<tr>
				<td>${userInfo.user_id }님</td>
			</tr>
			<tr>

				<td colspan="4">${questionDetail.question_content }</td>
			</tr>
			<tr>

				<td>${questionDetail.question_image }</td>
			</tr>
		</table>

		<form name="form">
			<input type="hidden" name="question_number" id="question_number">
			<table>
				<tr>
					<td></td>
					<td><input type="text" name="questionReply_content"
						id="questionReply_content"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>