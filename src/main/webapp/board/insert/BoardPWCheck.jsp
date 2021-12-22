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

        
            <div id="content01" >

				<input type="hidden" id="bnum" name="bnum" class="form-control" value="<c:out value="${param.bnum}"></c:out>" >
				
                <table class="table col-sm-12">

                    <tr>
						<td  colspan="2">
							<h2>비밀번호 확인</h2>
												
						</td>
						
					</tr>
				
					<tr>
						<td><label for="bpassword">비밀번호 : </label></td>
						<td><input type="number" id="bpassword" name="bpassword" class="form-control"><br></td>
					</tr>
				
					<tr>
						<td colspan="2"><input type="button" class="btn btn-outline-light text-dark ml-right float-right " id="btn1" value="확인"><br></td>
					</tr>
	
                </table>    
              </div> 

        </div> 
 </div>   
    <jsp:include page="../../index/moduleZip/footer.jsp"></jsp:include>

</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

 <script>
 
 

 $(function () {
	 
	 $("#btn1").click(function(){
		 
		var bnum = $("#bnum").val();
		var bpassword = $("#bpassword").val();

		
		$.ajax({
			
			url : "../../BoardPWCheck",
			type : "POST",
			data : {bnum:bnum, bpassword:bpassword},//{파라미터 명:파라미터 값}
			success :function(data) {
				
				if(data==2){
					alert("비밀번호를 확인해주세요!");

				}else{
					location.href="/minPJ02/BoardSelectView?bnum="+bnum;
				}
				
				
			},
			error : function(request, status, error) {
				alert("code:"+request.status);
				alert("에러");
				
			}
			
		});
			
			
			
			
		 
	 });
	 
	 
	 
	 
	 
/* 		$("#btn1").click(function() {
			ck_id++;
			var bnum = $("#bnum").val();
			var bpassword = $("#bpassword").val();
	 
	 $.ajax({
			url : "/minPJ02/BoardPWCheck",
			type : "POST",
			data : {bnum:bnum, bpassword:bpassword}//{파라미터 명:파라미터 값}
			success : function(data) {
				alert(data);

			},
			error : function(request, status, error) {
				alert("code:"+request.status);
				alert("에러");
				
			}
			
			
		})
	 
	  
		}) */
	})
	 
	 

    </script>
</html>