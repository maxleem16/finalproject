<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
	<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
	<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
</head>
<body>
	<div class="container calendar-container">
		<div id="calendar" style="max-width:900px; margin:40px auto;"></div>
	</div>
</body>
<script>
	$(document).ready(function(){
		  $('#calendar').fullCalendar({
		    header: {
		      right: 'custom2 prevYear,prev,next,nextYear'
		    },
	   	  	// 달력 정보 가져오기 
		    eventSources: [
		    	{
					// ajax 통신으로 달력 정보 가져오기 
					url: '/manage/counseling',
					type: 'GET',
					dataType: "JSON",
					success: function (data) {
						alert(data);
					},
					error: function() {
						alert('there was an error while fetching events!');
					},
					color: 'purple',   
				 	textColor: 'white'
	            	// GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
		    	}
		    ]
		  }); 
	});
</script>
</html>
