<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글목록</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<style>
.divContent {
	width: 500px;
	padding: 10px;
	background: gray;
	color: white;
	border: 1px solid black;
	maring-bottom: 20px;
	border: 1px;
	font-size: 10px;
}

#divInput {
	
}
</style>
</head>
<body>
<div id="divInput">
		전체글:<span id="count"></span>
		<input type="text" id="txtReply">
		<button id="btnInsert">입력</button>
	</div>
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<div class="divContent">
		<div class="preperationTime">
			[<b>{{preperationTime}}</b>]
			<button commentNo={{commentNo}}>삭제</button>
		</div>
		<div class="commentContent">{{commentContent}}</div>
		<div class="writer">{{writer}}</div>
		</div>
	{{/each}}
	</script>
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
</body>
<script>
var page = 1;
var postingNo="${vo.postingNo}";
getList();
function getList() {
	$.ajax({
		type : "post",
		url : "/reply/list",
		data:{"page":page, "postingNo":postingNo},
		dateType : "json",
		success : function(data) {
			var temp = Handlebars.compile($("#temp").html());
			$("#replies").html(temp(data));
			//페이지 리스트 출력
			var str = "";
			if (data.pm.prev) {
				str += "<a href='" + (data.pm.startPage - 1) + "'>◀</a>"
			}
			for (var i = data.pm.startPage; i <= data.pm.endPage; i++) {
				if (page == i) {
					str += "[<a href='" + i + "' class='active'>" + i
							+ "</a>]";
				} else {
					str += "[<a href='" + i + "'>" + i + "</a>]";
				}
			}
			if (data.pm.next) {
				str += "<a href='" + (data.pm.endPage + 1) + "'>▶</a>"
			}
			$("#pagination").html(str);
			//전체 데이타 출력
			$("#total").html(data.pm.totalCount);
		}
	});
}
//페이지 번호를 클릭했을 경우
$("#pagination").on("click", "a", function(e){
	e.preventDefault();
	page = $(this).attr("href");
	getList();
});
</script>
</html>