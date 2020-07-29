<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>DDOGDOG BOARD LIST</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
	<script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
}

#listSearch {
	width: 100%;
	height: 70px;
	background: #ebecee;
	text-align: center;
}

.listSelect {
	position: absolute;
	left: 37%;
	top: 62.5%;
}

#listfrm input[type='text'] {
	height: 30px;
	width: 250px;
	position: absolute;
	left: 41%;
	top: 62%;
	background-color: white;
	border-radius: 10px 10px 10px 10px;
	border: 0.5px gray solid;
	outline: none;
}

#listfrm input[type='submit'] {
	background: #F2BB13;
	border-radius: 5px 5px 5px 5px;
	cursor: pointer;
	font-weight: bold;
	height: 30px;
	position: absolute;
	left: 55%;
	top: 62.3%;
	border: none;
	outline: none;
}

#listfrm span {
	position: absolute;
	left: 59%;
	top: 62.5%;;
}

h1 {
	position:relative;
	top:0%;
	left:36%;
	color: #BCAC99;
	width:300px;
}

.divBoardList {
	width: 100%;
	height: 1100px;
	margin: auto;
	position:relative;
	padding-left:250px;
}

#darken-background {position:absolute;top:0px;left:0px;width:100%;
			right:0px; height:100%;	display:none;background:rgba(0, 0, 0, 0.5);
			z-index:10000;overflow-y:scroll;}
#lightbox {width:900px;height:550px;margin:20px auto; margin-top:200px;padding:15px;
			border: 1px solid #333333;border-radius:5px;background:white;
			box-shadow:0px 5px 5px rgba(34, 25, 25, 0.4);text-align:center;}
#lightM{
	float:left;
	width:500px;
	height:500px;
}

#light {
	position:absolute;
	top:20%;
	left:55%;
	text-align:left;
	
}

#light img {
	width:60px;
	border-radius:100%;
}

#lightX .fa-times{
	position:absolute;
	top:0;
	left:90%;
	font-size:40px;
	color:gray;
	cursor:pointer;
}

#lightX .fa-ellipsis-v {
	position:absolute;
	top:35%;
	left:314px;
	font-size:30px;
	color:#c8c8c8;
}

#lightId {
	position:absolute;
	top:5%;
	left:25%;
}

#lightTitle {
	position:relative;
	top:20%;
	left:3%;
}

#lightContent {
	position:relative;
	top:50%;
	left:3%;
}

#lightIn{
	position:relative;
	top:100px;
	left:0;
}

#lightX li {
	float:left;
	
}

#ul {
	position:absolute;
	top:75px;
	left:65%;
	border:1px solid gray;
	text-align:center;
	padding:10px;
	width:90px;
	font-size:12px;
}

#btnUpdate:hover, #btnDelete:hover {
	font-weight:bold;
	font-size:15px;
	cursor:pointer;
	color:#F25F29;
}
</style>
</head>
<body>
	<div id="divMenu">
      <jsp:include page="../menu.jsp" />
    </div>
    <div id="divListImg">
		<jsp:include page="../box.jsp"/>	<!-- 광고 이미지 -->
	</div>

     <div class="divBwrap">
     <div id="listSearch">
      <form action="list" name="frm" id="listfrm" enctype="multipart/form-data">
         <input type="hidden" name="page" value="${cri.page}"> 
         <input type="hidden" name="postingNo"> 
         <select name="searchType" class="listSelect">
            <option value="postTitle"
               <c:out value="${cri.searchType=='postTitle'?'selected':''}"/>>제목</option>
            <option value="writer"
               <c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
            <option value="postContent"
               <c:out value="${cri.searchType=='postContent'?'selected':''}"/>>내용</option>
         </select> 
         <input type="text" name="keyword" value="${cri.keyword}"> 
         <input type="submit" value="SEARCH">
        <span> total: ${pm.totalCount}</span>
      </form>
   </div>
	
	
	<input type="hidden" id="page" value="${cri.page}">
	  <div class="divBoardList">
	  <h1>[게시판 목록]</h1>
      <c:forEach items="${list}" var="vo">
   
         <div class="row">
            <span class="postingNo">${vo.postingNo}</span>
					<div class="divBoardBox">
						<img src="/resources/img/testdog.jpg">
						<div class="divBoardTxt">
							<p id="title">${vo.postTitle}</p>
							<br>
							<hr>
							<p id="id">${vo.writer}</p>
							<p id="time">
								<fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd" />
							</p>
							<p id="content" style="display: none;">${vo.postContent}</p>

						</div>
					</div>
				</div>
		<div id="darken-background">
			<div id="lightbox">
				<img src="/resources/img/1.jpg" width=500 id="lightM" />
				<div id="light">
					<div><img src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg"></div>
					<div id="lightId">작성자</div>
					<hr>
					<div id="lightTitle">글 제목</div>
					<div id="lightContent">글 내용</div>
					
					<div id="lightIn">
						<hr>
						<jsp:include page="../reply/reply.jsp" ></jsp:include>
					</div>
					<div id="lightX">
						<i class="fas fa-ellipsis-v"></i>
						
							<div id="ul">
								<div id="btnUpdate"><a>수정하기</a></div><hr>
								<div id="btnDelete"><a>삭제하기</a></div>
								<span class="postingNo" style="display:none;">${vo.postingNo}</span>
							</div>
						
						<i class="fas fa-times"></i>
					</div>
				</div>
			</div>
		</div>

		</c:forEach>
  </div>
   <input id="btnBoardInsert" value="게시물작성 " type="button"></input>
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

   </div>	<!-- divWrap -->
</body>
<script>
	$(".row").on("click", function(){
		var id=$(this).find("#id").html();
		var title=$(this).find("#title").html();
		var content=$(this).find("#content").html();
		
		$("#lightId").html(id);
		$("#lightTitle").html(title);
		$("#lightContent").html(content);
		$("#darken-background").show();
	});
	$("#ul").hide();
	$(".fa-ellipsis-v").mouseover(function(){
		$("#ul").show();
	});
	
	$(".fa-ellipsis-v").on("click", function(){
		$("#ul").hide();
	});
	
	$("#btnDelete").on("click", function(){
		if(!confirm("삭제하시겠습니까?"))return;
		var postingNo=$(this).parent().find(".postingNo").html();
		alert(postingNo);
		$.ajax({
			type:"get",
			url:"/board/replyCount",
			data:{"postingNo":postingNo},
			success:function(data){
				if(data==0){
					frm.action="delete";
					frm.submit();
					alert("삭제완료!");
				}else{
					alert("리플이" + data + "개 달려있어서 삭제 불가능");
				}
			}
		});

	});

	$(".fa-times").on("click", function(){
		$("#darken-background").hide();
	});
	
	$("#btnBoardInsert").on("click",function(){
		location.href="insert";
	});
	/*
	$(".row").on("click", ".divBoardBox", function(){
		var postingNo=$(this).parent().find(".postingNo").html();
		var page=$("#page").val();
		location.href="read?postingNo="+postingNo+"&page="+page;
	});
	*/
	$("#pagination a").click(function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		location.href="list?page="+page;
	});
</script>
</html>