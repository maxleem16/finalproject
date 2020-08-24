<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body {
      background: #e0e5ec;
   }
</style>
</head>
<body>
   <div style="margin: 200px 0 0 700px; text-align:center; width:400px;border-radius: 40px;
      background: #e0e5ec;
      box-shadow:  21px 21px 51px #a3b1c6, 
             -29px -29px 59px #fffdfd;
        padding:20px 10px 50px 10px; height:400px;">
      <a><img src="/resources/img/page_logo.png" style="height: 80px; margin-left: 10px;" /></a> <br>
      <br>
      <h3>안녕하세요, ${param.id} 님!</h3>
      <br>
      <p style="font-size:15px; font-weight:550;">환영합니다!</p>
      <p style="font-size:13px;">회원가입이 정상적으로 이루어 졌습니다.<br>
      로그인 하시면 홈페이지 내의 <br>모든 서비스를 이용하실 수 있습니다.</p>
      <br><br><br><br>
      <a href="/user/login" style="text-decoration:none; color:#F25F29; font-weight:600;">로그인 페이지로 이동하기</a>
      <%-- <br> <a href="${pageContext.request.contextPath}/">로그인 페이지로 이동하기</a> --%>
   </div>
</body>
</html>