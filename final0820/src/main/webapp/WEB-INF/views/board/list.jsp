<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DDOGDOG BOARD LIST</title>
<link rel="shortcut icon" type="image⁄x-icon"
	href="/resources/img/page_logo.png">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
#btnSearch {
	background: #F2BB13;
	border-radius: 5px 5px 5px 5px;
	cursor: pointer;
	font-weight: bold;
	height: 30px;
	position: absolute;
	left: 57%;
	top: 61%;
	border: none;
	outline: none;
}

h1 {
	position: relative;
	top: 0%;
	left: 36%;
	color: #BCAC99;
	width: 300px;
}

.lightIn {
	position: relative;
	top: 200px;
	left: 0;
	width: 100%;
}

.lightX li {
	float: left;
}

iframe {
	border: none !important;
}

#ul {
	position: absolute;
	top: 0;
	left: 51%;
	border: 1px solid gray;
	text-align: center;
	padding: 10px;
	width: 90px;
	font-size: 12px;
}

#btnUpdate:hover, #btnDelete:hover {
	font-weight: bold;
	font-size: 15px;
	cursor: pointer;
	color: #F25F29;
}

#btnUpdate2 {
	position: absolute;
	top: 170px;
	left: 85%;
}

#uplightbox .lightIn {
	text-align: left;
}

.pagination {
	text-align: center;
	margin-bottom: 50px;
}

.pagination li {
	display: inline;
	vertical-align: middle;
}

.pagination li a {
	display: -moz-inline-stack; /*FF2*/
	margin-right: 3px;
	padding: 5px 10px 5px 10px;
	width: 20px;
	height: 15px;
	font-weight: 700;
	font-size: 13px;
	color: #000;
	border: 1px solid #c8c8c8;
	border-radius: 100%;
	text-align: center;
	text-decoration: none;
}

.pagination li a.now {
	color: #fff;
	background-color: #F2BB13;
	border: 1px solid #F2BB13;
}

.pagination li a:hover, .pagination li a:focus {
	color: #fff;
	border: 1px solid #F2BB13;
	background-color: #F2BB13;
}
</style>
</head>
<body>
	<div id="divMenu">
		<jsp:include page="../menu.jsp" />
	</div>
	<div id="divListImg">
		<jsp:include page="../box.jsp" />
		<!-- 광고 이미지 -->
	</div>

	<div class="divBwrap">
		<div id="listSearch">
			<div id="listfrm">
				<input type="hidden" id="page" value="${cri.page}"> <input
					type="hidden" id="postingNo"> <select id="searchType"
					class="listSelect">
					<option value="postTitle"
						<c:out value="${cri.searchType=='postTitle'?'selected':''}"/>>제목</option>
					<option value="writer"
						<c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
					<option value="postContent"
						<c:out value="${cri.searchType=='postContent'?'selected':''}"/>>내용</option>
				</select> <input type="text" id="keyword" value="${cri.keyword}"> <input
					type="button" value="SEARCH" id="btnSearch">
			</div>
		</div>
		<input type="hidden" id="page" value="${cri.page}">
		<div class="divBoardList">
			<c:forEach items="${list}" var="vo">
				<div class="row">
					<span class="postingNo">${vo.postingNo}</span>
					<div class="divBoardBox">
						<img src="/display?fileName=${vo.image}">
						<div class="divBoardTxt">
							<p id="title">${vo.postTitle}</p>
							<br>
							<hr>
							<p id="writer">${vo.writer}</p>
							<p id="time">
								<fmt:formatDate value="${vo.preperationTime}"
									pattern="yyyy-MM-dd" />
							</p>
							<p id="content" style="display: none;">${vo.postContent}</p>
						</div>
					</div>
				</div>
			</c:forEach>
			<div id="darken-background">
				<div id="lightbox">
					<span id="lightimage"></span>
					<div id="light">
						<div class="profileImg">
							<img
								src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg">
						</div>
						<div id="lightForm">
							<div id="lightWriter">작성자</div>
							<hr>
							<div id="lightTitle"
								style="font-weight: 600; margin-bottom: 20px;">글 제목</div>
							<div id="lightContent" style="font-size: 13px;">글 내용</div>
						</div>

						<div class="lightIn">
							<hr>
							<iframe src="" width="330px" height="270px"></iframe>
						</div>

						<div class="lightX">
							<span class="icon1">👀</span>
							<div id="ul">
								<div id="btnUpdate">
									<a>수정하기</a>
								</div>
								<hr>
								<div id="btnDelete">
									<a>삭제하기</a>
								</div>
								<input id="readNo" style="display: none;" type="text">
							</div>
							<span class="icon2"> ❌</span>
						</div>
					</div>
				</div>
			</div>
			<!-- update lightbox -->

			<form action="update" name="frm" method="post"
				enctype="multipart/form-data">
				<div id="darken-background2">
					<div id="uplightbox">
						<input type="file" name="file" id="file"> <span
							id="updateImage"></span> <input type="hidden" name="image">
						<div class="uplight">
							<div class="profileImg">
								<img
									src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg">
							</div>
							<div id="updateForm">
								<div id="postWriter"></div>
								<hr>
								<div>
									<input type="text" id="postTitle" name="postTitle">
								</div>
								<input class="postingNo" name="postingNo" id="updateNo"
									style="display: none;" type="text">
								<div style="font-size: 11px;">
									<textarea id="postContent" name="postContent"></textarea>
								</div>
							</div>
							<input type="submit" value="수정" id="btnUpdate2">
							<div class="lightIn">
								<hr>
							</div>
							<div class="lightX">
								<span class="icon2"> ❌</span>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<input id="btnBoardInsert" value="게시물작성 " type="button"></input>
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

	</div>
	<!-- divWrap -->
</body>
<script>
$("#keyword").keydown(function(key){
	if(key.keyCode==13){
		$("#listfrm").find("#btnSearch").click();
	}
});

	$(".pagination li").on("click", "a", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "list?page=" + page;
	});

	$("#ul").hide();

	$(document).ready(function() {

		icon = $('.icon1'); //버튼 아이디 변수 선언
		ul = $('#ul'); //레이어 아이디 변수 선언
		icon.click(function() {
			ul.toggle(function() {
				ul.addClass('show')
			}, //클릭하면 show클래스 적용되서 보이기
			function() {
				ul.addClass('hide')
			} //한 번 더 클릭하면 hide클래스가 숨기기
			);
		});
	});

	$("#listfrm").on(
			"click",
			"#btnSearch",
			function() {
				var searchType = $(this).parent().find("#searchType").val();
				var keyword = $(this).parent().find("#keyword").val();
				//alert(searchType+keyword);
				location.href = "list?searchType=" + searchType + "&keyword="
						+ keyword;
			});

	$("#updateImage").on("click", function() {
		$(frm.file).click();
	});

	$(frm.file).on("change", function() {
		var file = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});

	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("수정하시겠습니까?"))
			return;
		frm.submit();
		alert("수정완료!");
	});

	$("#btnUpdate").on("click", function() {
		$("#darken-background").hide();
		$("#darken-background2").fadeIn();
	});

	$(".divBoardList .row")
			.on(
					"click",
					function() {
						var postingNo = $(this).find(".postingNo").html();
						var id = $
						{
							id
						}
						;
						var writer = $(this).find("#writer").html();
						if (id != writer) {
							$(".icon1").hide();
							$("#btnUpdate").hide();
							$("#btnDelete").hide();
							$("#ul").hide();
						} else {
							$(".icon1").show();

						}
						$
								.ajax({
									type : "get",
									url : "/board/read",
									data : {
										"postingNo" : postingNo
									},
									dataType : "json",
									success : function(data) {
										if (data.image != '') {
											$("#lightimage")
													.html(
															"<img src='/display?fileName="
																	+ data.image
																	+ "' width=500 id='lightM'>");
											$("#updateImage")
													.html(
															"<img src='/display?fileName="
																	+ data.image
																	+ "' width=500 id='image'>");
										} else {
											$("#lightimage")
													.html(
															"<img src='http://placehold.it/100x80' width=500 id='lightM'>");
											$("#updateImage")
													.html(
															"<img src='http://placehold.it/100x80' width=500 id='image'>");
										}
										$("#lightWriter").html(data.writer);
										$("#lightTitle").html(data.postTitle);
										$("#lightContent").html(
												data.postContent);

										$("#postWriter").html(data.writer);
										$("#postTitle").val(data.postTitle);
										$("#postContent").val(data.postContent);

										$("#updateNo").val(postingNo);
										$("#readPostNo").val(postingNo);
										$("#readNo").val(postingNo);

										$("iframe").attr(
												"src",
												"/reply/reply?postingNo="
														+ postingNo);

									}
								});
						$("#darken-background").show();
					});

	$("#btnDelete").on("click", function() {
		if (!confirm("삭제하시겠습니까?"))
			return;
		var postingNo = $(this).parent().find("#readNo").val();
		$.ajax({
			type : "post",
			url : "/board/replyCount",
			data : {
				"postingNo" : postingNo
			},
			success : function(data) {
				if (data == 0) {
					$.ajax({
						type : "post",
						url : "/board/delete",
						data : {
							"postingNo" : postingNo
						},
						success : function() {
							location.href = "/board/list";
							alert("삭제가 완료되었습니다.");
						}

					});
				} else {
					alert("리플이" + data + "개 달려있어서 삭제 불가능");
				}
			}
		});

	});

	$(".icon2").on("click", function() {
		$("#darken-background").hide();
		$("#darken-background2").hide();
	});

	$("#btnBoardInsert").on("click", function() {
		var id = "${id}";
		if (id == "") {
			alert("로그인 후 이용하세요.");
			location.href = "/user/login";
		} else {
			location.href = "insert";
		}
	});
	/*
	 $(".row").on("click", ".divBoardBox", function(){
	 var postingNo=$(this).parent().find(".postingNo").html();
	 var page=$("#page").val();
	 location.href="read?postingNo="+postingNo+"&page="+page;
	 });
	 */
</script>
</html>