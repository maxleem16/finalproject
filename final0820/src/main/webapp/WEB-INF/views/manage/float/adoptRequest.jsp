<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

#tblAdoptionList {
	border-collapse: collapse;
	margin:auto;
}

#tblAdoptionList .title {
	background-color: #3eabae;
}

#tblAdoptionList .row:nth-child(2n+1) {
	background-color: lightgray;
}
</style>
<body>
<h4>입양 신청서 목록</h4>
	<table id="tblAdoptionList"></table>
	<script id="temp1" type="text/x-handlebars-template">
		<tr class="title">
		<td id="applicationNo">신청번호</td>
		<td id="applicant">신청인</td>
		<td id="dogCode">강아지코드</td>
		<td id="appliedDate">신청날짜</td>
		<td id="applicationConfirm">승인상태</td>
		</tr>
	{{#each list}}
		<tr class="row">
		<td class="ano">{{applicationNo}}</td>
		<td>{{name}}</td>
		<td>{{dogCode}} [{{species}}]</td>
		<td>{{appliedDate}}</td>
		<td>{{printChk applicationConfirm}}</td>
		</tr>
	{{/each}}
	</script>
		<a href="/adopt/applyList">더보기🔽</a>
</body>	
	<script>
	getList();
	Handlebars.registerHelper('printChk', function(ac) {
		var src;
		if (ac == '2') {
			src = "승인거부";
		} else if (ac == '0') {
			src = "승인대기"
		} else {
			src = "승인완료"
		}
		return src;
	});
	function getList() {
		$.ajax({
			type : "get",
			url : "/manage/applyList.json",
			dataType : "json",
			data : {
				"page" : '1',
				"perPageNum":'3',
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp1").html());
				$("#tblAdoptionList").html(temp(data));
			}
		});
	};
	</script>