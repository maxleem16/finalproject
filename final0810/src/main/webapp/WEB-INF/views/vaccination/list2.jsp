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
<!-- jQuery -->
<script src="http://codea.jquery.com/jquery-3.1.1.min.js"></script>
<!-- handlebars -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
h2 {
   text-align: center;
}

p {
   text-align: center;
   margin: auto;
}

#search {
   margin: auto;
}

.vacTitle{
	background:#ebecee;
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
      <h1>접종예상 비용</h1>
      <h2>접종 리스트</h2>
      <p>
         <b>★부분은 [필수] 부분입니다</b>
      </p>
      <table id="tbl1" border=1 width=800px
         style="text-align: center; margin: auto;">
         <tr class="vacTitle">
            <th width=50><input type="checkbox" id="chkAll"></th>
            <th width=600>접종이름</th>
            <th width=150>가격</th>
         </tr>
         <c:forEach items="${list}" var="vo">
            <tr class="row">
               <td><input type="checkbox" class="chk" value="${vo.price}"></td>
               <td class="inoculationName" width=200>${vo.inoculationName}</td>
               <td class="price" width=100 style="text-align: right;"><fmt:formatNumber
                     value="${vo.price}" pattern="#,###원" /></td>
            </tr>
         </c:forEach>
      </table>
      <br>
      <div id=search>
         <input type="button" value="합계" id="totalPrice"> <span
            id="totalPricePage"> <span id="sum"></span>원
         </span>
      </div>
      <br>
      <h1>병원리스트</h1>
      <jsp:include page="local.jsp" />
      <br>
      <jsp:include page="API.jsp" />
      <a href="#" id="aTop"> <img src="/resources/img/top.jpg">
      </a>
   </div>
</body>
<script>
   window.scrollBy({
      top : 1000,
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
<jsp:include page="../footer.jsp" />
</html>