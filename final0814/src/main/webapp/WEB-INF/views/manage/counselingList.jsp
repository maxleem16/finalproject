<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/style4manage.css">
<title>유저목록</title>
<style>
#table {
	margin: auto;
}

.row {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	margin-right: -15px;
	margin-left: -15px
}

.no-gutters {
	margin-right: 0;
	margin-left: 0
}

.no-gutters>.col, .no-gutters>[class*=col-] {
	padding-right: 0;
	padding-left: 0
}

.col, .col-1, .col-10, .col-11, .col-12, .col-2, .col-3, .col-4, .col-5,
	.col-6, .col-7, .col-8, .col-9, .col-auto, .col-lg, .col-lg-1,
	.col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4,
	.col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-auto,
	.col-md, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2,
	.col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8,
	.col-md-9, .col-md-auto, .col-sm, .col-sm-1, .col-sm-10, .col-sm-11,
	.col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6,
	.col-sm-7, .col-sm-8, .col-sm-9, .col-sm-auto, .col-xl, .col-xl-1,
	.col-xl-10, .col-xl-11, .col-xl-12, .col-xl-2, .col-xl-3, .col-xl-4,
	.col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-auto {
	position: relative;
	width: 100%;
	padding-right: 15px;
	padding-left: 15px
}

.col {
	-ms-flex-preferred-size: 0;
	flex-basis: 0;
	-ms-flex-positive: 1;
	flex-grow: 1;
	max-width: 100%
}

.row-cols-1>* {
	-ms-flex: 0 0 100%;
	flex: 0 0 100%;
	max-width: 100%
}

.row-cols-2>* {
	-ms-flex: 0 0 50%;
	flex: 0 0 50%;
	max-width: 50%
}

.row-cols-3>* {
	-ms-flex: 0 0 33.333333%;
	flex: 0 0 33.333333%;
	max-width: 33.333333%
}

.row-cols-4>* {
	-ms-flex: 0 0 25%;
	flex: 0 0 25%;
	max-width: 25%
}

.row-cols-5>* {
	-ms-flex: 0 0 20%;
	flex: 0 0 20%;
	max-width: 20%
}

.row-cols-6>* {
	-ms-flex: 0 0 16.666667%;
	flex: 0 0 16.666667%;
	max-width: 16.666667%
}

.col-auto {
	-ms-flex: 0 0 auto;
	flex: 0 0 auto;
	width: auto;
	max-width: 100%
}

.col-1 {
	-ms-flex: 0 0 8.333333%;
	flex: 0 0 8.333333%;
	max-width: 8.333333%
}

.col-2 {
	-ms-flex: 0 0 16.666667%;
	flex: 0 0 16.666667%;
	max-width: 16.666667%
}

.col-3 {
	-ms-flex: 0 0 25%;
	flex: 0 0 25%;
	max-width: 25%
}

.col-4 {
	-ms-flex: 0 0 33.333333%;
	flex: 0 0 33.333333%;
	max-width: 33.333333%
}

.col-5 {
	-ms-flex: 0 0 41.666667%;
	flex: 0 0 41.666667%;
	max-width: 41.666667%
}

.col-6 {
	-ms-flex: 0 0 50%;
	flex: 0 0 50%;
	max-width: 50%
}

.col-7 {
	-ms-flex: 0 0 58.333333%;
	flex: 0 0 58.333333%;
	max-width: 58.333333%
}

.col-8 {
	-ms-flex: 0 0 66.666667%;
	flex: 0 0 66.666667%;
	max-width: 66.666667%
}

.col-9 {
	-ms-flex: 0 0 75%;
	flex: 0 0 75%;
	max-width: 75%
}

.col-10 {
	-ms-flex: 0 0 83.333333%;
	flex: 0 0 83.333333%;
	max-width: 83.333333%
}

.col-11 {
	-ms-flex: 0 0 91.666667%;
	flex: 0 0 91.666667%;
	max-width: 91.666667%
}

.col-12 {
	-ms-flex: 0 0 100%;
	flex: 0 0 100%;
	max-width: 100%
}

.order-first {
	-ms-flex-order: -1;
	order: -1
}

.order-last {
	-ms-flex-order: 13;
	order: 13
}

.order-0 {
	-ms-flex-order: 0;
	order: 0
}

.order-1 {
	-ms-flex-order: 1;
	order: 1
}

.order-2 {
	-ms-flex-order: 2;
	order: 2
}

.order-3 {
	-ms-flex-order: 3;
	order: 3
}

.order-4 {
	-ms-flex-order: 4;
	order: 4
}

.order-5 {
	-ms-flex-order: 5;
	order: 5
}

.order-6 {
	-ms-flex-order: 6;
	order: 6
}

.order-7 {
	-ms-flex-order: 7;
	order: 7
}

.order-8 {
	-ms-flex-order: 8;
	order: 8
}

.order-9 {
	-ms-flex-order: 9;
	order: 9
}

.order-10 {
	-ms-flex-order: 10;
	order: 10
}

.order-11 {
	-ms-flex-order: 11;
	order: 11
}

.order-12 {
	-ms-flex-order: 12;
	order: 12
}

.offset-1 {
	margin-left: 8.333333%
}

.offset-2 {
	margin-left: 16.666667%
}

.offset-3 {
	margin-left: 25%
}

.offset-4 {
	margin-left: 33.333333%
}

.offset-5 {
	margin-left: 41.666667%
}

.offset-6 {
	margin-left: 50%
}

.offset-7 {
	margin-left: 58.333333%
}

.offset-8 {
	margin-left: 66.666667%
}

.offset-9 {
	margin-left: 75%
}

.offset-10 {
	margin-left: 83.333333%
}

.offset-11 {
	margin-left: 91.666667%
}

@media ( min-width :576px) {
	.col-sm {
		-ms-flex-preferred-size: 0;
		flex-basis: 0;
		-ms-flex-positive: 1;
		flex-grow: 1;
		max-width: 100%
	}
	.row-cols-sm-1>* {
		-ms-flex: 0 0 100%;
		flex: 0 0 100%;
		max-width: 100%
	}
	.row-cols-sm-2>* {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%
	}
	.row-cols-sm-3>* {
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
	}
	.row-cols-sm-4>* {
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.row-cols-sm-5>* {
		-ms-flex: 0 0 20%;
		flex: 0 0 20%;
		max-width: 20%
	}
	.row-cols-sm-6>* {
		-ms-flex: 0 0 16.666667%;
		flex: 0 0 16.666667%;
		max-width: 16.666667%
	}
	.col-sm-auto {
		-ms-flex: 0 0 auto;
		flex: 0 0 auto;
		width: auto;
		max-width: 100%
	}
	.col-sm-1 {
		-ms-flex: 0 0 8.333333%;
		flex: 0 0 8.333333%;
		max-width: 8.333333%
	}
	.col-sm-2 {
		-ms-flex: 0 0 16.666667%;
		flex: 0 0 16.666667%;
		max-width: 16.666667%
	}
	.col-sm-3 {
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.col-sm-4 {
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
	}
	.col-sm-5 {
		-ms-flex: 0 0 41.666667%;
		flex: 0 0 41.666667%;
		max-width: 41.666667%
	}
	.col-sm-6 {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%
	}
	.col-sm-7 {
		-ms-flex: 0 0 58.333333%;
		flex: 0 0 58.333333%;
		max-width: 58.333333%
	}
	.col-sm-8 {
		-ms-flex: 0 0 66.666667%;
		flex: 0 0 66.666667%;
		max-width: 66.666667%
	}
	.col-sm-9 {
		-ms-flex: 0 0 75%;
		flex: 0 0 75%;
		max-width: 75%
	}
	.col-sm-10 {
		-ms-flex: 0 0 83.333333%;
		flex: 0 0 83.333333%;
		max-width: 83.333333%
	}
	.col-sm-11 {
		-ms-flex: 0 0 91.666667%;
		flex: 0 0 91.666667%;
		max-width: 91.666667%
	}
	.col-sm-12 {
		-ms-flex: 0 0 100%;
		flex: 0 0 100%;
		max-width: 100%
	}
	.order-sm-first {
		-ms-flex-order: -1;
		order: -1
	}
	.order-sm-last {
		-ms-flex-order: 13;
		order: 13
	}
	.order-sm-0 {
		-ms-flex-order: 0;
		order: 0
	}
	.order-sm-1 {
		-ms-flex-order: 1;
		order: 1
	}
	.order-sm-2 {
		-ms-flex-order: 2;
		order: 2
	}
	.order-sm-3 {
		-ms-flex-order: 3;
		order: 3
	}
	.order-sm-4 {
		-ms-flex-order: 4;
		order: 4
	}
	.order-sm-5 {
		-ms-flex-order: 5;
		order: 5
	}
	.order-sm-6 {
		-ms-flex-order: 6;
		order: 6
	}
	.order-sm-7 {
		-ms-flex-order: 7;
		order: 7
	}
	.order-sm-8 {
		-ms-flex-order: 8;
		order: 8
	}
	.order-sm-9 {
		-ms-flex-order: 9;
		order: 9
	}
	.order-sm-10 {
		-ms-flex-order: 10;
		order: 10
	}
	.order-sm-11 {
		-ms-flex-order: 11;
		order: 11
	}
	.order-sm-12 {
		-ms-flex-order: 12;
		order: 12
	}
	.offset-sm-0 {
		margin-left: 0
	}
	.offset-sm-1 {
		margin-left: 8.333333%
	}
	.offset-sm-2 {
		margin-left: 16.666667%
	}
	.offset-sm-3 {
		margin-left: 25%
	}
	.offset-sm-4 {
		margin-left: 33.333333%
	}
	.offset-sm-5 {
		margin-left: 41.666667%
	}
	.offset-sm-6 {
		margin-left: 50%
	}
	.offset-sm-7 {
		margin-left: 58.333333%
	}
	.offset-sm-8 {
		margin-left: 66.666667%
	}
	.offset-sm-9 {
		margin-left: 75%
	}
	.offset-sm-10 {
		margin-left: 83.333333%
	}
	.offset-sm-11 {
		margin-left: 91.666667%
	}
}

@media ( min-width :768px) {
	.col-md {
		-ms-flex-preferred-size: 0;
		flex-basis: 0;
		-ms-flex-positive: 1;
		flex-grow: 1;
		max-width: 100%
	}
	.row-cols-md-1>* {
		-ms-flex: 0 0 100%;
		flex: 0 0 100%;
		max-width: 100%
	}
	.row-cols-md-2>* {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%
	}
	.row-cols-md-3>* {
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
	}
	.row-cols-md-4>* {
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.row-cols-md-5>* {
		-ms-flex: 0 0 20%;
		flex: 0 0 20%;
		max-width: 20%
	}
	.row-cols-md-6>* {
		-ms-flex: 0 0 16.666667%;
		flex: 0 0 16.666667%;
		max-width: 16.666667%
	}
	.col-md-auto {
		-ms-flex: 0 0 auto;
		flex: 0 0 auto;
		width: auto;
		max-width: 100%
	}
	.col-md-1 {
		-ms-flex: 0 0 8.333333%;
		flex: 0 0 8.333333%;
		max-width: 8.333333%
	}
	.col-md-2 {
		-ms-flex: 0 0 16.666667%;
		flex: 0 0 16.666667%;
		max-width: 16.666667%
	}
	.col-md-3 {
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.col-md-4 {
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
	}
	.col-md-5 {
		-ms-flex: 0 0 41.666667%;
		flex: 0 0 41.666667%;
		max-width: 41.666667%
	}
	.col-md-6 {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%
	}
	.col-md-7 {
		-ms-flex: 0 0 58.333333%;
		flex: 0 0 58.333333%;
		max-width: 58.333333%
	}
	.col-md-8 {
		-ms-flex: 0 0 66.666667%;
		flex: 0 0 66.666667%;
		max-width: 66.666667%
	}
	.col-md-9 {
		-ms-flex: 0 0 75%;
		flex: 0 0 75%;
		max-width: 75%
	}
	.col-md-10 {
		-ms-flex: 0 0 83.333333%;
		flex: 0 0 83.333333%;
		max-width: 83.333333%
	}
	.col-md-11 {
		-ms-flex: 0 0 91.666667%;
		flex: 0 0 91.666667%;
		max-width: 91.666667%
	}
	.col-md-12 {
		-ms-flex: 0 0 100%;
		flex: 0 0 100%;
		max-width: 100%
	}
	.order-md-first {
		-ms-flex-order: -1;
		order: -1
	}
	.order-md-last {
		-ms-flex-order: 13;
		order: 13
	}
	.order-md-0 {
		-ms-flex-order: 0;
		order: 0
	}
	.order-md-1 {
		-ms-flex-order: 1;
		order: 1
	}
	.order-md-2 {
		-ms-flex-order: 2;
		order: 2
	}
	.order-md-3 {
		-ms-flex-order: 3;
		order: 3
	}
	.order-md-4 {
		-ms-flex-order: 4;
		order: 4
	}
	.order-md-5 {
		-ms-flex-order: 5;
		order: 5
	}
	.order-md-6 {
		-ms-flex-order: 6;
		order: 6
	}
	.order-md-7 {
		-ms-flex-order: 7;
		order: 7
	}
	.order-md-8 {
		-ms-flex-order: 8;
		order: 8
	}
	.order-md-9 {
		-ms-flex-order: 9;
		order: 9
	}
	.order-md-10 {
		-ms-flex-order: 10;
		order: 10
	}
	.order-md-11 {
		-ms-flex-order: 11;
		order: 11
	}
	.order-md-12 {
		-ms-flex-order: 12;
		order: 12
	}
	.offset-md-0 {
		margin-left: 0
	}
	.offset-md-1 {
		margin-left: 8.333333%
	}
	.offset-md-2 {
		margin-left: 16.666667%
	}
	.offset-md-3 {
		margin-left: 25%
	}
	.offset-md-4 {
		margin-left: 33.333333%
	}
	.offset-md-5 {
		margin-left: 41.666667%
	}
	.offset-md-6 {
		margin-left: 50%
	}
	.offset-md-7 {
		margin-left: 58.333333%
	}
	.offset-md-8 {
		margin-left: 66.666667%
	}
	.offset-md-9 {
		margin-left: 75%
	}
	.offset-md-10 {
		margin-left: 83.333333%
	}
	.offset-md-11 {
		margin-left: 91.666667%
	}
}

@media ( min-width :992px) {
	.col-lg {
		-ms-flex-preferred-size: 0;
		flex-basis: 0;
		-ms-flex-positive: 1;
		flex-grow: 1;
		max-width: 100%
	}
	.row-cols-lg-1>* {
		-ms-flex: 0 0 100%;
		flex: 0 0 100%;
		max-width: 100%
	}
	.row-cols-lg-2>* {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%
	}
	.row-cols-lg-3>* {
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
	}
	.row-cols-lg-4>* {
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.row-cols-lg-5>* {
		-ms-flex: 0 0 20%;
		flex: 0 0 20%;
		max-width: 20%
	}
	.row-cols-lg-6>* {
		-ms-flex: 0 0 16.666667%;
		flex: 0 0 16.666667%;
		max-width: 16.666667%
	}
	.col-lg-auto {
		-ms-flex: 0 0 auto;
		flex: 0 0 auto;
		width: auto;
		max-width: 100%
	}
	.col-lg-1 {
		-ms-flex: 0 0 8.333333%;
		flex: 0 0 8.333333%;
		max-width: 8.333333%
	}
	.col-lg-2 {
		-ms-flex: 0 0 16.666667%;
		flex: 0 0 16.666667%;
		max-width: 16.666667%
	}
	.col-lg-3 {
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.col-lg-4 {
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
	}
	.col-lg-5 {
		-ms-flex: 0 0 41.666667%;
		flex: 0 0 41.666667%;
		max-width: 41.666667%
	}
	.col-lg-6 {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%
	}
	.col-lg-7 {
		-ms-flex: 0 0 58.333333%;
		flex: 0 0 58.333333%;
		max-width: 58.333333%
	}
	.col-lg-8 {
		-ms-flex: 0 0 66.666667%;
		flex: 0 0 66.666667%;
		max-width: 66.666667%
	}
	.col-lg-9 {
		-ms-flex: 0 0 75%;
		flex: 0 0 75%;
		max-width: 75%
	}
	.col-lg-10 {
		-ms-flex: 0 0 83.333333%;
		flex: 0 0 83.333333%;
		max-width: 83.333333%
	}
	.col-lg-11 {
		-ms-flex: 0 0 91.666667%;
		flex: 0 0 91.666667%;
		max-width: 91.666667%
	}
	.col-lg-12 {
		-ms-flex: 0 0 100%;
		flex: 0 0 100%;
		max-width: 100%
	}
	.order-lg-first {
		-ms-flex-order: -1;
		order: -1
	}
	.order-lg-last {
		-ms-flex-order: 13;
		order: 13
	}
	.order-lg-0 {
		-ms-flex-order: 0;
		order: 0
	}
	.order-lg-1 {
		-ms-flex-order: 1;
		order: 1
	}
	.order-lg-2 {
		-ms-flex-order: 2;
		order: 2
	}
	.order-lg-3 {
		-ms-flex-order: 3;
		order: 3
	}
	.order-lg-4 {
		-ms-flex-order: 4;
		order: 4
	}
	.order-lg-5 {
		-ms-flex-order: 5;
		order: 5
	}
	.order-lg-6 {
		-ms-flex-order: 6;
		order: 6
	}
	.order-lg-7 {
		-ms-flex-order: 7;
		order: 7
	}
	.order-lg-8 {
		-ms-flex-order: 8;
		order: 8
	}
	.order-lg-9 {
		-ms-flex-order: 9;
		order: 9
	}
	.order-lg-10 {
		-ms-flex-order: 10;
		order: 10
	}
	.order-lg-11 {
		-ms-flex-order: 11;
		order: 11
	}
	.order-lg-12 {
		-ms-flex-order: 12;
		order: 12
	}
	.offset-lg-0 {
		margin-left: 0
	}
	.offset-lg-1 {
		margin-left: 8.333333%
	}
	.offset-lg-2 {
		margin-left: 16.666667%
	}
	.offset-lg-3 {
		margin-left: 25%
	}
	.offset-lg-4 {
		margin-left: 33.333333%
	}
	.offset-lg-5 {
		margin-left: 41.666667%
	}
	.offset-lg-6 {
		margin-left: 50%
	}
	.offset-lg-7 {
		margin-left: 58.333333%
	}
	.offset-lg-8 {
		margin-left: 66.666667%
	}
	.offset-lg-9 {
		margin-left: 75%
	}
	.offset-lg-10 {
		margin-left: 83.333333%
	}
	.offset-lg-11 {
		margin-left: 91.666667%
	}
}

@media ( min-width :1200px) {
	.col-xl {
		-ms-flex-preferred-size: 0;
		flex-basis: 0;
		-ms-flex-positive: 1;
		flex-grow: 1;
		max-width: 100%
	}
	.row-cols-xl-1>* {
		-ms-flex: 0 0 100%;
		flex: 0 0 100%;
		max-width: 100%
	}
	.row-cols-xl-2>* {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%
	}
	.row-cols-xl-3>* {
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
	}
	.row-cols-xl-4>* {
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.row-cols-xl-5>* {
		-ms-flex: 0 0 20%;
		flex: 0 0 20%;
		max-width: 20%
	}
	.row-cols-xl-6>* {
		-ms-flex: 0 0 16.666667%;
		flex: 0 0 16.666667%;
		max-width: 16.666667%
	}
	.col-xl-auto {
		-ms-flex: 0 0 auto;
		flex: 0 0 auto;
		width: auto;
		max-width: 100%
	}
	.col-xl-1 {
		-ms-flex: 0 0 8.333333%;
		flex: 0 0 8.333333%;
		max-width: 8.333333%
	}
	.col-xl-2 {
		-ms-flex: 0 0 16.666667%;
		flex: 0 0 16.666667%;
		max-width: 16.666667%
	}
	.col-xl-3 {
		-ms-flex: 0 0 25%;
		flex: 0 0 25%;
		max-width: 25%
	}
	.col-xl-4 {
		-ms-flex: 0 0 33.333333%;
		flex: 0 0 33.333333%;
		max-width: 33.333333%
	}
	.col-xl-5 {
		-ms-flex: 0 0 41.666667%;
		flex: 0 0 41.666667%;
		max-width: 41.666667%
	}
	.col-xl-6 {
		-ms-flex: 0 0 50%;
		flex: 0 0 50%;
		max-width: 50%
	}
	.col-xl-7 {
		-ms-flex: 0 0 58.333333%;
		flex: 0 0 58.333333%;
		max-width: 58.333333%
	}
	.col-xl-8 {
		-ms-flex: 0 0 66.666667%;
		flex: 0 0 66.666667%;
		max-width: 66.666667%
	}
	.col-xl-9 {
		-ms-flex: 0 0 75%;
		flex: 0 0 75%;
		max-width: 75%
	}
	.col-xl-10 {
		-ms-flex: 0 0 83.333333%;
		flex: 0 0 83.333333%;
		max-width: 83.333333%
	}
	.col-xl-11 {
		-ms-flex: 0 0 91.666667%;
		flex: 0 0 91.666667%;
		max-width: 91.666667%
	}
	.col-xl-12 {
		-ms-flex: 0 0 100%;
		flex: 0 0 100%;
		max-width: 100%
	}
	.order-xl-first {
		-ms-flex-order: -1;
		order: -1
	}
	.order-xl-last {
		-ms-flex-order: 13;
		order: 13
	}
	.order-xl-0 {
		-ms-flex-order: 0;
		order: 0
	}
	.order-xl-1 {
		-ms-flex-order: 1;
		order: 1
	}
	.order-xl-2 {
		-ms-flex-order: 2;
		order: 2
	}
	.order-xl-3 {
		-ms-flex-order: 3;
		order: 3
	}
	.order-xl-4 {
		-ms-flex-order: 4;
		order: 4
	}
	.order-xl-5 {
		-ms-flex-order: 5;
		order: 5
	}
	.order-xl-6 {
		-ms-flex-order: 6;
		order: 6
	}
	.order-xl-7 {
		-ms-flex-order: 7;
		order: 7
	}
	.order-xl-8 {
		-ms-flex-order: 8;
		order: 8
	}
	.order-xl-9 {
		-ms-flex-order: 9;
		order: 9
	}
	.order-xl-10 {
		-ms-flex-order: 10;
		order: 10
	}
	.order-xl-11 {
		-ms-flex-order: 11;
		order: 11
	}
	.order-xl-12 {
		-ms-flex-order: 12;
		order: 12
	}
	.offset-xl-0 {
		margin-left: 0
	}
	.offset-xl-1 {
		margin-left: 8.333333%
	}
	.offset-xl-2 {
		margin-left: 16.666667%
	}
	.offset-xl-3 {
		margin-left: 25%
	}
	.offset-xl-4 {
		margin-left: 33.333333%
	}
	.offset-xl-5 {
		margin-left: 41.666667%
	}
	.offset-xl-6 {
		margin-left: 50%
	}
	.offset-xl-7 {
		margin-left: 58.333333%
	}
	.offset-xl-8 {
		margin-left: 66.666667%
	}
	.offset-xl-9 {
		margin-left: 75%
	}
	.offset-xl-10 {
		margin-left: 83.333333%
	}
	.offset-xl-11 {
		margin-left: 91.666667%
	}
}
</style>
</head>
<body>
	<div id="wholePage">
		<div id="sidebar">
			<jsp:include page="/WEB-INF/views/manage/float/sidebar.jsp" />
		</div>
		<div id="management">
			<div class="row row-cols-1 row-cols-md-3" style="width: 80%;">
				<c:forEach items="${list}" var="vo">
					<div class="col mb-4">
						<div class="card text-right" style="height: 100%">
							<div class="card-body">
								<h5 class="card-title">예약</h5>
								<p class="card-text">${vo.counselingDate}
									${vo.counselingTime}시</p>
								<p class="card-text">${vo.id}</p>
								<p class="card-text">${vo.species}[${vo.dogCode}]</p>
								<p class="card-text">${vo.tel}</p>
								<c:if test="${vo.cancleCheck==0}">
									<p class="card-text">상담대기중</p>
								</c:if>
								<c:if test="${vo.cancleCheck==1}">
									<p class="card-text">예약취소</p>
								</c:if>
								<a href="#" class="btn btn-primary">Go somewhere</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="pagination">
			<c:if test="${pm.prev}">
				<a href="${pm.startPage-1}">◀</a>
			</c:if>
			<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
				<c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active' style="color: red;">${i}</a>]
            </c:if>
				<c:if test="${pm.cri.page != i }">
                [<a href="${i}">${i}</a>]
            </c:if>
			</c:forEach>
			<c:if test="${pm.next}">
				<a href="${pm.endPage+1}">▶</a>
			</c:if>
		</div>
	</div>
</body>
<script>
	$("#pagination a").click(function(e) {
		e.preventDefault();
		var page = $(this).attr("href");
		location.href = "counselingList?page=" + page;
	});
</script>
</html>