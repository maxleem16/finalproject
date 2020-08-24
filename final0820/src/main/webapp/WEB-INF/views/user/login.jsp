<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<link rel="stylesheet" type="text/css" href="/resources/css/style2.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<title>WELCOME TO DDOGDOG</title>
<style>
   body {
      background: #e0e5ec;
   }
   
   #tblLogin {
      border-collapse:collapse;
      position:absolute;
      top:14%;
      left:38%;
      width:400px;
      height:720px;
   }
   
   #chk {
      font-family: 'Nanum Gothic Coding', monospace;
      font-size:16px;
   }
</style>
</head>
<body>
   <form name="frm" action="login" method="post" class="frmLogin">
      <div id="tblLogin">
         <div id="loginlogo" onClick="location.href='../'" style="cursor:pointer;"><img src="/resources/img/logo.png" alt="인덱스로 이동"></div>
         <div id="login">
            <div id="id"><input type="text" name="id" size=40 placeholder="&nbsp;TEXT YOUR ID"></div><br>
            <div id="pass"><input type="password" name="password" size=40  placeholder="&nbsp;TEXT YOUR PASSWORD"></div>
            <div id="chk"><input type="checkbox" name="chkLogin">&nbsp;&nbsp;로그인 상태 유지</div>
            <div class="btnLogin">
               <div id="btn"><input type="submit" value="로그인"></div>
               <a id="btnKakao">
                  <img src="/resources/img/kakao_login_medium_wide.png">
               </a>
                <div id="naver_id_login">
                   <img src="/resources/img/naver_login.PNG">
                </div>
            </div>
         </div>
         <div id="joinus">
            Don't have an account? <a href="insert2"> &nbsp;join us</a>
         </div>
         <div id="search">
            Can't access your accunt? <a href="userSearch"> search</a>
         </div>
      </div>
   </form>
</body>
<script type="text/javascript">
   var naver_id_login = new naver_id_login("c3B_nFy0kk6mprA8QcQ8", "http://192.168.0.115:8088/user/loginNaver");
   var state = naver_id_login.getUniqState();
   naver_id_login.setButton("green", 3,40);
   naver_id_login.setDomain("http://192.168.0.115:8088");
   naver_id_login.setState(state);
   //naver_id_login.setPopup();
   naver_id_login.init_naver_id_login();
   
   $(frm).submit(function(e) {
      var id = $(frm.id).val();
      var password = $(frm.password).val();
      var chkLogin = $(frm.chkLogin).is(":checked") == true;
      e.preventDefault();
      $.ajax({
         type : "post",
         url : "/user/login",
         data : {
            "id" : id,
            "password" : password,
            "chkLogin" : chkLogin
         },
         success : function(data) {
            if (data == 0 || data =="" || data == null) {
               alert("아이디가 존재하지 않습니다.");
               $(frm.id).focus();
            } else if (data == 1) {
               alert("비밀번호가 일치하지 않습니다.");
               $(frm.pass).focus();
            } else if (data == 3){
               alert("탈퇴된 회원아이디입니다.");
               $(frm.id).focus();
            } else if (data == 4){   
               alert("메일 인증 후 로그인 할 수 있습니다.");
            } else if (data == 5){
               alert("블랙리스트로 선정되었습니다. 로그인 불가");
            } else{
               alert("로그인 되었습니다.");
               if(id=="admin"){
                   location.href = "../manage/index";
                }else{
                   var dest = "${dest}";
                   if (dest != "") {
                      location.href = "${dest}";
                   } else {
                      location.href = "../index";
                   }
                }   
            }
         }
      });
   });
   
   $("#btnKakao").click(function() {
      location.href = "https://kauth.kakao.com/oauth/authorize?client_id=e0e7c8bee72c7c04d50224a121304a09&redirect_uri=http://192.168.0.115:8088/user/oauth&response_type=code";
   });
</script>
</html>