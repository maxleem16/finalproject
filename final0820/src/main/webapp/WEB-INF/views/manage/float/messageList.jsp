<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
h4 {
	font-family: 'Binggrae-Bold';
	text-align: center;
	font-stretch: ultra-condensed;
	text-transform: uppercase;
	font-stretch: ultra-condensed;
}

h2 {
	font-family: 'Binggrae-Bold';
	text-align: center;
	font-stretch: ultra-condensed;
	text-transform: uppercase;
	font-stretch: ultra-condensed;
}

#tblMessageList {
	border-collapse: collapse;
	margin: auto;
}

#tblMessageList .title {
	background-color: #f1bb13;
}

#tblMessageList .row:nth-child(2n+1) {
	background-color: lightgray;
}

#unchecked {
	height: 20px;
	width: 22px;
	font-size: 15px;
	border-radius: 50%;
	display: inline-block;
	background: #DF3A01;
	color: white;
	padding-bottom: 1px;
	padding-top: 1px;
}

.row td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}


</style>
<body>
	<h4>
		1:1 문의 내역 ✉
		<c:if test="${unReadMessage ne 0}">
			<span id="unchecked">${unReadMessage}</span>
		</c:if>
	</h4>
	<table id="tblMessageList"></table>
	<script id="temp" type="text/x-handlebars-template">
		<tr class="title">
			<td width=100px>title</td>
			<td>user</td>
			<td>date</td>
		</tr>
		{{#each list}}
		<tr class="row">
			<td>{{title}}</td>
			<td>{{sender}}</td>
			<td>{{sendDate}}</td>
		</tr>
		{{/each}}
</script>
	<a href="/manage/messageList">더보기🔽</a>
</body>
<script>
	getList();
	function getList() {
		$.ajax({
			type : "get",
			url : "/manage/qnaMessage.json",
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tblMessageList").html(temp(data));
			}
		});
	};
</script>