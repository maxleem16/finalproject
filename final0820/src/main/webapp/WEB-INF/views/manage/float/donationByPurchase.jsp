<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>

#donationPurchased {
	border-collapse: collapse;
	margin: auto;
	width: 230px;
}
#donationPurchased .title {
	background-color: #f39c11;
}

#donationPurchased .row:nth-child(2n+1) {
	background-color: lightgray;
}

</style>
<body>
	<h4>후원금 내역</h4>
	<table id="donationPurchased"></table>
	<script id="temp2" type="text/x-handlebars-template">
		<tr class="title">
			<td>후원금액</td>
			<td>아이디</td>
			<td>후원자명</td>
		</tr>
		{{#each dlist}}
		<tr class="row">
			<td>{{price}}원</td>
			<td>{{sponsor}}</td>
			<td>{{name}}</td>
		</tr>
		{{/each}}
	</script>
		<a href="/manage/donationManage">더보기🔽</a>
</body>
<script>
getList();
function getList() {
	$.ajax({
		type : "get",
		url : "/manage/float/donationPurchased.json",
		dataType : "json",
		data : {
			"page" : '1',
			"perPageNum":'3',
		},
		success : function(data) {
			var temp = Handlebars.compile($("#temp2").html());
			$("#donationPurchased").html(temp(data));
			$("#total").html(data.total+"원");
		}
	});
};

</script>