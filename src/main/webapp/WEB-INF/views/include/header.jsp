<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<title>ParKer 관리자모드</title>

<!-- 일반 메뉴 -->
<center>
	<a href="/admin/product/productlist">상품관리(목록)</a> | <a
		href="/admin/user/userlist">회원관리</a> |<a
		href="/admin/delivery/deliverylist">배송관리</a> | <a
		href="/admin/notice/noticelist">게시판관리</a> | <a
		href="/admin/status/statususer">통계</a> |

	<!-- 로그인, 로그아웃 -->
	<c:choose>
		<c:when test="${not empty sessionScope.avo.admin_id}">&nbsp;&nbsp;&nbsp;&nbsp;
         ${sessionScope.avo.admin_id} 님이 로그인중입니다.
         <input type="hidden" name="admin_number"
				value="${sessionScope.avo.admin_number }">
			<a href="/admin/logout">로그아웃</a>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				location.href = "/admin/adminlogin";
			</script>
		</c:otherwise>
	</c:choose>
	<hr>
</center>