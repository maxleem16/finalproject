<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<title>DDOGDOG REPORT LIST</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700&display=swap');
.reportNo, .reportNo a, .reportNo2,.reportNo1, .reportNo1 a{
   font-family: 'Nanum Myeongjo', serif;
   font-weight:bold;
}	
#RlistSearch {
	background: #ebecee;
	height: 75px;
}


#btnInsert {
	margin-left:1270px;
	font-weight:700;
	cursor:pointer;
	background:#F2BB13;		
	height:36px;
	width:100px;
	border-radius: 5px 5px 5px 5px;
	font-size:14px;
	border: none;
	outline: none;
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
	<div id="RlistSearch">
		<form name="frm" action="list" id="listfrm">
			<input type="hidden" id="page" name="page" value="${cri.page}">
			<input type="hidden" name="bno">
			<select name="searchType" class="listSelect">
				<option value="foundLocation" <c:out value="${cri.searchType=='foundLocation'?'selected':''}"/>>발견지역</option>
				<option value="writer" <c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
				<option value="feature" <c:out value="${cri.searchType=='feature'?'selected':''}"/>>내용</option>
			</select>
			<input type="text" name="keyword" value="${cri.keyword}"/>
			<input type="submit" value="SEARCH">
			<span>total:${pm.totalCount}</span>
		</form>
	</div>
	<div class="divMissingwrap">
		<div id="reportTitle">
			<h1>📢 제보합니다 </h1>
			<p>똑독에서 현재 <b style="color:red; font-size:20px;">${pm.totalCount}</b>건의 강아지 제보 공고가 등록중입니다.</p>
		</div>
		<input id="btnInsert" value="게시물작성 " type="button"></input>
		<div class="divMissingList">
		
		<c:forEach items="${list}" var="vo">
		
			<div class="missingbox1">
				<div class="reportWrap">
				<div class="reportNoWrap">
					<div class="reportNo1">${vo.foundNo}</div>
					<div class="reportNo2">Missing No.</div>
				</div>
				<div class="missing1">
					<div class="missingtitle"><a href="read?foundNo=${vo.foundNo}"> [<b>${vo.foundLocation}</b>]에서 발견한 강아지를 제보합니다</a></div>
					<div class="missingfeature"> ${vo.feature}</div>
				</div>
				
				<div class="missingtxt">
					<span><b>작성자</b> : ${vo.writer}</span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<span><b>작성날짜 </b>:<fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd"/></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<span><b>실종날짜 </b>:${vo.foundTime}</span>
				</div>
				</div>
				<span class="missingboxImg">
					<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
						<img src="/display?fileName=${vo.dogImage}" width=250 height=160>
					</c:if>
					<c:if test="${vo.dogImage==null || vo.dogImage==''}">
						<img src="http://placehold.it/100x80"width=250 height=160>
					</c:if>
				</span>
			</div>
		</c:forEach>
		</div>
	</div>
		<div class="sideR">
		<div class="sideRtitle">잃어버린 강아지를 발견했을 때</div>
		<div class="sideR1">막 발견했을 때 모습을 찍어둡니다.</div>
		<div class="sider1">
			실종당시의 모습과 가장 유사하기 때문에 주인이 더 쉽게 알아볼 수 있습니다.<br>
			그리고 가장 먼저 저희 유기견 보호센터에 등록을 안하셨다면 지금 바로 해주시기 바랍니다.<br>
			<p style="color:#3359a6;font-weight:600;text-align:center;cursor:pointer;" onClick="location.href='/infoReport/insert'">똑독 유기견 보호센터 유기 제보 등록하기</p><br>
			저희 똑독에만 올려주셔도 온라인상에서 강아지 주인이 검색하시고자 하신다면 찾아볼 수 있습니다.<br>
			
		</div>
		
		<div class="sideRtitle">오랜 시간 주인을 찾지 못할 경우</div>
		<div class="sider1">  만약 안타깝게도 오랜시간동안 보호하고 있는 강아지의 주인을 찾아주지 못한다면, 선택안은 몇가지 없습니다.<br>
			<b style="color:#3359a6;font-weight:600;">직접 강아지를 키우는 경우</b>가 있지만 이 경우는 개인적인 상황에 따라 힘든 경우가 많습니다.<br><br>
			<b style="color:#3359a6;font-weight:600;">두 번째는 입양을 보내는 경우</b>입니다만, 상황에 따라 반복되어 버려지는 경우가 생길 수 있습니다 <br>
			신중을 기해주시기 바랍니다 <br><br>
			<b style="color:#3359a6;font-weight:600;">마지막으로 보호시설에 맡기는 경우</b>입니다 <br>
			실제로 분실 강아지를 발견시에는 바로 시, 군청 소속의 보호시설에 신고를 하는 게 원칙입니다 <br>
			하지만 보호시설의 특성상 7~15일 정도 공개 공시를 한 후에 주인을 찾지 못하는 경우는 거의 대부분 안락사를 선택하게 됩니다 <br><br>
			물론, 정답은 없습니다 <br><br>
			꼭 인연이 닿아 제보하신 강아지가 주인의 품에 잘 전달되길 바랍니다.
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
	
	$(".divReportList").on("click",".Reportbox",function(){
		var foundNo=$(this).find(".foundNo").html();
		var page=$("#page").val();
		location.href="read?foundNo="+foundNo+"&page="+page;
	});
</script>
</html>