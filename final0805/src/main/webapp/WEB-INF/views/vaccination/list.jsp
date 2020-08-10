<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- JSTL c for each 문 fn 날짜 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG Vaccination</title>
<link rel="shortcut icon" type="image⁄x-icon"   href="/resources/img/page_logo.png">
<!-- jQuery -->
<script src="http://codea.jquery.com/jquery-3.1.1.min.js"></script>
<!-- handlebars -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}

.divWrap {
	overflow:scroll;
	overflow-x:hidden;
}

#vacSub {
	text-align: center;
	margin-bottom:20px;
}
#vac {
	position:absolute;
	top:80%;
	left:62%;
	font-size:13px;
	color:red;
}

#tbl1,#tbl {
	border-collapse: collapse;
	text-align: center;
	margin: auto;
	border: 1px solid #c8c8c8;
}

.vacTitle{
	background:#F39C12;
}

td {
	height:50px;
}

.row:hover {
	background: #ebecee;
	color: black;
}
.price {
	padding-right:30px;
}



#vac1 h1 {
	text-align: center;
	margin-top:80px;
}

#searchBar {
	width:800px;
	height:70px;
	background:#ebecee;	
	margin:auto;
	padding:13px;
	border-radius:10px;
}

#totalPrice {
	width:80px;
	height:40px;
	font-size:18px;
	background:#F25F29;
	border-radius:20px;
	border:none;
	outline:none;
	color:white;
	margin-left:10px;
}

#totalPricePage {
	text-align:center;
	font-size:21px;
	margin-left:576px;
}
</style>
</head>
<body>
   <div class="divWrap">
      <div id="divMenu">
         <jsp:include page="../menu.jsp" />
      </div>
      <div id="divListImg">
         <jsp:include page="../box.jsp" />
         <!-- 광고 이미지 -->
      </div>
      <div id="vac1"><h1>유기동물 필수 접종 예상비용</h1></div>
      <div id="vacSub">우리 아이 병원비는 얼마일까?<br> 똑독에서 확인하고 가세요!</h2></div>
      <span id="vac"> * 부분은 [필수] 부분입니다</span>
      <table id="tbl1" border=1 width=800px>
         <tr class="vacTitle">
            <th width=50><input type="checkbox" id="chkAll"></th>
            <th width=600>접종이름</th>
            <th width=150>가격</th>
         </tr>
         <c:forEach items="${list}" var="vo">
            <tr class="row">
               <td><input type="checkbox" class="chk" value="${vo.price}"></td>
               <td class="inoculationName" width=200>${vo.inoculationName}</td>
               <td class="price" width=100 style="text-align: right;">
               <fmt:formatNumber value="${vo.price}" pattern="#,###원" /></td>
            </tr>
         </c:forEach>
      </table>
      <br>
      <div id=searchBar>
         <input type="button" value="합계" id="totalPrice"> <span
            id="totalPricePage"> <span id="sum"></span>원
         </span>
      </div>
      <br><hr><br>
      
      <jsp:include page="local.jsp" />
      <hr><br>
      <jsp:include page="API.jsp" />
   </div>
   <jsp:include page="../footer.jsp" />
</body>
<script>
   window.scrollBy({
      top : 200,
      left : 0,
      behavior : 'smooth'
   });

   $("#totalPricePage").hide();

   //가격합계
   $("#totalPrice").on("click", function() {
      var totSum = 0;
      if ($(".chk:checked").length > 0) {
         $(".chk:checked").each(function() {
            var row = $(this).parent().parent();
            var price = row.find(".chk").val();
            totSum = totSum + parseInt(price);
         });
         $("#sum").html(totSum);
         $("#totalPricePage").show();
      }
   });

   //전체선택버튼을 클릭할 경우 (B방법)
   $("#tbl1").on("click", "#chkAll", function() {
      if ($(this).prop("checked")) {
         $(".chk").each(function() {
            $(this).prop("checked", true);
         });
      } else {
         $(".chk").each(function() {
            $(this).prop("checked", false);
         });
      }
   });

   //각행의 체크버튼을 클릭한 경우 전체체크 부분이 사라진다
   $("#tbl1").on("click", ".row .chk", function() {
      var sum = 0;
      var isChkAll = true;
      $("#tbl1 .row .chk").each(function() {
         if (!$(this).is(":checked"))
            isChkAll = false;
      });
      if (isChkAll) {
         $("#tbl1 #chkAll").prop("checked", true);
      } else {
         $("#tbl1 #chkAll").prop("checked", false);
      }
   });
</script>

</html>