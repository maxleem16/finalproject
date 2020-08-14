<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background: white;
	width: 450px;
	position: absolute;
	top: 2%;
	left: 20%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
}

.averageDonation {
	background: white;
	width: 450px;
	position: absolute;
	top: 2%;
	left: 45%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
}

.totalDonors {
	background: white;
	width: 310px;
	position: absolute;
	top: 2%;
	left: 70%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
}
.donationByMonth {
	background: white;
	width: 650px;
	position: absolute;
	top: 30%;
	left: 20%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
}
.donationByMethod {
	background: white;
	width: 650px;
	position: absolute;
	top: 30%;
	left: 55%;
	border-radius: 20px;
	background: #ffffff;
	box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
	padding: 30px;
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
			<div id="divContent">
				<div class="totalDonation">총 기부금액 ${sumPrice}원</div>
				<div class="averageDonation">평균 기부금액 ${avgPrice}원</div>
				<div class="totalDonors">총 후원자 수 ${totalDonor}명</div>
				<div class="donationByMonth">
					<div id="chart_month" style="width: 600px; height: 500px;"></div>
				</div>
				<div class="donationByMethod">
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
						seriesType : 'bars',
						series : {
							0 : {
								type : 'line',
								color : 'blue'
							},
							1 : {
								type : 'bars',
								color : '#6f9654'
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
						pieHole : 0.3,
						pieStartAngle : 100
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
