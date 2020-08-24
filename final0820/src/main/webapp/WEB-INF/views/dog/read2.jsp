<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG MYPAGE</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style4manage.css">
<link rel="stylesheet" href="/resources/css/style.css">
<style>
	#management {margin-left:-100px;}
</style>
</head>
<body>
   <jsp:include page="../menu3.jsp"/>
	<div class="menuBox">
	<jsp:include page="../menuTop.jsp"/>
	<div class="mplistWrap">
   <div id="management">
      <input type="hidden" name="dogCode" value="${vo.dogCode}">
      <table border=1 id="dogUD">
         <tr>
            <td class="dogtitle">품종</td>
            <td class="dogcontent" colspan=5>${vo.species}</td>
         </tr>
         <tr>
            <td class="dogtitle">나이</td>
            <td class="dogcontent"colspan=2>${vo.age}</td>
            <td class="dogtitle">성별</td>
            <c:if test="${vo.gender==0}">
               <td class="dogcontent"colspan=2>남아</td>
            </c:if>
            <c:if test="${vo.gender==1}">
               <td class="dogcontent"colspan=2>여아</td>
            </c:if>
         </tr>
         <tr>
            <td class="dogtitle">사이즈</td>
            <c:if test="${vo.size=='A'}">
               <td class="dogcontent"colspan=2>소형견</td>
            </c:if>
            <c:if test="${vo.size=='B'}">
               <td class="dogcontent"colspan=2>중형견</td>
            </c:if>
            <c:if test="${vo.size=='C'}">
               <td class="dogcontent"colspan=2>대형견</td>
            </c:if>
            <td class="dogtitle">모색</td>
            <td class="dogcontent"colspan=2>${vo.color}</td>
         </tr>
         <tr>
            <td class="dogtitle">접종여부</td>
            <c:if test="${vo.inoculationStatus==0}">
               <td class="dogcontent" style="text-align:center;">O</td>
            </c:if>
            <c:if test="${vo.inoculationStatus==1}">
               <td class="dogcontent" style="text-align:center;">X</td>
            </c:if>
         
            <td class="dogtitle">중성화여부</td>
            <c:if test="${vo.neutralizationStatus==0}">
               <td class="dogcontent" style="text-align:center;">O</td>
            </c:if>
            <c:if test="${vo.neutralizationStatus==1}">
               <td class="dogcontent" style="text-align:center;">X</td>
            </c:if>
         
            <td class="dogtitle">입양여부</td>
            <c:if test="${vo.adoptStatus==0}">
               <td class="dogcontent" style="text-align:center;">O</td>
            </c:if>
            <c:if test="${vo.adoptStatus==1}">
               <td class="dogcontent" style="text-align:center;">X</td>
            </c:if>
         </tr>
         <tr>
            <td class="dogtitle">특징</td>
            <td class="dogcontent"colspan=5>${vo.feature}</td>
         </tr>
         <tr>
            <td class="dogtitle">대표이미지</td>
            <td class="dogcontent"colspan=5>
            	<c:if test="${vo.dogImage!=null && vo.dogImage!=''}">
                  <img src="/display?fileName=${vo.dogImage}" id="image" width=150>
               </c:if> 
               <c:if test="${vo.dogImage==null || vo.dogImage==''}">
                  <img src="http://placehold.it/150x120" id="image" width=150>
               </c:if> <input type="file" name="file" /> <input type="hidden"
               value="${vo.dogImage }" name="dogImage"></td>
         </tr>
      </table>
   </div>
   </div>
  </div>
  <jsp:include page="../myPageFooter.jsp"/>
   
</body>
<script>   
   
</script>
</html>