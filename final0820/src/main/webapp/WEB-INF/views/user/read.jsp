<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>DDOGDOG MYPAGE</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<link rel="shortcut icon" type="image⁄x-icon"   href="/resources/img/page_logo.png">
	<link rel="stylesheet" href="/resources/css/style.css">
	<style>

</style>
</head>
<body>
   
  <jsp:include page="../menu3.jsp"/>
  <div class="menuBox">
	 <jsp:include page="../menuTop.jsp"/>
	<div id="URtext">개인정보 수정</div>
    <form name="frm" action="update" method="post">
        <table border=1 width=400 id="userUD">
            <tr>
                  <td class="UDtitle">아이디</td>
                  <td class="UD"><input type="text" name="id" size=30 value="${vo.id}" readonly></td>
            </tr>
            <tr>
               <td class="UDtitle">비밀번호 변경</td>
               <td class="UD"><input type="password" size=30 id="password1"></td>
            </tr>
            <tr>
               <td class="UDtitle">비밀번호 확인</td>
               <td class="UD"><input type="password" name="password" id="password2" size=30></td>
            </tr>
            <tr>
                <td  class="UDtitle">이름</td>
                  <td class="UD"><input type="text" name="name" size=16 value="${vo.name}" readonly></td>
            </tr>
            <tr>
                <td class="UDtitle">생년월일</td>
                  <td class="UD"><input type="text" name="birthday" size=16 value="${vo.birthday}" readonly></td>
            </tr>
            <tr>
                <td class="UDtitle">주소</td>
                  <td class="UD"><input type="text" name="address" size=100 value="${vo.address}"></td>
            </tr>
            <tr>
                <td class="UDtitle">전화번호</td>
                  <td class="UD"><input type="text" name="tel" size=20 value="${vo.tel}"></td>
            </tr>
            <tr>
                <td class="UDtitle">이메일</td>
                <td class="UD"><input type="text" name="email" size=25 value="${vo.email}"></td>
            </tr>
            </table>      
        <div class="btnUD"> 
	        <input type="submit" value="수정">
	        <input type="reset" value="취소">
        </div>
    </form>
    </div>
    <jsp:include page="../myPageFooter.jsp"/>
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