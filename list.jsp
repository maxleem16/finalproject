<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<title>DDOGDOG DONATION LIST</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<style>
		#divInsert{background:#F39C12;width:900px;height:40px;text-align:center;margin:auto;}
		#divInsert input[type='text'] {border:none;outline:none;border-radius:20px;text-indent:2em;
				height:30px;margin-top:5px;background:#ebecee;}
		#btnInsert{margin-left:20px; padding:0px 10px 0px 10px;}
		#tbl{border:1px solid #c8c8c8;margin-top:10px;margin-bottom:20px; margin:auto;
			border-radius:5px;width:900px;}
		.active{font-weight:bold;text-decoration:none;}
		#pagination2 {text-align:center;}
		#donIMG {position:absolute; top:68%; left:80%;}

	</style>
</head>
<body>
	<div id="divMenu"><jsp:include page="../menu.jsp"/></div>
	<div id="divListImg">
		<jsp:include page="../box.jsp" />
		<!-- 광고 이미지 -->
	</div>
	<h1 style="text-align:center;">
		DONATION FOR OUR DOG
	</h1>
	<div id="donIMG">
		<img src="/resources/img/donation.png"
			style="cursor:pointer;width:90px;height:90px;" id="kakaoInsert">
		<p style="">👆결제하기</p>
	</div>
	<div id="donWrap1">
		<div id="donlistTitle"><h2>후원 목록</h2></div>
		<div id="donSel">
			<form name="frm" action="list">
				<input type="hidden" name="searchType" value="donationMethod">
				<select name="keyword" id="donkeyword" onchange="this.form.submit()">
					<option value=""
						<c:out value="${cri.keyword==''?'selected':''}"/>>후원
					</option>
					<option value="0"
						<c:out value="${cri.keyword=='0'?'selected':''}"/>>댓글후원
					</option>
					<option value="1"
						<c:out value="${cri.keyword=='1'?'selected':''}"/>>결제후원
					</option>
				</select>
			</form>
		</div>
		<span id="donCnt">[총 후원 수: ${pm.totalCount}건]</span>
	</div>
	
	<table border=1 id="don1">
		<tr class="don1title">
			<td>No</td>
			<td>후원금</td>
			<td>후원인</td>
			<td>후원내용</td>
			<td>후원방법</td>
		</tr>
		<c:forEach items="${list}" var="vo">
		<tr class="don1content">
			<td>${vo.donationNo}</td>
			<td><fmt:formatNumber value="${vo.price}" pattern="#,###원"/></td>
			<td>${vo.name}</td>
			<td width="300">${vo.sponsorContent}</td>
			<td>
				<c:if test="${vo.donationMethod==0}">댓글후원</c:if>
				<c:if test="${vo.donationMethod==1}">결제후원</c:if>
			</td>
		</tr>
		</c:forEach>
	</table><br>
	<div id="pagination">
      <c:if test="${pm.prev}">
         <a href="${pm.startPage-1}">◀</a>
      </c:if>
      <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
         <c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active' style="color:red;">${i}</a>]
            </c:if>
         <c:if test="${pm.cri.page != i }">
                [<a href="${i}">${i}</a>]
            </c:if>
      </c:forEach>
      <c:if test="${pm.next}">
         <a href="${pm.endPage+1}">▶</a>
      </c:if>
   </div>
   <hr><br>
   <div id="donlistTitle2"><h2>댓글이 달리면 유기견들에게 후원됩니다</h2>
	[댓글후원금 합계: <fmt:formatNumber value="${tp}" pattern="#,###원"/>]<br>
   </div>
   <div id="don2">
		<input type="hidden" id="donationMethod" value="0">
		<input type="hidden" id="price" value="100">
		<input type="hidden" id="sponsor" value="user01">
		<span id="totcnt2Wrap">[댓글수: <span id="totalCount2"> </span>]</span>
	</div>
	<div id="divInsert">
		<input type="text" id="sponsorContent" size=70 placeholder="댓글을 입력해주세요">
		<button id="btnInsert">✏️</button>
	</div>
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each apply}}
		<div style="border-bottom:1px solid #c8c8c8;padding:5px 0px 5px 15px;">{{sponsorContent}}
		<span style="float:right;padding:5px 15px 5px 0px;color:gray;font-size:13px;">{{name}}</span></div>
	{{/each}}
	</script><br>
	<div id="pagination2"></div><br>
	<jsp:include page="../footer.jsp"/>
</body>
<script>
	var page=1;
	getList();
	
	//댓글목록
	function getList(){
		var donationMethod=$("#donationMethod").val();
		$.ajax({
			type:"get",
			url:"/donation/applyList",
			data:{"donationMethod":donationMethod,"page":page},
			dataType:"json",
			success:function(data){
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				$("#totalCount2").html(data.pm.totalCount);
				
				//댓글페이징
	            var str = "";
	            if (data.pm.prev) {
	               str += "<a href='" + (data.pm.startPage - 1) + "'>◀</a>"
	            }
	            for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
	               if (page == i) {
	                  str += "<a href='" + i + "' class='active'>[" + i
	                        + "]</a>";
	               } else {
	                  str += "<a href='" + i + "'>[" + i + "]</a>";
	               }
	            }
	            if (data.pm.next) {
	               str += "<a href='" + (data.pm.endPage + 1) + "'>▶</a>"
	            }
	            $("#pagination2").html(str);
			}
		});
	}
	
	$("#pagination2").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
	
	//페이징
	$("#pagination a").on("click",function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		var searchType=$(frm.searchType).val();
		var keyword=$(frm.keyword).val();
		location.href="/donation/list?page="+page+"&searchType="+searchType+"&keyword="+keyword;
	});
	
	//Enter key로 입력
    $("#sponsorContent").keydown(function(key){
       if(key.keyCode==13){
         $("#btnInsert").click();
       }
    });
	
	//댓글입력
	$("#btnInsert").on("click", function(){
		var sponsorContent=$("#sponsorContent").val();
		if(sponsorContent==""){
			alert("댓글 내용을 입력하세요!");
			 return;
		}
		var sponsor=$("#sponsor").val();
		var donationMethod=$("#donationMethod").val();
		var price=$("#price").val();
		$.ajax({
			type:"post",
			url:"/donation/insert",
			data:{"sponsorContent":sponsorContent, "sponsor":sponsor,
				"donationMethod":donationMethod,"price":price},
			success:function(){
				alert("입력했습니다!");
				$("#sponsorContent").val("");
				getList();
			}
		});
	});
	
	//결제후원페이지 불러오기	
	$("#kakaoInsert").click(function(){
		window.open('/donation/insert','donation','width=650,height=600,top=100,left=400');
	});
</script>
</html>