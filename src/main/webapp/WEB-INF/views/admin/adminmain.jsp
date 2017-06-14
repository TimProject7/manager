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
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/tab.js"></script>
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

			<%-- <br>
			<br>

			<div align="center">
				<nav>
					<ul class="tab">
						<li><a href="#tab1" class="selected">상품관리</a></li>
						<li><a href="#tab2">회원관리</a></li>
						<li><a href="#tab3">게시판관리</a></li>
						<li><a href="#tab4">통계</a></li>
					</ul>
				</nav>
			</div>

			<br>

			<div id="container2">

				<ul class="panel">


					<li id="tab1"><%@ include file="../product/product.jsp"%>

					</li>

					<li id="tab2"><%@ include
							file="../usermanagement/usermanagement.jsp"%>
					</li>

					<li id="tab3"><%@ include file="../board/board.jsp"%>
					</li>

					<li id="tab4"><%@ include file="../status/status.jsp"%>
					</li>
				</ul>
			</div>
 --%>
			<div class="jq_tabonoff comm_tab1">
				<ul class="jq_tab tab_menu">
					<li><a href="javascript:;" class="tit">상품관리</a></li>
					<li><a href="javascript:;" class="tit">회원관리</a></li>
					<li><a href="javascript:;" class="tit">게시판관리</a></li>
					<li><a href="javascript:;" class="tit">통계</a></li>
				</ul>
				<div class="jq_cont tab_cont">
					<!-- //탭1 -->
					<div class="cont">
						<p>혈액형 관련 대표적인 심리학 이론들</p>
						<br>
						<div class="jq_tabonoff comm_tab2">
							<ul class="jq_tab tab_menu">
								<li><a href="javascript:;" class="tit"></a></li>
								<li><a href="javascript:;" class="tit">2. 바넘효과</a></li>
								<li><a href="javascript:;" class="tit">3. 자기실행적 예언</a></li>

							</ul>
							<div class="jq_cont tab_cont">
								<!-- //탭1-1 -->
								<div class="cont">
									<strong>1. 확증편향 (confirmation bias)</strong><br> <br>
									<p>
										자신의 신념과 일치하는 정보들은 쉽게 믿고 받아들이고, 신념과 일치하지 않는 정보는 무시하거나 덜 찾는 경향<br>
										<br> 예: 소심한 사람에게 혈액형을 물어 A형이 아니라고 하면 금방 잊어버리고,<br>
										A형이 맞다고 하면 호들갑을 떨며 "맞지? A형일것 같았어."라고 말하는 것.
									</p>
								</div>
								<!-- 탭1-1// -->

								<!-- //탭1-2 -->
								<div class="cont">
									<strong>2. 바넘효과 (Barnum effect)</strong><br> <br>
									대부분의 사람들이 보편적으로 가지고 있는 성격이나 심리적 특징을<br> 자신만의 고유한 특성으로 여기는
									경향.<br> <br> 예: "당신은 대체로 싸움을 싫어하지만 때로는 강하게 나갈 때도
									있다.", "당신은 기본적으로 외향적인 성격이지만 때때로 소심하거나 내향적인 모습을 보이기도 한다"와 같은 당연한
									소리를 자신의 성격이라고 믿는 것.
								</div>
								<!-- 탭1-2// -->

								<!-- //탭1-3 -->
								<div class="cont">
									<strong>3. 자기실행적 예언(Self-fulfilling prophecy)</strong><br>
									<br> 자신에 대해 특정한 기대를 갖게 되면, 그러한 기대에 부응하는 쪽으로<br> 변하려고
									노력하게 되어, 행동을 그러한 단서에 맞게 바꿔가는 경향.<br> <br> 예: 별자리 운세에
									나온 "오늘은 좋은 일이 생긴다"라는 말을 보고 기분이 좋아져 실제로도 좋은 하루를 보내게 되는 것.
								</div>
								<!-- 탭1-3// -->


							</div>
						</div>
					</div>
					<!-- 탭1// -->

					<!-- //탭2 -->
					<div class="cont">
						<p>혈액형 성격유형가설의 유래와 역사</p>
						<br>
						<div class="jq_tabonoff comm_tab2">
							<ul class="jq_tab tab_menu">
								<li><a href="javascript:;" class="tit">1. 유럽의 우생학</a></li>
								<li><a href="javascript:;" class="tit">2. 나치독일 대량학살</a></li>
								<li><a href="javascript:;" class="tit">3. 일본의 사이비과학</a></li>
							</ul>
							<div class="jq_cont tab_cont">
								<!-- //탭2-1 -->
								<div class="cont">
									<strong>1. 제국주의시대 유럽의 우생학</strong><br> <br> 유럽에는 A형과
									O형이 많고 아시아에는 상대적으로 B형과 AB형이 많은 것에 착안,<br> A형과 O형은 우월한 종자이고
									B형과 AB형은 열등한 종자라는 억지이론을 만들기 시작
								</div>
								<!-- 탭2-1// -->

								<!-- //탭2-2 -->
								<div class="cont">
									<strong>2. 나치독일 대량학살의 뒷받침</strong><br> <br> 나치독일에 의해
									유대인 등 대학살의 근거로 사용됨
								</div>
								<!-- 탭2-2// -->

								<!-- //탭2-3 -->
								<div class="cont">
									<strong>3. 일본의 사이비과학(pseudoscience)</strong><br> <br>
									뒷받침되는 증거가 전혀 없어 유럽에서 폐기된 가설을<br> 후루까와 등 일본의 엉터리 과학자가 들여와
									나름 살을 붙여서 퍼뜨리기 시작
								</div>
								<!-- 탭2-3// -->
							</div>
						</div>
					</div>
					<!-- 탭2// -->

					<!-- //탭3 -->
					<div class="cont">
						<strong>서울백병원 신경정신과 우종민 박사의 말</strong><br> <br>
						<p>
							사람의 성격에 대해서는 정신과만큼 관심이 많은 과가 없겠지요.<br> 그렇지만 정신과 의사들은 혈액형과
							성격에 대해서 연구한 적이 거의 없습니다.<br> 그 이유는 애당초 연구를 시작해야 될 필요성이나 과학적인
							근거가 없기 때문에<br> 연구를 안 한 것이지요.
						</p>
					</div>
					<!-- 탭3// -->
					<!-- //탭4 -->
					<div class="cont">
						<strong>11서울백병원 신경정신과 우종민 박사의 말</strong><br> <br>
						<p>
							사람의 성격에 대해서는 정신과만큼 관심이 많은 과가 없겠지요.<br> 그렇지만 정신과 의사들은 혈액형과
							성격에 대해서 연구한 적이 거의 없습니다.<br> 그 이유는 애당초 연구를 시작해야 될 필요성이나 과학적인
							근거가 없기 때문에<br> 연구를 안 한 것이지요.
						</p>
					</div>
					<!-- 탭4// -->
				</div>
			</div>

		</c:when>
		<c:when test="${empty sessionScope.avo }">
			<script type="text/javascript">
				self.location = "/"
			</script>
		</c:when>
	</c:choose>

</body>
</html>