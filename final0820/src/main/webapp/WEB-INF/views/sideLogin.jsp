<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>side login</title>
<script src="http://codea.jquery.com/jquery-3.1.1.min.js"></script>
<style>


input[id*="answer"]{
	display:none;
}
input[id*="answer"] + label{
	display:block;
	padding:10px 5px 10px 25px;
	border-bottom:0;
	background:#ebecee;
	color:black;
	font-weight:900;
	cursor:pointer;
	position:relative;
	width:210px;
}

input[id*="answer"] + label + div {
	width:240px;
	max-height:0;
	transition:all .35s;
	overflow:hidden;
	background:#e3e4e6;
	font-size:13px;
}

input[id*="answer"] + label + div p {
	display:inline-block;
	padding:10px 0px 10px 25px;
	cursor:pointer;
}
input[id*="answer"]:checked + label + div {max-height:600px;}
input[id*="answer"]:checked + label em {background-position:0 -30px;}

#d {
	width:200px;
	background:red;
}

body {
  background: red;
  font-size: 62.5%;
}

.container {
  padding: 2em;
}

/* GENERAL BUTTON STYLING */
#divImgBtn,
#divImgBtn::after {
  -webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
  -o-transition: all 0.3s;
	transition: all 0.3s;
}

#divImgBtn {
  background: none;
  border: 3px solid #fff;
  border-radius: 5px;
  color: #fff;
  display: block;
  font-size: 1.6em;
  font-weight: bold;
  margin: 1em auto;
  padding: 2em 6em;
  position: relative;
  text-transform: uppercase;
}

#divImgBtn::before,
#divImgBtn::after {
  background:pink;
  content: '';
  position: absolute;
  z-index: -1;
}

#divImgBtn:hover {
  color: #FA3313;
}

/* BUTTON 2 */
#divImgBtn::after {
  height: 100%;
  left: 0;
  top: 0;
  width: 0;
}

#divImgBtn:hover:after {
  width: 100%;
}

/* BUTTON 3 */
.btn-3::after {
  height: 0;
  left: 50%;
  top: 50%;
  width: 0;
}

.btn-3:hover:after {
  height: 100%;
  left: 0;
  top: 0;
  width: 100%;
}

.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

#divDogBtn{
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #fff;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

#divDogBtn:hover {
  background-color: #2EE59D;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}

#menu {
    width: 460px;
    margin: 40px auto;
    background: #f3f3f3;
    border: 1px solid #d8d8d8;
    text-align: center;
}
#menu div {
    position: relative;
    display: inline-block;
}

span {
    display: block;
    width: 80px;
    padding: 2px 16px;
    cursor: pointer;
}
.arrow_box {
  display: none;
  position: absolute;
  width: 100px;
  padding: 8px;
  left: 0;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
}

.arrow_box:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 0;
  margin-left: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: " ";
}

span:hover + p.arrow_box {
  display: block;
}
</style>

</head>
<body>

<div id="d">dddd</div>
	<div class="accordion"><h1>MYPAGE</h1>
		<div class="inacc">
			<input type="checkbox" id="answer01">
			<label for="answer01">회원정보<em></em></label>
			<div>
				<p>회원정보수정</p><br>
				<p>회원탈퇴</p>
			</div>
			<input type="checkbox" id="answer02">
			<label for="answer02">입양관리<em></em></label>
			<div>
				<p>입양신청내역</p><br>
				<p>상담예약확인</p><br>
				<p>내가찜한아이들</p>
			</div>
			<input type="checkbox" id="answer03">
			<label for="answer03">내가쓴글<em></em></label>
			<div>
				<p>자유게시판</p><br>
				<p>실종신고</p><br>
				<p>유기제보</p>
			</div>
			<input type="checkbox" id="answer04">
			<label for="answer04">후원금<em></em></label>
			<div>
				<p>내가 후원한 내역</p>
			</div>
			<input type="checkbox" id="answer05">
			<label for="answer05">1:1문의<em></em></label>
			<div>
				<p>내가 문의한 내역</p>
			</div>
		</div>
	</div>
	<div class="container">
  		<button id="divImgBtn">입양하기</button>
	</div>

	<div class="wrap">
		<button id="divDogBtn">Submit</button>
	</div>
	
	<div id="menu">
  <div> <span>メニュー1</span>
    <p class="arrow_box">ふきだし1</p>
  </div>
  <div> <span>メニュー2</span>
    <p class="arrow_box">ふきだし2</p>
  </div>
  <div> <span>メニュー3</span>
    <p class="arrow_box">ふきだし3</p>
  </div>
</div>
</body>
<script>

</script>
</html>