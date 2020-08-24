<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" 
src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>DDOGDOG LOGIN</title>
</head>
<style>
	table {
		width:500px;
		border-collapse: collapse;
		margin:auto;
	}
	#naverIdLogin {
		margin:auto;
		text-align:center;
	}
</style>
<body>
	<div id="divMenu">
		<jsp:include page="menu.jsp"/>
	</div>
	<div id="divListImg">
		<jsp:include page="box.jsp"/>		<!-- 광고 이미지 -->
	</div>
	<!-- full-size background image 찾을 것 -->
	<table border=1>
		<tr>
			<th>ID</th>
			<td><input type="text" size=5></td>
			<td rowspan=2><button>LOGIN</button>
		</tr>
		<tr>
			<th>PASSWORD</th>
			<td><input type="password" size=5></td>
		</tr>
		<tr>
			<td colspan=3><button onClick="location.href='/join'">회원가입</button>
		</tr>
	</table>
	<div id="loginAPI">
		
	</div>

	<!-- 네이버아이디로로그인 버튼 노출 영역 -->
	<div id="naverIdLogin">
		<img src="/resources/img/naver_login.PNG" width=300px>	
	</div>
	<!-- //네이버아이디로로그인 버튼 노출 영역 -->


</body>
	<!-- 네이버아디디로로그인 초기화 Script -->
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "9M4trWgeF5hWmAyLxoM0",
			callbackUrl : "http://192.168.0.115:8088/naverLogin",
			isPopup : true, /* 팝업을 통한 연동처리 여부 */
			loginButton : {
				color : "green",
				type : 3,
				height : 60
			}
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
	</script>
</html>