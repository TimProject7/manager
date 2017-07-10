<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		//차트의 시작
		google.charts.load("current",{packages:['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart(){
			var data = google.visualization.arrayToDataTable([
				["Element", "인원수(명)", {role: "style"}],
				["총가입회원", ${total}, "gold"],
				["일반회원", ${yongho}, "#b87333"],
				["탈퇴회원", ${yongho1}, "silver"],
			
				]);
			
			var view = new google.visualization.DataView(data);
			view.setColumns([0,1,
				{calc:"stringify",
				sourceColumn:1,
				type:"string",
				role:"annotation"},
				2]);
			
			var options = {
					title: "회원통계",
					widht: 300,
					height: 200,
					bar:{groupWidth: "95%"},
					legend:{position: "none"},
			};
			var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
			chart.draw(view, options);
		}
		
		
		// 여기까디~
		
		
		$("#btnWrite").click(function() {
			// 페이지 주소 변경(이동)
			location.href = "/admin/notice/noticewrite";
		});
		/* 검색후 검색 대상과 검색단어 출력 */
		if ("<c:out value='${data.keyword}'/>" != "") {
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
		}
		/* /* 한페이지에 보여줄 레코드 수 조회후 선택한 값 그대로 유지하기 위한 설정 */
		if ("<c:out value='${data.pageSize}'/>" != "") {
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");
		}

		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function() {
			goPage(1);
		});
		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function() {
			if ($("#search").val() == "all") {
				$("#keyword").val("글 목록 전체");
			} else if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
			;
		});
		

		//검색버튼
		$("#searchData").click(function() {
			//검색조건이 전체가 아닐시 키워드로 검색
			if ($("#search").val() == "all") {
				$("#keyword").val("");
			} else {
				if (!chkSubmit($('#keyword'), "검색어를")) {
					return;
				}
			}
			goPage(1);
		});

	});
	//검색한페이지에 보여줄 레코드 수 처리 및 페이징을 위한 실질적인 처리 함수
	function goPage(page) {
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/user/userlist"
		});
		$("#f_search").submit();

	}
	
	// 이제 파이~
	$(document).ready(function() {
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart(){
		var data = google.visualization.arrayToDataTable([
			['Task', 'Hours per Day'],
			['일반회원수', ${yongho}],
			['탈퇴회원수', ${yongho1}],
			
		]);
		
		var options = {
				title: '회원통계',
				is3D: true,
				
		};
		
		var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
		chart.draw(data, options);
	}
	});
	
	
	// 여기까디~

	//매출통계
	$(document).ready(function() {
	google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

   
      //현재날짜 가져오기

   
   
      var today = new Date();
       var day = today.getDate();
       
       var today1 = new Date();
      today1.setDate(today1.getDate()-1);
      var day1 = today1.getDate();
      
      
      var today2 = new Date();
    today2.setDate(today2.getDate()-2);
    var day2 = today2.getDate();
    
    var today3 = new Date();
   today3.setDate(today3.getDate()-3);
   var day3 = today3.getDate();
   
    var today4 = new Date();
    today4.setDate(today4.getDate()-4);
    var day4 = today4.getDate();
    
    var today5 = new Date();
    today5.setDate(today5.getDate()-5);
    var day5 = today5.getDate();
    
    var today6 = new Date();
    today6.setDate(today6.getDate()-6);
    var day6 = today6.getDate();
    
    var today7 = new Date();
    today7.setDate(today7.getDate()-7);
    var day7 = today7.getDate();
    
    var today8 = new Date();    
    today8.setDate(today8.getDate()-8);
    var day8 = today8.getDate();
    
    var today9 = new Date();
    today9.setDate(today9.getDate()-9);
    var day9 = today9.getDate();
    
    var today10 = new Date();
    today10.setDate(today10.getDate()-10);
    var day10 = today10.getDate();
    
    var today11 = new Date();
    today11.setDate(today11.getDate()-11);
    var day11 = today11.getDate();
    
    var today12 = new Date();
    today12.setDate(today12.getDate()-12);
    var day12 = today12.getDate();
    
    var today13 = new Date();
    today13.setDate(today13.getDate()-13);
    var day13 = today13.getDate();
    
    var today14 = new Date();
    today14.setDate(today14.getDate()-14);  
    var day14 = today14.getDate();
    
    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Day');
      data.addColumn('number', '매출');

      data.addRows([
        [day14,  900000],
        [day13,  1380000],
        [day12,  1220000],
        [day11,  20000],
        [day10,  1000000],
        [day9,   1000000],
        [day8,   1000000],
        [day7,  1000000],
        [day6,  1000000],
        [day5, 1000000],
        [day4,  1000000],
        [day3,  1000000],
        [day2,  1000000], 
        [day2,  1000000],
        [day, 800000]
      ]);

      var options = {
        chart: {
          title: '파커 만년필 매출통계',
          subtitle: '최근 7일간'
        },
    	height:400,
        axes: {
          x: {
            0: {side: 'top'},
          }
        }
      };

      var chart = new google.charts.Line(document.getElementById('line_top_x'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
	});
	
</script>
<style type="text/css">
* {
	margin: 0 auto;
	padding: 0;
}

#chart {
	width: 100%
}

#barChart {
	width: 50%;
	float: left;
}

#pieChart {
	width: 50%;
	float: right;
}
</style>
</head>
<body>
	<div>
		<%@include file="../include/header.jsp"%>
		<div id="chart">
			<div id="barChart">
				<h3>barChart</h3>
				<div id="columnchart_values" style="width: 100%;"></div>
			</div>
			<div id="pieChart">
				<h3>pieChart</h3>
				<div id="piechart_3d" style="width: 100%;"></div>
			</div>

		</div>
		<!-- 페이지 넘버 -->
		<%-- <form id="f_search" name="f_search">
			<input type="hidden" id="page" name="page" value="${data.page}" /> <input
				type="hidden" id="pageSize" name="pageSize" value="${data.pageSize}" />
		</form> --%>
		<form name="form" id="form">
			<div>
				<table border="1"">
					<tr>
						<Th>아이디</Th>
						<Th>회원명</Th>
						<Th>휴대전화</Th>
						<Th>이메일</Th>
						<Th>가입일자</Th>
						<th>상태</th>
					</tr>

					<c:choose>
						<c:when test="${not empty statusUserList }">
							<c:forEach var="statusUserList" items="${statusUserList}">
								<input type="hidden" id="user_number" name="user_number"
									value="${statusUserList.user_number }">
								<tr>

									<td>${statusUserList.user_id }</td>
									<td>${statusUserList.user_name }</td>
									<td>${statusUserList.user_phone }</td>
									<td>${statusUserList.user_email }</td>
									<td>${statusUserList.user_regdate }</td>
									<td><c:choose>
											<c:when test="${statusUserList.user_status == 'Y'}">
												<font style="color: black">일반회원</font>
											</c:when>
											<c:otherwise>
												<font style="color: red"> 탈퇴회원</font>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>

						</c:when>
						<c:otherwise>
							<td colspan="5">등록된 회원이 없습니다.</td>
						</c:otherwise>
					</c:choose>

				</table>
			</div>
		</form>
	</div>
	<!-- 페이지출력 -->
	<%-- <div id="buyListPage" align="center">
		<tag:paging page="${param.page}" total="${total}"
			list_size="${data.pageSize}" />
	</div> --%>

	<div>
		<div id="line_top_x" style="width: 100% top-padding=100px;"></div>
	</div>
</body>
</html>