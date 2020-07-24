<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<div>
			<span>${vo.species}</span> <span>${vo.age}살</span>
			<div>${vo.information}</div>
			<div>
				<img src="${vo.dogImage }">
			</div>
			<div>
				<h2>강아지 정보</h2>
				<table>
					<tr>
						<td>견종</td>
						<td>${vo.species }</td>
						<td>성별</td>
						<td><c:if test="${vo.gender == 0}">
						남아
						</c:if> <c:if test="${vo.gender == 1}">
						여아
						</c:if></td>
					</tr>
					<tr>
						<td>나이</td>
						<td>${vo.age }살</td>
						<td>중성화</td>
						<td><c:if test="${vo.neutralizationStatus == 0}">
							O
						</c:if> <c:if test="${vo.neutralizationStatus == 1}">
							X
						</c:if></td>
					</tr>
					<tr>
						<td>특징</td>
						<td>${vo.feature }</td>
						<td>접종</td>
						<td><c:if test="${vo.inoculationStatus == 0}">
							O
						</c:if> <c:if test="${vo.inoculationStatus == 1}">
							X
						</c:if></td>
					</tr>
				</table>
			</div>
		</div>
		<button>입양신청</button>
		<button>관리자수정</button>
	</div>
</body>
</html>