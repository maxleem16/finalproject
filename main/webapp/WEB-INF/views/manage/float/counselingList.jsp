<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'
	rel='stylesheet' />
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css'
	rel='stylesheet' media='print' />
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
</head>
<body>
	<div class="container calendar-container">
		<div id="calendar" style="max-width: 900px; margin: 40px auto;"></div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header : {
				right : 'custom2 prevYear,prev,next,nextYear'
			},
			 eventSources: [
				 {
					 url:'/manage/float/counseling'
				 }
			 ]
		});

	});
	
</script>
</html>
