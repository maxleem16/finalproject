<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>DDOGDOG LIST</title>

<link rel="shortcut icon" type="image⁄x-icon"   href="/resources/img/page_logo.png">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
   <div id="mpWrap">
      <jsp:include page="../menu3.jsp"/>
      <div class="menuBox">
            <jsp:include page="../menuTop.jsp"/>
         <div class="userMenu">
            <span class="menuTitle">프로필</span><br>
            <div class="mpID">
               <div>아이디: <span>${vo.id}</span></div>
               <div>이름: <span>${vo.name}</span></div>
               <div>생년월일: <span>${vo.birthday}</span></div>
         </div>
         <div class="mpAdd">
               <div>주소: <span>${vo.address}</span></div>
               <div>전화번호: <span>${vo.tel}</span></div>
               <div>이메일: <span>${vo.email}</span></div>
            </div><br>
            <div id="btnMP">
               <button id="btnUserUpdate">정보수정</button>
            </div>
         </div>
         <div class="menuadopt">
            <span class="menuTitle">입양관리</span>
            <div>
               <span class="menuTitle">내가 찜한 아이들</span>
               <button id="btnDogLikeList">더보기</button>
               <table border=1 id="dogLikeList">
                    <tr>
                       <td>강아지코드</td>
                       <td>견죵</td>
                       <td>성별</td>
                       <td>나이</td>
                    </tr>
              <c:forEach items="${dogList}" var="vo" begin="0" end="2">   
                    <tr class="row">
                       <td class="dogCode">${vo.dogCode}</td>
                       <td>${vo.species}</td>
                       <c:if test="${vo.gender==0}">
                          <td>남아</td>
                       </c:if>
                       <c:if test="${vo.gender==1}">
                          <td>여아</td>
                       </c:if>
                       <td>${vo.age}살</td>
                    </tr>
                 </c:forEach>
            </table>
            </div>
          </div>
            
         </div>         
         <div class="menuDonation">
            <span class="menuTitle">후원금</span>
            <button id="btnDonation">더보기</button>
         <table border=1>
            <c:forEach items="${donationList}" var="vo" begin="0" end="2">
            <tr>
               <td><fmt:formatNumber value="${vo.price}" pattern="#,###원"/></td>
               <td>${vo.name}</td>
               <td width="300">${vo.sponsorContent}</td>
               <td>
                  <c:if test="${vo.donationMethod==0}">댓글후원</c:if>
                  <c:if test="${vo.donationMethod==1}">결제후원</c:if>
               </td>
            </tr>
            </c:forEach>
         </table>
         </div>
         <div class="menuQ">
            <span class="menuTitle">1:1문의</span>
            <button id="btnQ">더보기</button>
         </div>
         <div class="menuWrite">
            <span class="menuTitle">내가 쓴 글</span>
            <div id="Wboard">
               <span class="menuTitle">자유게시판</span>
               <button id="btnBoard">더보기</button>
                <table border=1>
                        <tr>
                           <td>게시물번호</td>
                           <td>작성자</td>
                           <td>제목</td>
                           <td>내용</td>
                           <td>작성일자</td>
                        </tr>
                <c:forEach items="${boardList}" var="vo" begin="0" end="2">        
                     <tr class="row">
                        <td class="postNo">${vo.postingNo}</td>
                        <td>${vo.writer}</td>
                        <td>${vo.postTitle}</td>
                        <td>${vo.postContent}</td>
                        <td><fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd" /></td>
                     </tr>             
               </c:forEach>
               </table>   
            </div>
            <div id="Wmissing">
            <span class="menuTitle">실종신고</span>
               <button id="btnMissing">더보기</button>
              <table border=1>               
                  <tr>
                     <td>게시물번호</td>
                     <td>작성자</td>
                     <td>실종위치</td>
                     <td>실종일자</td>
                     <td>작성일자</td>
                  </tr>
               <c:forEach items="${missingList}" var="vo" begin="0" end="2">   
                  <tr class="row">
                     <td class="reportNo">${vo.reportNo}</td>
                     <td>${vo.writer}</td>
                     <td>${vo.missingLocation}</td>
                     <td>${vo.missingTime}</td>
                     <td><fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd" /></td>
                  </tr>
               </c:forEach>
               </table>
          </div>
            <div id="Winfo">
               <span class="menuTitle">유기제보</span>
               <button id="btnInfo">더보기</button>
                  <table border=1>
                     <tr>
                        <td>게시물번호</td>
                        <td>작성자</td>
                        <td>발견위치</td>
                        <td>작성시간</td>
                     </tr>
                  <c:forEach items="${infoList}" var="vo" begin="0" end="2">   
                     <tr class="row">
                        <td class="foundNo">${vo.foundNo}</td>
                        <td>${vo.writer}</td>
                        <td>${vo.foundLocation}</td>
                        <td><fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd" /></td>
                     </tr>
                  </c:forEach>
                  </table>
            </div>
         </div>
      </div>
          
       <jsp:include page="../myPageFooter.jsp"/>
</body>
<script>
var id="${id}";

   $("#dogLikeList").on("click",".row",function(){
       var dogCode=$(this).find(".dogCode").html();
       location.href="/dog/read?dogCode="+dogCode;
    });

   $("#Winfo").on("click",".row",function(){
       var foundNo=$(this).find(".foundNo").html();
       location.href="/infoReport/read?foundNo="+foundNo;
    });

   $("#Wmissing").on("click",".row",function(){
       var reportNo=$(this).find(".reportNo").html();
       location.href="/missing/read?reportNo="+reportNo;
    });

   $("#Wboard").on("click",".row",function(){
       var postingNo=$(this).find(".postNo").html();
       location.href="/board/read2?postingNo="+postingNo;
    });
    
   $("#btnUserUpdate").on("click",function(){
      location.href="/user/readPassword";
   });
   
   $("#btnUserDelete").on("click",function(){
      location.href="/user/deletePassword";
   });
   
   $("#btnDonation").on("click",function(){
     location.href="/mypage/donation?id="+id+"&donationMethod=";
   });
   
   $("#btnBoard").on("click",function(){
        location.href="/mypage/boardList?id="+id;
   });
   
   $("#btnInfo").on("click",function(){
        location.href="/mypage/infoList?id="+id;
   });
   
   $("#btnMissing").on("click",function(){
        location.href="/mypage/missingList?id="+id;
   });
   
   $("#btnQ").on("click",function(){
     location.href="";
   });
</script>
</html>