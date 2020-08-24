<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<style>
.totalDonation {
	font-family: 'Binggrae-Bold';
	background: white;
	width: 450px;
	position: absolute;
	top: 10%;
	left: 25%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
}
.averageDonation {
	font-family: 'Binggrae-Bold';
	background: white;
	width: 450px;
	position: absolute;
	top: 10%;
	left: 50%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
}

.totalDonors {
	font-family: 'Binggrae-Bold';
	background: white;
	width: 310px;
	position: absolute;
	top: 10%;
	left: 75%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
}

.donationBy {
	font-family: 'Binggrae-Bold';
	background: white;
	width: 1300px;
	position: absolute;
	top: 30%;
	left: 25%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
	column-count: 2;
	column-rule: 1px solid gray;
}

.totalDonation h3{
	color:#CD7259;
}
.averageDonation h3{
	color:#457373;
}
.totalDonors h3{
	color:#DDB247;
}
.data{
font-size: 40px;
font-weight: bold;
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="navBar">
			<ul>
				<li><a href="#">후원내역통계</a></li>
			</ul>
		</div>
		<div id="management">
			<div id="divContent">
				<div class="totalDonation">
					<h3>총 기부금액</h3>
					<span class="data"><fmt:formatNumber value="${sumPrice}" pattern="#,###원"/></span>
				</div>
				<div class="averageDonation">
					<h3>평균 기부금액</h3>
					<span class="data"><fmt:formatNumber value="${avgPrice}" pattern="#,###원"/></span>
				</div>
				<div class="totalDonors">
					<h3>총 후원자 수</h3>
					<span class="data">${totalDonor}명</span>
				</div>
				<div class="donationBy">
					<div id="chart_month" style="width: 600px; height: 500px;"></div>
					<div id="chart_method" style="width: 600px; height: 500px;"></div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	monthChart();
	function monthChart() {
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawVisualization);

		function drawVisualization() {
			$.ajax({
				type : "get",
				url : "/manage/donationByMonth.json",
				dataType : "json",
				success : function(result) {
					/* 데이터 셋팅 */
					var data = google.visualization.arrayToDataTable(result);

					/* 옵션 셋팅 */
					var options = {
						title : "월별 기부 금액",
						titleTextStyle: {
						         fontName: 'Binggrae-Bold',
						         fontSize: 25
						       },
						seriesType : 'bars',
						series : {
							0 : {
								type : 'line',
								color : '#D55E2D'
							}
						}
					};

					/* 차트 그리기 */
					var chart = new google.visualization.ComboChart(document
							.getElementById('chart_month'));
					chart.draw(data, options);
				}
			});
		}
	}

	methodChart();
	function methodChart() {
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawVisualization);

		function drawVisualization() {
			$.ajax({
				type : "get",
				url : "/manage/donationByDonor.json",
				dataType : "json",
				success : function(result) {
					var data = google.visualization.arrayToDataTable(result);

					var options = {
						title : '후원자별 기부금 통계',
						titleTextStyle: {
					         fontName: 'Binggrae-Bold',
					         fontSize: 25
					       },
						pieHole : 0.3,
						pieStartAngle : 100,
						colors: ['#D9A282', '#0D0D0D', '#9B8148', '#034001','#027368', '#0D0D0D']
					};

					var chart = new google.visualization.PieChart(document
							.getElementById('chart_method'));
					chart.draw(data, options);
				}
			});
		}
	}
</script>
</html>
