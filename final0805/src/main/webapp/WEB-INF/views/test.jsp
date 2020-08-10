<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.container {
		width:400px;
		display:grid;
		grid-template-rows:repeat(2, 100px);
		grid-template-columns:repeat(3, 1fr);
		grid-auto-rows:100px;
	}
	.item:nth-child(1) {
		grid-column:1/4;
	}
	
	.item:nth-child(3) {
		grid-column: span 2;
	}
	.item {
		background:red;
		margin:10px;
	}
</style>
<body>
	<div class="container">
		<div class="item">1</div>
		<div class="item">2</div>
		<div class="item">3</div>
		<div class="item">4</div>
		<div class="item">5</div>
		<div class="item">6</div>
	</div>
</body>
</html>