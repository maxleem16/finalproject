<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>로그인</title>
</head>
<body>
	<jsp:include page="../menu3.jsp"/>
   	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div id="backIMG2"><img src="/resources/img/9.png"></div>
		<div id="deleteH"><b style="color:#F25F29; font-size:22px;"> 회원탈퇴</b> 절차를 위해 비밀번호를 입력해주세요 </div>
      <table width=400 cellpadding=0 cellspacing=0 id="deleteP">
         <tr id="deleteP1">
            <td><input type="password" id="password" size=40  placeholder="비밀번호를 입력하세요"></td>
         </tr>
         <tr  id="deleteP2">
            <td colspan=2>
               <input type="button" id="btnPassDelete" value="확인">
            </td>
         </tr>
      </table>
      </div>
      <jsp:include page="../myPageFooter.jsp" />
</body>
<script>

   $("#password").keydown(function(key){
      if(key.keyCode==13){
         $("#btnPassDelete").click();
      }
   });
   
   $("#btnPassDelete").on("click",function() {
	   if(!confirm("탈퇴하시겠습니까?")) return;
      var id = "${id}";
      var password = $("#password").val();
      $.ajax({
         type : "get",
         url : "/user/deletePasswordCheck",
         data : {"id" : id,"password" : password},
         success : function(data) {
            if (data == 0) {
               alert("비밀번호가 일치하지 않습니다.");
               $("#password").focus();
            } else if (data == 1) {
            	if(!confirm("진짜로 탈퇴하시겠습니까?")) return;
               $.ajax({
                  type : "post",
                  url : "/user/delete",
                  data : {"id" : id,},
                  success : function() {
                     alert("탈퇴되었습니다.");
                     location.href="../";
                  }
               });   
            }
         }   
      });
   });
   
</script>
</html>