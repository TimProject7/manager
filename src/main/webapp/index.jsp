<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<c:choose>
	<c:when test="${empty sessionScope.avo }">
		<script type="text/javascript">
			self.location = "admin/adminlogin"
		</script>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
			self.location = "admin/adminmain"
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>