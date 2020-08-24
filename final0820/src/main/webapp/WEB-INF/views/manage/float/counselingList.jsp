<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
           <script src="https://momentjs.com/downloads/moment.min.js"></script>
           <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.js'></script>
           <link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.1.0/fullcalendar.min.css" />
</head>
<body>
	<div class="container calendar-container">
		<h2>상담 예약 일정</h2>
		<div id="calendar" style="max-width: 900px; margin: 40px auto;"></div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header : {
				right : 'custom2 prevYear,prev,next,nextYear'
			},
			eventSources : [ {
				url : '/manage/float/counseling'
			} ]
		});

	});
</script>
</html>
