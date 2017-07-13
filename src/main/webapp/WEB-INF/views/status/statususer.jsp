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
				["탈퇴회원", ${yongho1}, "silver"]
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
			['탈퇴회원수', ${yongho1}]
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

   
   //오늘
      var today = new Date();
      var year = today.getFullYear();
      var month = today.getMonth()+1;
       var day = today.getDate();
       if((day+"").length<2){
    	   day ="0"+day;
       }
       var getToday = year+","+month+","+day;
       
    //1일전
     /*   var today1 = new Date();
       var year = today.getFullYear();
       var month = today.getMonth()+1;
      today1.setDate(today1.getDate()-1);
      var day1 = today1.getDate();
      if((day1+"").length<2){
   	   day1 ="0"+day1;
      }
      var getToday1 = year+","+month+","+day1;
      
       */
       var today1 = new Date();
       var day1 = 1;
       var getToday1 = new Date(today1-(3600000*24*day1));
      //2일전
     /*  var today2 = new Date();
      var year = today.getFullYear();
      var month = today.getMonth()+1;
    today2.setDate(today2.getDate()-2);
    var day2 = today2.getDate();
    if((day2+"").length<2){
 	   day2 ="0"+day2;
    }
    var getToday2 = year+","+month+","+day2;
     */
     var today2 = new Date();
     var day2 = 2;
     var getToday2 = new Date(today2-(3600000*24*day2));
    //3일전
    /* var today3 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
   today3.setDate(today3.getDate()-3);
   var day3 = today3.getDate();
   if((day3+"").length<2){
	   day3 ="0"+day3;
    }
    var getToday3 = year+","+month+","+day3;
    */
    var today3 = new Date();
    var day3 = 3;
    var getToday3 = new Date(today3-(3600000*24*day3));
    //4일전
    /* var today4 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today4.setDate(today4.getDate()-4);
    var day4 = today4.getDate();
    if((day4+"").length<2){
    	day4 ="0"+day4;
     }
     var getToday4 = year+","+month+","+day4;
     */
     var today4 = new Date();
     var day4 = 4;
     var getToday4 = new Date(today4-(3600000*24*day4));
    //5일전
    /* var today5 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today5.setDate(today5.getDate()-5);
    var day5 = today5.getDate();
    if((day5+"").length<2){
    	day5 ="0"+day5;
     }
     var getToday5 = year+","+month+","+day5; */
     var today5 = new Date();
     var day5 = 5;
     var getToday5 = new Date(today5-(3600000*24*day5));
     //6일전
   /*  var today6 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today6.setDate(today6.getDate()-6);
    var day6 = today6.getDate();
    if((day6+"").length<2){
    	day6 ="0"+day6;
     }
     var getToday6 = year+","+month+","+day6;
     */
     var today6 = new Date();
     var day6 = 6;
     var getToday6 = new Date(today6-(3600000*24*day6));
     
     //7일전
    /* var today7 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today7.setDate(today7.getDate()-7);
    var day7 = today7.getDate();
    if((day7+"").length<2){
    	day7 ="0"+day7;
     }
     var getToday7 = year+","+month+","+day7; */
     var today7 = new Date();
     var day7 = 7;
     var getToday7 = new Date(today7-(3600000*24*day7));
     
     //8일전
    /* var today8 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today8.setDate(today8.getDate()-8);
    var day8 = today8.getDate();
    if((day8+"").length<2){
    	day8 ="0"+day8;
     }
     var getToday8 = year+","+month+","+day8;
     */
     
     var today8 = new Date();
     var day8 = 8;
     var getToday8 = new Date(today8-(3600000*24*day8));
     //9일전
   /*  var today9 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today9.setDate(today9.getDate()-9);
    var day9 = today9.getDate();
    if((day9+"").length<2){
    	day9 ="0"+day9;
     }
     var getToday9 = year+","+month+","+day9;
     */
     var today9 = new Date();
     var day9 = 9;
     var getToday9 = new Date(today9-(3600000*24*day9));
     //10일전
    /* var today10 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today10.setDate(today10.getDate()-10);
    var day10 = today10.getDate();
    if((day10+"").length<2){
    	day10 ="0"+day10;
     }
     var getToday10 = year+","+month+","+day10; */
     var today10 = new Date();
     var day10 = 10;
     var getToday10 = new Date(today10-(3600000*24*day10));
     //11일전
  /*   var today11 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today11.setDate(today11.getDate()-11);
    var day11 = today11.getDate();
    if((day11+"").length<2){
    	day11 ="0"+day11;
     }
     var getToday11 = year+","+month+","+day11; */
     var today11 = new Date();
     var day11 = 11;
     var getToday11 = new Date(today11-(3600000*24*day11));
     
     //12일전
    /* var today12 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today12.setDate(today12.getDate()-12);
    var day12 = today12.getDate();
    if((day12+"").length<2){
    	day12 ="0"+day12;
     }
     var getToday12 = year+","+month+","+day12;
     */
     var today12 = new Date();
     var day12 = 12;
     var getToday12 = new Date(today12-(3600000*24*day12));
     //13일전
    /* var today13 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today13.setDate(today13.getDate()-13);
    var day13 = today13.getDate();
    if((day13+"").length<2){
    	day13 ="0"+day13;
     }
     var getToday13 = year+","+month+","+day13;
     */
     var today13 = new Date();
     var day13 = 13;
     var getToday13 = new Date(today13-(3600000*24*day13));
     
     //14일전
    /* var today14 = new Date();
    var year = today.getFullYear();
    var month = today.getMonth()+1;
    today14.setDate(today14.getDate()-14);  
    var day14 = today14.getDate();
    if((day14+"").length<2){
    	day14 ="0"+day14;
     }
     var getToday14 = year+","+month+","+day14;
     */
     var today14 = new Date();
     var day14 = 14;
     var getToday14 = new Date(today14-(3600000*24*day14));
     
     
    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('date', 'Start Date');
      data.addColumn('number', '매출');

      data.addRows([
        [new Date(getToday14),  ${to14}],
        [new Date(getToday13),  ${to13}],
        [new Date(getToday12),  ${to12}],
        [new Date(getToday11),  ${to11}],
        [new Date(getToday10),  ${to10}],
        [new Date(getToday9),   ${to9}],
        [new Date(getToday8),   ${to8}],
        [new Date(getToday7),  ${to7}],
        [new Date(getToday6),  ${to6}],
        [new Date(getToday5), ${to5}],
        [new Date(getToday4),  ${to4}],
        [new Date(getToday3),  ${to3}],
        [new Date(getToday2),  ${to2}], 
        [new Date(getToday1),  ${to1}],
        [new Date(getToday), ${to}]
      ]);

      
      
      var options = {
        chart: {
          title: '파커 만년필 매출통계',
          subtitle: '최근 14일간'
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
	width: 95%
}

#barChart {
	width: 50%;
	float: left;
}

#pieChart {
	width: 50%;
	float: right;
}

#form {
	width: 95%
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
				<table border="1" style="width: 65%">
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
		<div id="line_top_x" style="width: 95%"></div>
	</div>
	<p style="color: red" align="center"><b>※1k = 1,000 원 1m = 1,000,000원</b></p>
	<br><br>
</body>
</html>