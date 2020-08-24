<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style>
@media screen and (min-width:512px) and (max-width:1024px)
div {
	width: 100%;
	height: 100%;
}

@media screen and (max-width:100px) {
	div {
		background-color: blue;
	}
}

@media screen and (min-width: 100px) and (max-width:200px) {
	div {
		background-color: red;
	}
}

@media screen and (min-width: 200px) {
	div {
		background-color: green;
	}
}
</style>
<body>
 <div></div>
</body>
</html>