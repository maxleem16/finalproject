<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
#wholePage {
	width: 1800px;
	background: lightgray;
	margin: auto;
	overflow: hidden;
}

#divDogList {
	float:right;
	width: 1360px;
	margin-top: 10px;
	margin-right: 10px;
}

.m_divListbox {
	width: 230px;
	height: 230px;
	margin: 10px;
	padding: 20px;
	margin-left: 60px;
	color: black;
	float: left;
	font-size: 18px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	overflow: hidden;
	background-size: 100% 100%;
}

#sidebar {
	float:left;
	width: 400px;
	height:1500px;
	margin: 10px;
	margin-right:0px;
	background: white;
	text-align: center;
	padding: 10px;
}

.m_divListContents {
	width: 210px;
	height: 210px;
	padding: 10px;
	background-color: rgba(255, 255, 255, 0.5);
	background: white;
}
#pagination{
	width:1200px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="divDogList">
			<c:forEach items="${list}" var="vo">
				<div class="m_divListbox"
					style="background-image:url('${vo.dogImage}');">
					<div class="m_divListContents">
						<span class="dogCode">${vo.dogCode}
						</span><br> ${vo.species}<br> ${vo.age}살<br>
						<c:if test="${vo.gender == 0}">
                       		남아
                 		</c:if>
						<c:if test="${vo.gender == 1}">
                    	 	여아
                  		</c:if>
						<br>
						<c:if test="${vo.adoptStatus == 0}">
                       	 	입양대기
                 		</c:if>
						<c:if test="${vo.adoptStatus == 1}">
                   	  		입양완료
                 		</c:if>
						<br>
						<button class="btnUpdate">정보수정</button>
					</div>
				</div>
			</c:forEach>
			<div id="pagination">
			<c:if test="${pm.prev}">
				<a href="${pm.startPage-1}">◀</a>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:if test="${pm.cri.page==i}">
					<a href="${i}" class="active">[${i}]</a>
				</c:if>
				<c:if test="${pm.cri.page!=i}">
					<a href="${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			<c:if test="${pm.next}">
				<a href="${pm.endPage+1}">▶</a>
			</c:if>
		</div>
		</div>
		
	</div>
</body>
<script>
	$("#pagination a").on("click", function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "dogList?page=" + page;
	});
	$(".btnUpdate").on("click",function(){
		var dogCode=$(this).parent().find(".dogCode").html();
		location.href="dogRead?dogCode="+dogCode;
	});
</script>
</html>