<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>게시판 목록</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <style>
      a{text-decoration:none;}
      .active{color:red;}
      #darken-background {
   position: absolute;
   top: 0%;
   left: 0px;
   width: 100%;
   right: 0px;
   height: 1200px;
   display: none;
   background: rgba(0, 0, 0, 0.5);
   z-index: 10000;
   overflow-y: scroll;
}

#darken-background2 {
   position: absolute;
   top: 0px;
   left: 0px;
   width: 100%;
   right: 0px;
   height: 100%;
   display: none;
   background: rgba(0, 0, 0, 0.5);
   z-index: 10000;
   overflow-y: scroll;
}

#lightbox {
   width: 900px;
   height: 550px;
   margin: 20px auto;
   margin-top: 200px;
   padding: 15px;
   border: 1px solid #333333;
   border-radius: 5px;
   background: white;
   box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
   text-align: center;
}

#lightM {
   float: left;
   width: 500px;
   height: 500px;
}

#image {
   float: left;
   width: 500px;
   height: 500px;
}

#light {
   position: absolute;
   top: 18%;
   left: 55%;
   text-align: left;
}

.profileImg img {
   width: 60px;
   border-radius: 100%;
   position: absolute;
   top: 2%;
   left: 0%;
   
}

#lightForm{
   position:absolute;
   top:8%;
   left:0%;
   width:330px;
}


#uplightbox {
   width: 900px;
   height: 550px;
   margin: 20px auto;
   margin-top: 200px;
   padding: 15px;
   border: 1px solid #333333;
   border-radius: 5px;
   background: white;
   box-shadow: 0px 5px 5px rgba(34, 25, 25, 0.4);
   text-align: center;
}

#uplightbox input[type='file'] {
   display:none;
}

.uplight {
   width:330px;
   position:absolute;
   top:20%;
   left:55%;
   width:330px;
}

#updateForm {
   position:absolute;
   top:20%;
   left:0%;
   width:330px;
   text-align:left;
}

#updateForm input[type='text'],#updateForm textarea {
   outline:none;
   border:none;
   background:pink;
}

#lightWriter {
   margin-left:75px;
   margin-bottom:30px;
}

.lightX {
}

.lightX .fa-times::before {
   position: absolute;
   top: 3%;
   left: 90%;
   font-size: 40px;
   color: gray;
   cursor: pointer;
}

.lightX .fa-ellipsis-v::before {
   position: absolute;
   top: 27%;
   left: 311px;
   font-size: 30px;
   color: #c8c8c8;
   
}

#lightId {
   position: absolute;
   top: 5%;
   left: 25%;
}

#lightTitle {
   position: relative;
   top: 20%;
   left: 3%;
}

#lightContent {
   position: relative;
   top: 50%;
   left: 3%;
}

#postWriter {
   margin-left:80px;
   margin-bottom:30px;
   
}

#postTitle {
   margin-left: 10px;
   margin-bottom:7px;
}

#postContent {
   margin-left: 10px;
}

.lightIn {
   position: relative;
   top: 200px;
   left: 0;
   width:90%;
}

.lightX li {
   float: left;
}

#ul {
   position: absolute;
   top: 75px;
   left: 65%;
   border: 1px solid gray;
   text-align: center;
   padding: 10px;
   width: 90px;
   font-size: 12px;
}

#btnUpdate:hover, #btnDelete:hover {
   font-weight: bold;
   font-size: 15px;
   cursor: pointer;
   color: #F25F29;
}

#btnUpdate2 {
   position:absolute;
   top:170px;
   left:85%;
}

#uplightbox .lightIn {
   text-align:left;
}
   </style>
</head>
<body>
<jsp:include page="../menu3.jsp"/>
<div class="menuBox">
            <jsp:include page="../menuTop.jsp"/>
   <h1>[게시판 목록]</h1>
   <input id="btnInsert" value="글쓰기" type="button"></input>
     <table border=1>
         <tr>
            <td>게시물번호</td>
            <td>작성자</td>
            <td>제목</td>
            <td>내용</td>
            <td>작성일자</td>
         </tr>
         <c:forEach items="${list}" var="vo">        
          <tr class="row">
             <td class="postNo">${vo.postingNo}</td>
             <td>${vo.writer}</td>
             <td>${vo.postTitle}</td>
             <td>${vo.postContent}</td>
             <td><fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd" /></td>
          </tr>             
      </c:forEach>
      </table>   
   <div id="pagination">
        <c:if test="${pm.prev}">
            <a href="${pm.startPage-1}">◀</a>
        </c:if>
        <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
            <c:if test="${pm.cri.page == i }">
                [<a href="${i}" class='active'>${i}</a>]
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
    <jsp:include page="../myPageFooter.jsp"/>
</body>
<script>

$("#btnInsert").on("click",function(){
    location.href="/board/insert";
 });

 $("#pagination a").click(function(e){
    e.preventDefault();
    var id=${id};
    var page=$(this).attr("href");
    location.href="boardList?id="+id+"&page="+page;
 });
 
 $(".row").on("click",function(){
       var postingNo=$(this).find(".postNo").html();
       location.href="/board/read2?postingNo="+postingNo;
   });
</script>
</html>