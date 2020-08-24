<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <title>DDOGDOG MYPAGE</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
   <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
   <style>

   </style>
</head>
<body>
	<jsp:include page="../menu3.jsp" />
	<div class="menuBox">
		<jsp:include page="../menuTop.jsp" />
		<div class="mplistWrap">
		<div class="MPtext2">내 결제 내역</div>
		<div class="donVal">
			<button class=donationMethod value="">ALL</button>
			<button class=donationMethod value="0">댓글후원</button>
			<button class=donationMethod value="1">결제후원</button>
		</div>
		<table border=1 id="mpDonationList">
			<tr class="mpDonationTitle">
				<td>후원금</td>
				<td>후원인</td>
				<td>후원내용</td>
				<td>후원방법</td>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr class="row">
					<td><fmt:formatNumber value="${vo.price}" pattern="#,###원" /></td>
					<td>${vo.name}</td>
					<td width="300">${vo.sponsorContent}</td>
					<td><c:if test="${vo.donationMethod==0}">댓글후원</c:if> <c:if
							test="${vo.donationMethod==1}">결제후원</c:if></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagination">
			<c:if test="${pm.prev}">
				<a href="${pm.startPage-1}">◀</a>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active'>${i}</a>]
            </c:if>
				<c:if test="${pm.cri.page != i }">
                [<a href="${i}">${i}</a>]
            </c:if>
			</c:forEach>
			<c:if test="${pm.next}">
				<a href="${pm.endPage+1}">▶</a>
			</c:if>
		</div>
		</div>
		
	</div>
	<jsp:include page="../myPageFooter.jsp"/>
</body>
<script>
    
    $("#pagination a").click(function(e){
       e.preventDefault();
       var id=${id};
       var page=$(this).attr("href");
       location.href="/boardList?id="+id+"&page="+page;
    });

  $(".donationMethod").on("click",function(){
     var doantionMethod=$(this).val();
     location.href="/mypage/donation?id="+${id}+"&donationMethod="+doantionMethod;
  });
</script>
</html>