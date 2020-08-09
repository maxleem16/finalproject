<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DDOGDOG BOARD LIST</title>
<link rel="shortcut icon" type="image⁄x-icon"   href="/resources/img/page_logo.png">
<script src="https://kit.fontawesome.com/2594a0d020.js"   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<style>
#fullblack {
	
}

.divBoardList {
   width: 1800px;
   height: 1100px;
   margin: auto;
   position: relative;
   padding-left: 200px;
}

.divBoardBox {
   width: 400px;
   height: 400px;
   margin: 30px;
   position: relative;
   float: left;
   background: black;
}

.divBoardBox img {
   width: 400px;
   height: 400px;
   margin: auto;
   position: absoulte;
   margin: auto;
   text-align: center;
}

.divBoardTxt {
   width: 400px;
   height: 400px;
   position: absolute;
   top: 0%;
   bottom: 0%;
   left: 0%;
   right: 0%;
   float: left;
   background: black;
   background-color: rgba(0, 0, 0, 0.5);
   opacity: 0;
   color: white;
   font-size: 20px;
   text-align: center;
   vertical-align: middle;
   padding: 40px;
   padding-top: 20%;
}

.divBoardTxt:hover {
   opacity: 1;
}

.postingNo {
   display: none;
}

#btnBoardInsert {
   background: #F2BB13;
   border-radius: 5px 5px 5px 5px;
   cursor: pointer;
   font-weight: bold;
   height: 30px;
   position: absolute;
   left: 80%;
   top: 1750px;
   border: none;
   outline: none;
}

body, html {
   margin: 0;
   padding: 0;
   height: 100%;
}

#listSearch {
   width: 100%;
   height: 70px;
   background: #ebecee;
   text-align: center;
}

.listSelect {
   position: absolute;
   left: 37%;
   top: 62.5%;
}

#listfrm input[type='text'] {
   height: 30px;
   width: 250px;
   position: absolute;
   left: 41%;
   top: 62%;
   background-color: white;
   border-radius: 10px 10px 10px 10px;
   border: 0.5px gray solid;
   outline: none;
}

#listfrm input[type='button'] {
   background: #F2BB13;
   border-radius: 5px 5px 5px 5px;
   cursor: pointer;
   font-weight: bold;
   height: 30px;
   position: absolute;
   left: 55%;
   top: 62.3%;
   border: none;
   outline: none;
}

#listfrm span {
   position: absolute;
   left: 59%;
   top: 62.5%;;
}

h1 {
   position: relative;
   top: 0%;
   left: 36%;
   color: #BCAC99;
   width: 300px;
}

.divBoardList {
   width: 100%;
   height: 1100px;
   margin: auto;
   position: relative;
   padding-left: 250px;
}

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
   <div id="divMenu">
      <jsp:include page="../menu.jsp" />
   </div>
   <div id="divListImg">
      <jsp:include page="../box.jsp" />
      <!-- 광고 이미지 -->
   </div>

   <div class="divBwrap">
      <div id="listSearch">
         <div id="listfrm">
            <input type="hidden" id="page" value="${cri.page}"> 
            <input type="hidden" id="postingNo"> 
            <select id="searchType" class="listSelect">
               <option value="postTitle"
                  <c:out value="${cri.searchType=='postTitle'?'selected':''}"/>>제목</option>
               <option value="writer"
                  <c:out value="${cri.searchType=='writer'?'selected':''}"/>>작성자</option>
               <option value="postContent"
                  <c:out value="${cri.searchType=='postContent'?'selected':''}"/>>내용</option>
            </select> 
            <input type="text" id="keyword" value="${cri.keyword}"> 
            <input type="button" value="SEARCH" id="btnSearch">
            <span>total:${pm.totalCount}</span>
         </div>   
      </div>
      <input type="hidden" id="page" value="${cri.page}">
      <div class="divBoardList">
         <h1>[게시판 목록]</h1>
         <c:forEach items="${list}" var="vo">
            <div class="row">
               <span class="postingNo">${vo.postingNo}</span>
               <div class="divBoardBox">
                  <img src="/display?fileName=${vo.image}">
                  <div class="divBoardTxt">
                     <p id="title">${vo.postTitle}</p>
                     <br>
                     <hr>
                     <p id="writer">${vo.writer}</p>
                     <p id="time">
                        <fmt:formatDate value="${vo.preperationTime}" pattern="yyyy-MM-dd" />
                     </p>
                     <p id="content" style="display: none;">${vo.postContent}</p>
                  </div>
               </div>
            </div>   
         </c:forEach>
          <div id="darken-background">
               <div id="lightbox">
                  <span id="lightimage"></span>
                  <div id="light">
                     <div class="profileImg">
                        <img src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg">
                     </div>
                     <div id="lightForm">
	                     <div id="lightWriter">작성자</div>
	                     <hr>
	                     <div id="lightTitle">글 제목</div>
	                     <div id="lightContent">글 내용</div>
                     </div>
                     
                     <div class="lightIn">
                        <hr>
                        <iframe src="" width="330px" height="270px"></iframe>
                     </div>
                     
                        <div class="lightX">
                           <i class="fas fa-ellipsis-v"></i>
                           <c:if test="${id!=null}">
                           <div id="ul">
                              <div id="btnUpdate"><a>수정하기</a></div>
                              <hr>
                              <div id="btnDelete"> <a>삭제하기</a></div>   
                              <input id="readNo" style="display: none;" type="text">
                           </div>
                           </c:if>
                           <i class="fas fa-times"></i>
                        </div>
                     
                     <c:if test="${id==null}">
               
                     </c:if>
                  </div>
               </div>
            </div>
            <!-- update lightbox -->
            
            <form action="update" name="frm" method="post" enctype="multipart/form-data">
               <div id="darken-background2">
                  <div id="uplightbox">
                     <input type="file" name="file" id="file">
                     <span id="updateImage"></span>
                     <input type="hidden" name="image">
                     <div class="uplight">
                        <div class="profileImg">
                           <img src="https://fiorecommunications.com/wp-content/uploads/2019/05/instagram-blog-person-icon.jpg">
                        </div>
                        <div id="updateForm">
	                        <div id="postWriter"></div>
	                        <hr>
	                        <div><input type="text" id="postTitle" name="postTitle"></div>
	                        <input class="postingNo" name="postingNo" id="updateNo" style="display: none;"  type="text">
	                        <div><textarea id="postContent" name="postContent"></textarea></div>
                        </div>
                        <input type="submit" value="수정" id="btnUpdate2">
                        <div class="lightIn">
                           <hr>
                           <jsp:include page="../reply/reply.jsp"/>
                        </div>
                        <div class="lightX">
                           <i class="fas fa-times"></i>
                        </div>   
                     </div>
                  </div>
               </div>
            </form>
      </div>
      <input id="btnBoardInsert" value="게시물작성 " type="button"></input>
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
   <!-- divWrap -->
</body>
<script>


   
   $("#listfrm").on("click","#btnSearch",function(){
      var searchType=$(this).parent().find("#searchType").val();
      var keyword=$(this).parent().find("#keyword").val();
      //alert(searchType+keyword);
      location.href="list?searchType="+searchType+"&keyword="+keyword;
   });

   $("#updateImage").on("click", function(){
      $(frm.file).click();
   });

   $(frm.file).on("change", function(){
      var file=$(frm.file)[0].files[0];
      $("#image").attr("src", URL.createObjectURL(file));
   });   

   $(frm).submit(function(e){
      e.preventDefault();
      if(!confirm("수정하시겠습니까?")) return;
      frm.submit();
      alert("수정완료!");
   });

   $("#btnUpdate").on("click", function() {
      $("#darken-background").hide();
      $("#darken-background2").fadeIn();
   });
   
   $(".divBoardList .row").on("click", function() {
      var postingNo=$(this).find(".postingNo").html();
      //alert(postingNo);
      $.ajax({
         type:"get",
         url:"/board/read",
         data:{"postingNo":postingNo},
         dataType:"json",
         success:function(data){
            if(data.image != ''){
               $("#lightimage").html("<img src='/display?fileName="+data.image+"' width=500 id='lightM'>");
               $("#updateImage").html("<img src='/display?fileName="+data.image+"' width=500 id='image'>");
            }else{
               $("#lightimage").html("<img src='http://placehold.it/100x80' width=500 id='lightM'>");
               $("#updateImage").html("<img src='http://placehold.it/100x80' width=500 id='image'>");
            }
            $("#lightWriter").html(data.writer);
            $("#lightTitle").html(data.postTitle);
            $("#lightContent").html(data.postContent);

            $("#postWriter").html(data.writer);
            $("#postTitle").val(data.postTitle);
            $("#postContent").val(data.postContent);
            
            $("#updateNo").val(postingNo);
            $("#readPostNo").val(postingNo);
            $("#readNo").val(postingNo);
            
            $("iframe").attr("src","/reply/reply?postingNo="+postingNo);
            
         }
      });
      $("#darken-background").show();
   });
   
   $("#ul").hide();
   $(".fa-ellipsis-v").mouseover(function() {
      $("#ul").show();
   });

   $(".fa-ellipsis-v").on("click", function() {
      $("#ul").hide();
   });

    $("#btnDelete").on("click", function(){
         if(!confirm("삭제하시겠습니까?"))return;
         var postingNo=$(this).parent().find("#readNo").val();
         alert(postingNo);
         $.ajax({
            type:"post",
            url:"/board/replyCount",
            data:{"postingNo":postingNo},
            success:function(data){
               if(data==0){
                  $.ajax({
                    type:"post",
                    url:"/board/delete",
                    data:{"postingNo":postingNo},
                    success:function(){
                       location.href="/board/list";
                       alert("삭제가 완료되었습니다.");
                    }
                    
                  });
               }else{
                  alert("리플이" + data + "개 달려있어서 삭제 불가능");
               }
            }
         });

      });

   $(".fa-times").on("click", function() {
      $("#darken-background").hide();
      $("#darken-background2").hide();
   });

   $("#btnBoardInsert").on("click", function() {
      location.href = "insert";
   });
   /*
    $(".row").on("click", ".divBoardBox", function(){
    var postingNo=$(this).parent().find(".postingNo").html();
    var page=$("#page").val();
    location.href="read?postingNo="+postingNo+"&page="+page;
    });
    */
   $("#pagination a").click(function(e) {
      e.preventDefault();
      var page = $(this).attr("href");
      location.href = "list?page=" + page;
   });
</script>
</html>