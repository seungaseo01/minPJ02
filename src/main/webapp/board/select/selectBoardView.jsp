<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "<br/>"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/minPJ02/css/header.css">
<link rel="stylesheet" href="/minPJ02/css/index.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>Insert title here</title>

<style type="text/css">
#resultTable1{
 text-align: center;
}
#cContent{
 width: 50%;
 text-align: center;
}
</style>
</head>

<body>
<div  class="wrapper" >
    <jsp:include page="../../index/moduleZip/header.jsp"></jsp:include>
  <div class="content">
<!-- 제목선택 게시물창  -->   
 	<div id="content"  class="container">


		<c:set var="id" value="${sessionScope.userId}" />
		<input type="hidden" value="${id}" id="usersession">
		<c:set var="admin" value="${sessionScope.admin}" />
		<input type="hidden" value="${admin}" id="adsession">
		
		<table class="table col-sm-12">
		
	 	<c:forEach var="board" items="${list}">	
			
			<tr>
				<td>제목</td>
				<td colspan="3"><c:out value="${board.btitle}"/></td>
			</tr>	
						
			<tr>
				<td>작성자</td>
				<td colspan="3">
					<input type="hidden" id="bwriter" name="bwriter" value="${board.bwriter}"> 
					<c:out value="${board.bwriter}"/>
				</td>
			</tr>
						
			<tr>
				<td>작성일</td>
				<td><c:out value="${board.bregdate}"/></td>
				<td>조회수</td>
				<td><c:out value="${board.viewcnt}"/></td>
			</tr>	
						
			<tr>		
				<td colspan="4" class="bcontent" style=" height: 300px;">
				<pre class="col-sm-12" style="overflow: auto; overflow-x:hidden; width:1110px;  height:300px;"><c:out value="${board.bcontent}"/></pre>
				</td> 
			</tr>	
			
	 	</c:forEach>
			<tr>
				<td colspan="4" class="">
				    <a class="btn btn-outline-light text-dark ml-right " href="#" id="deBoard">삭제하기</a>
					<a class="btn btn-outline-light text-dark ml-right " href="#" id="upBoard">수정하기</a>
					<a class="btn btn-outline-light text-dark ml-right float-right " href="/minPJ02/index/index.jsp">home</a>
				</td>	
			</tr>

		
		</table>
	</div>	
     
 <!-- 댓글입력창 -->    
      <div id="content"  class="container">


      <table class="table col-sm-12" id="resultTable1">
        	 <tr>      
               <td colspan="5">
                  <div class="justify-content-md-center yap">                  
                     <div class="form-group col-md-8 offset-md-2 form-inline yap2" >
                     
                     	<c:set var="id" value="${sessionScope.userId}" />
						<c:choose>	
						
								   
						<c:when test="${id != null}">			      
		                    <form action="/minPJ02/CommentInsert" method="post"> 
	                           <input type="hidden" id="mid" name="mid" class="form-control" value="${id}">
	                           <input type="hidden" id="bnum" name="bnum" class="form-control" value="${param.bnum}">
	                           <input type="text" id="cwriter" name="cwriter" class="form-control" size="10" readonly="readonly" value="<%= session.getAttribute("userId") %>">               
	                           <input type="text" id="ccontent" name="ccontent" class="form-control" placeholder="댓글" size="35">
	                           <input type="submit" class="btn btn-outline-light text-dark ml-right " value="댓글달기">
	                        </form>	                      						      
						</c:when>
							      
						<c:otherwise>
						
							<form action="#" method="post"> 
								<input type="hidden" id="mid" name="mid" class="form-control" value="${id}">
	                            <input type="hidden" id="bnum" name="bnum" class="form-control" value="${param.bnum}">
	                        </form>
						</c:otherwise>
						</c:choose>

                     </div>
                  </div>
               </td>      
            </tr>

<!-- 댓글목록 -->               
            <tr>
               <td>작성자</td>
               <td id="cContent">댓글</td>
               <td id="crg">작성일</td>
               <td id="cde">삭제하기</td>
            </tr>
 
      </table>
   </div>   
    
              
      <div class="container">
         <table class="table">
            
         </table>      
      </div>
      

 </div>
    <jsp:include page="../../index/moduleZip/footer.jsp"></jsp:include>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

 <script>
 
 //댓글 목록 불러오기
 	 $(document).ready(function(){
 		
		var bnum = $("#bnum").val();
		var userId = $("#usersession").val();
		var userAd = $("#adsession").val();
		
		$.ajax({
		url : "/minPJ02/CommemtView",	
		type : "POST",	
		data : {bnum:bnum},
		success : function(data) {
			 console.log('log---------'+data);			 
			 
             var tableElement = "<tr>"; 

               $.each(data , function(i){
                   var bnum = data[i].bnum;
                   var cnum = data[i].cnum;  
                   var cwriter = data[i].cwriter;  
                   var ccontent = data[i].ccontent;  
                   var cregdate = data[i].cregdate.substring(0, 10);  
                   var idNo = "cdelete"+cnum;
                   var upNo = "cupdate"+cnum;
                   
                 tableElement += '<td>' 
                 			  + cwriter
                 			  + '</td><td id="cContent">' 
                 			  + ccontent 
                 			  + '</td><td id="crg">' 
                 			  + cregdate 
                  			  + '</td><td id="cde">'
                  			  +'<a id="'+idNo+'"class="btn btn-outline-light text-dark ml-right "  href="#" >삭제하기</a>' 
                 			  +'</td>';
                 tableElement += '</tr>';
   
                 $(document).on("click", "#"+idNo, function() {
                	 
                	 if(userAd==1){
                         if(!confirm('정말 삭제하시겠습니까?')){
                             return false;
                          }else {
                     		 location.href='/minPJ02/CommentDelete?bnum='+bnum+'&cnum='+cnum+'&cwriter='+cwriter;
                          }

                	 }else{
                    	 if(userId==cwriter){
                             if(!confirm('정말 삭제하시겠습니까?')){
                                 return false;
                              }else {
                         		 location.href='/minPJ02/CommentDelete?bnum='+bnum+'&cnum='+cnum+'&cwriter='+cwriter;
                              }
                    	 }else{
                    		 alert("권한이 없습니다.")
                    		 return false;
                    	 }	 
                	 }
                	 
                  });
                
                 
               });
   			                
              
              $("#resultTable1").append(tableElement);
              

		  		},
		error : function(request, status, error) {
		  		alert("code:"+request.status);
		  		alert("CommemtView에러");
		  					
		}	
		})
		


//게시글 업데이트 권한확인후 업데이트 서블릿으로 연결
		 $("#upBoard").click(function(){
			 
			var mid = $("#mid").val();
			var bwriter = $("#bwriter").val();
			var bnum = ${param.bnum};

	        if(mid==null){
	        	alert("로그인 후 이용해주세요");  
	        }else if(mid==bwriter){
 	            location.href="/minPJ02/BoardSelectView?bnum="+bnum+"&modify=1";
	        }else if(mid!=bwriter){
	        	alert("권한이 존재하지 않습니다.");  
	        }

			 
		 })
		

//게시글 삭제 권한 확인 후 삭제 서블릿
		 $("#deBoard").click(function(){
			 
			var mid = $("#mid").val();
			var mad = $("#adsession").val();
			var bwriter = $("#bwriter").val();
			var bnum = ${param.bnum};


	        if(mid==null){
	        	alert("로그인 후 이용해주세요");  
	        }else if(mid==bwriter|| mad==1){
	        	  $.ajax({
	                  url : "/minPJ02/BoardDelete",
	                  type : "POST",
	                  data : {bnum:bnum}, //{파라미터 명:파라미터 값}
	                  success : function(data) {
	                       if(data == 1){
	                    	   if(!confirm('정말 삭제하시겠습니까?')){
	                               return false;
	                            }else {
	                           	   alert("게시물삭제가 완료되었습니다.");
	 	                           location.href="/minPJ02/BoardViewList";       
	                            }
	                               
	                     }else if(data == -1){
	                        alert("게시물삭제를 실패했습니다.");   
	                     }
	                  },
	                  error : function(request, status, error) {
	                     alert("code:"+request.status);
	                     alert("에러");	                     
	                  }
	     		 })

	        }else if(mid!=bwriter){
	        	alert("권한이 존재하지 않습니다.");  
	        }
 
		 })

		 
		 
		 
		 
		 
		 
		 
 	}) 


    </script>


</html>