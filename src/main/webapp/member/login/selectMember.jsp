<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
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
</head>

<body>
<div  class="wrapper" >
    <jsp:include page="../../index/moduleZip/header.jsp"></jsp:include>
  <div class="content">
    
 	<div id="content"  class="container">


		<table class="table col-sm-12">
		

			<c:forEach var="member" items="${list}">
			<input type="hidden" id="mid" value="${member.mid}">
			<input type="hidden" id="mpw" value="${member.mpassword}">
				<tr>
					<td>성명</td>				
					<td><c:out value="${member.mname}"/></td>								
				</tr>
				
				<tr>
					<td>아이디</td>				
					<td><c:out value="${member.mid}"/>

					</td>								
				</tr>
				
				<tr>
					<td>연락처</td>				
					<td><c:out value="${member.mtel}"/></td>				
				
				</tr>
				
				<tr>
					<td>이메일</td>				
					<td><c:out value="${member.memail}"/></td>								
				</tr>
				
				<tr>
					<td>생년월일</td>				
					<td><c:out value="${member.mbirth}"/></td>								
				</tr>

		
			
             
                <tr>
					<td colspan="2" class="">
					    <a id="memDelete" class="btn btn-outline-light text-dark ml-right float-right" href="#">탈퇴하기</a>
					    <a id="memUpdate" class="btn btn-outline-light text-dark ml-right float-right" href="#">내 정보 수정하기</a>
<%-- 					    <a id="write" class="btn btn-outline-light text-dark ml-right float-right" href="/minPJ02/login/updateMember.jsp?mid=${member.mid}">내 정보 수정하기</a> --%>
					</td>	
				</tr>
			</c:forEach>
        </table>    
    

        </div> 
 </div>       

    <jsp:include page="../../index/moduleZip/footer.jsp"></jsp:include>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>
 
 	 $(function(){
 
 		 $("#memUpdate").click(function(){
 			var mid = $("#mid").val();
 	        var u_pw = prompt("비밀번호를 입력하세요.");
 	         
 	         if(u_pw == $("#mpw").val()){
 	            
 	            location.href="/minPJ02/MemberSelect?mid="+mid+"&modify=1";

 	         }else if(u_pw == null){
 	            
 	         }else{
 	            alert("비밀번호가 일치하지 않습니다.");
 	         }
 			 
 		 })
 
 		 $("#memDelete").click(function(){
 			var mid = $("#mid").val();
 	        var u_pw = prompt("비밀번호를 입력하세요.");
 
 	         if(u_pw == $("#mpw").val()){
 	            
     			$.ajax({
    				url : "/minPJ02/MemberDelete",
    				type : "POST",
    				data : {mid:mid}, //{파라미터 명:파라미터 값}
    				success : function(data) {
      					if(data == 1){
      					   alert("회원탈퇴가 완료되었습니다.");
    		               location.href="/minPJ02/index/index.jsp";				
    					}else if(data == -1){
    						alert("회원탈퇴를 실패했습니다.");	
    					}
    				},
    				error : function(request, status, error) {
    					alert("code:"+request.status);
    					alert("에러");
    					
    				}
    				
    				
    			}) 	            

 	         }else if(u_pw == null){
 	            
 	         }else{
 	            alert("비밀번호가 일치하지 않습니다.");
 	         }
 			 
 		 })
 

		
	 })
 


    </script>



</html>