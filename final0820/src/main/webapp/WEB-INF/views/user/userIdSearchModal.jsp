<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<!-- <div id="background_modal" class="background_modal">
		<div class="modal_contents">
			<h4>
				<b>손님 아이디는?</b><span class="close">&times;</span>
			</h4><br>
				<h2 id="id_value"></h2>
			<br>
			<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
			<i class="fa fa-envelope"></i>비밀번호 찾기</button>
		</div>
	</div> -->

	<div class="modal fade" id="myModal" role="dialog">
		<!-- 사용자 지정 부분① : id명 -->
		<div class="modal-dialog" >
			<!-- Modal content-->
			<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">회원님의 아이디는?</h4>
					<!-- 사용자 지정 부분② : 타이틀 -->
				<div class="modal-body">
					<h2 id="id_value"></h2>
					<!-- 사용자 지정 부분③ : 텍스트 메시지 -->
				</div>
			</div>
		</div>
	</div>
	<br/><br/>
</body>
</html>