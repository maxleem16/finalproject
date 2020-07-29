<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>회원가입</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp"/>
	</div>
	<div id="divListImg">
		<img src="/resources/img/list_ad.jpg">		<!-- 광고 이미지 -->
	</div>
	<jsp:include page="../menu3.jsp"/>
   <h1>[회원수정]</h1>
    <form name="frm" action="update" method="post">
        <table border=1 width=400>
            <tr>
                  <td width=150>아이디</td>
                  <td><input type="text" name="id" size=16 value="${vo.id}" readonly></td>
            </tr>
            <tr>
               <td width=150>비밀번호 변경</td>
               <td><input type="password" size=16 id="password1"></td>
            </tr>
            <tr>
               <td width=150>비밀번호 확인</td>
               <td><input type="password" name="password" id="password2" size=16></td>
            </tr>
            <tr>
                <td width=150>이름</td>
                  <td><input type="text" name="name" size=16 value="${vo.name}" readonly></td>
            </tr>
            <tr>
                <td width=150>생년월일</td>
                  <td><input type="text" name="birthday" size=16 value="${vo.birthday}" readonly></td>
            </tr>
            <tr>
                <td width=150>주소</td>
                  <td><input type="text" name="address" size=16 value="${vo.address}"></td>
            </tr>
            <tr>
                <td width=150>전화번호</td>
                  <td><input type="text" name="tel" size=16 value="${vo.tel}"></td>
            </tr>
            <tr>
                <td width=150>이메일</td>
                <td><input type="text" name="email" size=16 value="${vo.email}"></td>
            </tr>
            </table>       
        <input type="submit" value="수정">
        <input type="reset" value="취소">
    </form>
    <jsp:include page="../footer.jsp"/>
</body>
<script>
	var check=false;
	
	$(frm).submit(function(e){
		e.preventDefault();
		var password1=$("#password1").val();
		var password2=$("#password2").val();
		if(password1!=password2){
			alert("비밀번호가 일치하지 않습니다.");
		}else{
			alert("회원정보 수정이 완료되었습니다.");
			frm.submit();
		}
	});
	
</script>
</html>