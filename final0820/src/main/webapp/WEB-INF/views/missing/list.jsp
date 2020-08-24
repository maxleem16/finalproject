<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

<title>DDOGDOG MISSING LIST</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700&display=swap');
.reportNo, .reportNo a, .reportNo2,.reportNo1, .reportNo1 a{
   font-family: 'Nanum Myeongjo', serif;
   font-weight:bold;
}
#btnInsert {
	margin-left:1270px;
	cursor:pointer;
	background:#F2BB13;		
	height:36px;
	width:100px;
	border-radius: 5px 5px 5px 5px;
	font-size:14px;
	border: none;
	outline: none;
	font-weight:700;
}


#pagination {
	position:relative;
	top:10px;
}

#footer {
	position:relative;
	top:50px;
}
.pagination {
   text-align:center;
   margin-bottom:50px;
}
.pagination li {
   display:inline;
   vertical-align:middle;
}
.pagination li a {
   display:-moz-inline-stack;   /*FF2*/
   margin-right:3px;
   padding:5px 10px 5px 10px;
   width:20px ;
   height:15px;
   font-weight:700;
   font-size:13px;
   color:#000;
   border:1px solid #c8c8c8;
   border-radius:100%;
   text-align:center;
   text-decoration:none;

}
.pagination li a.now {
   color:#fff;
   background-color:#F2BB13;
   border:1px solid #F2BB13;
}
.pagination li a:hover, .pagination li a:focus {
   color:#fff;
   border:1px solid #F2BB13;
   background-color:#F2BB13;
}

</style>
	
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp"/>
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp"/>	<!-- 광고 이미지 -->
	</div>
	
	<div id="MlistSearch">
		<form name="frm" action="list" id="listfrm">
			<select name="searchType" class="listSelect">
				<option value="missingLocation" <c:out value="${cri.searchType=='missingLocation'?'selected':''}"/>>
					실종위치
				</option>
				<option value="writer" <c:out value="${cri.searchType=='writer'?'selected':''}"/>>
					작성자
				</option>
				<option value="feature" <c:out value="${cri.searchType=='feature'?'selected':''}"/>>
					특징
				</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}">
			<input type="submit" value="SEARCH">
			<span>total: ${pm.totalCount}</span>
		</form>	
	</div>
	<div class="divMissingwrap">
		<div id="missingTitle">
			<h1>📣 긴급 찾습니다 </h1>
			<p>똑독에서 현재 <b style="color:red; font-size:20px;">${pm.totalCount}</b>건의 강아지 실종 공고가 등록중입니다.</p>
		</div>
		<input type="button" id="btnInsert" value="게시물작성">
		<div class="divMissingList">
		
		<c:forEach items="${list}" var="vo">
		
			<div class="missingbox">
				<div class="reportWrap">
					<div class="reportNoWrap">
						<div class="reportNo">${vo.reportNo}</div>
						<div class="reportNo2">Missing No.</div>				
					</div>
					<div class="missing1">
						<div class="missingtitle"><a href="read?reportNo=${vo.reportNo}"> ${vo.title }</a></div>
						<div class="missingfeature"> ${vo.feature}</div>
					</div>
					<div class="missingtxt">
						<span><b>작성자</b> : ${vo.writer}</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<span><b>실종일자 </b>: ${vo.missingTime}</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<span><b>실종 장소 </b>: ${vo.missingLocation}</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
						<span><b>사례금 </b>: 
						<fmt:formatNumber value="${vo.reward}" pattern="#,###"></fmt:formatNumber>

						</span>
					</div>
				</div>
				<span class="missingboxImg">
					<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
						<img src="/display?fileName=${vo.dogImage}" width=250 height=160>
					</c:if>
					<c:if test="${vo.dogImage==null || vo.dogImage==''}">
						<img src="http://placehold.it/250x160" width=250 height=160>
					</c:if>
				</span>
			</div>
		</c:forEach>
		
		
		</div>
	</div>
	
	<div class="sideM">
		<div class="sideMtitle">강아지를 잃어버렸을 때 대처 방법</div>
		<div class="sideM1">1. 사람들이 많이 찾고보는 온라인 유기견 사이트에 강아지 분실 신고를 합니다.</div>
		<div class="sidec1">
			먼저 저희 유기견 보호센터에 등록을 안하셨다면 지금 바로 해주시기 바랍니다.<br>
			<p style="color:red;font-weight:600;text-align:center;cursor:pointer;" onClick="location.href='/missing/insert'">똑독 유기견 보호센터 실종 신고 등록하기</p><br>
			저희 똑독은 국내 유기견 실종신고 및 많은 분들이 찾아주는 사이트입니다.<br>
			이미 수천명의 견주가 다행히 저희 똑독을 통해 직, 간접적으로 반려견을 찾으셨습니다.
		</div>
		<div class="sideM2">2. 전단지를 제작해서 분실 장소를 기점으로 배포해주시기 바랍니다 [가장 중요함]</div>
		<div class="sidec2">
			강아지는 한 곳에 머물지 않고, 여러 곳으로 돌아다닐 가능성이 높습니다.<br>
			주인이 직접 찾는 경우도 있지만 거의 대부분 제보를 통해서 강아지를 찾게 됩니다. <br><br>
			강아지를 찾은 경우에는 꼭! 전단지를 수거하시기 바랍니다.
		</div>
		<div class="sideM3">3. 근처 동물병원, 보호시설, 파출서, 소방서, 공공 기관등에 연락을 해보시고 직접 찾아가주세요</div>
		<div class="sidec3">
			보호시설에 유기견이 들어오더라도 공사는 실시간으로 업데이트가 되지 않습니다.<br>
			동물 보호 관리 시스템 외에도 각종 동물병원이나 알려지지 않은 자선 보호 시설들이 많습니다.<br><br>
			해당 지역 구청이나 시청등에서도 운영하는 경우가 많으니 꼭 알아보시고 연락을 해보시기 바랍니다.
		</div>
	</div>	
	
	<ul class="pagination">
         <c:if test="${pm.prev}">
            <li><a href="${pm.startPage-1}"> <span>«</span></a></li>
         </c:if>
         <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
            <c:if test="${pm.cri.page == i }">
               <li class="active"><a href="${i}">${i}</a></li>
            </c:if>
            <c:if test="${pm.cri.page != i }">
               <li class="page"><a href="${i}">${i}</a></li>
            </c:if>
         </c:forEach>
         <c:if test="${pm.next}">
            <li><a href="${pm.endPage+1}"> <span>»</span></a></li>
         </c:if>
      </ul>
   
	<div id="footer">
	   <jsp:include page="../footer.jsp"/>
	</div>
</body>
<script>

	//글쓰러가기 버튼
	$("#btnInsert").on("click",function(){
	    var id="${id}";
	    if(id==""){
	       alert("로그인 후 이용하세요.");
	       location.href="/user/login";
	    }else{
	       location.href="insert";
	    }   
	 });
	
	
	//페이징
	$(".pagination a").click(function(e) {
      e.preventDefault();
      var page = $(this).attr("href");
      location.href = "list?page=" + page;
   });

</script>
</html>