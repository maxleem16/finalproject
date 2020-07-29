<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DDOGDOG read page</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/img/page_logo.png">
<script src="https://kit.fontawesome.com/2594a0d020.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<style>
#divReadPage {
   margin:0 0 0 0;
   background-image:url('/resources/img/read_back.jpg');
   background-size:cover;
   
}

#divReadPageIn {
   width:1600px;
   height:1950px;
   margin:auto;
   padding:10px;
}

#divReadPageSpan {
   height:700px;
   background:white;
   margin-top:100px;
   padding:40px;
   box-shadow: 0px 20px 30px 0px rgba(0, 0, 0, 0.2);
   border-radius: 30px 30px 30px 30px;
      
}

#divReadPageSpanIn {
   float:right;
   margin-right:350px;
}

#divReadAge {
   color:red;
   font-size:40px;
   font-weight:bold;
}
#divReadPageSpanInfo {
   width:500px;
   height:200px;
   background:#ebecee;
   float:right;
   margin-top:50px;
}


#divReadImg img{
   float: left;
   width:550px;
   height:600px;
   margin-left:40px;
   border-radius: 10px 10px 10px 10px;
}


#tblDogInfo {
   margin-top:50px;
   margin-right:100px;
   border:3px solid #ebecee;
   border-bottom:1px solid #F25F29;
   width: 800px;
   border-collapse:collapse;
   
}


#tblDogInfo td {
   height:30px;
   width:200px;
   background:red;
}

#tblDogInfo th {
   width:70px;
   text-align:left;
   color:#EA3520;
}



#divReadBtn {
   text-align:center;

}

#btnReadAdopt {
   cursor:pointer;
   background:#FA3313;
   height:45px;
   width:130px;
   border-radius: 5px 5px 5px 5px;
   font-size:20px;
   color:white;
   border: none;
   outline: none;
}
</style>
<body>
   <div id="divMenu">
      <jsp:include page="../menu.jsp" />
   </div>
   <div id="divListImg">
      <jsp:include page="../box.jsp"/>      <!-- 광고 이미지 -->
   </div>
   <div id="divReadPage">
      <div id="divReadPageIn">
         <div id="divReadPageSpan">
            <div id="divReadPageSpanIn">
               <div id="divReadAge" style="color:">${vo.species} ${vo.age}살</div>
               <div id="dogCode">${vo.dogCode}</div>
               <div id="divReadPageSpanInfo">
                  <p>나는 이런 강아지에요</p>
                  ${vo.information}
               </div>
            </div>
            <div id="divReadImg">
               <img src="${vo.dogImage }">
            </div>
            <table id="tblDogInfo" border=1>
               <tr class="tblDogInfoTr">
                  <th><i class="fas fa-dog"></i>  견종</th>
                  <td>${vo.species }</td>
                  <th><i class="fas fa-mars-double"></i>  성별</th>
                  <td>
                  <c:if test="${vo.gender == 0}">
                           남아
                  </c:if> 
                  <c:if test="${vo.gender == 1}">
                     여아
                  </c:if>
                  </td>
               </tr>
               <tr class="tblDogInfoTr">
                  <th><i class="fas fa-paw"></i>  나이</th>
                  <td>${vo.age }살</td>
                  <th><i class="fas fa-stethoscope"></i>  중성화</th>
                  <td><c:if test="${vo.neutralizationStatus == 0}">
                     O
                  </c:if> <c:if test="${vo.neutralizationStatus == 1}">
                     X
                  </c:if></td>
               </tr>
               <tr class="tblDogInfoTr">
                  <th><i class="fas fa-bone"></i>  특징</th>
                  <td>${vo.feature }</td>
                  <th><i class="fas fa-plus-square"></i>  접종</th>
                  <td><c:if test="${vo.inoculationStatus == 0}">
                     O
                  </c:if> <c:if test="${vo.inoculationStatus == 1}">
                     X
                  </c:if></td>
               </tr>
            </table>
         </div>

      </div>
      <div id="divReadBtn">
         <button id="btnReadAdopt">입양신청</button>
         <button id="btnDogUpdate"style="float:right;">관리자수정</button>
      </div>
   </div>
</body>
<script>
   $("#btnReadAdopt").on("click", function() {
      var dogCode = $("#dogCode").html();
      alert(dogCode);
      location.href = "/adopt/insert?dogCode=" + dogCode;
   });
   
   $("#btnDogUpdate").on("click", function() {
      dogCode = $("#dogCode").html();
      alert(dogCode);
      location.href = "/dog/update?dogCode=" + dogCode;
   });
</script>
</html>