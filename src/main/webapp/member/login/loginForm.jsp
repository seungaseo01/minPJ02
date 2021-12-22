<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

                    <tr>
                        <td colspan="2">
                            <h2>로그인</h2>
                        </td>

                    </tr>

                    <tr>
                        <td>
                            <label for="mid">아이디 </label>
                        </td>
                        <td>
                             <input type="text" id="mid" name="mid"  placeholder="아이디">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="mpassword">비밀번호</label>
                        </td>
                        <td>
                            <input type="password" id="mpassword" name="mpassword" placeholder="비밀번호" >    
                        </td>
                    </tr>
                            
					
                    <tr>
                        <td></td>
                        <td >
                           <span></span>                          
                        </td>                           
                    </tr>
					
                   
                    <tr id="joinCp">
                        <td colspan="2"><input id="btn1"  class="btn btn-outline-light text-dark ml-right "  type="submit" value="로그인"></td>    
                    </tr>    

                </table>    
 
        </div> 
        
   </div> 
    <jsp:include page="../../index/moduleZip/footer.jsp"></jsp:include>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

 <script>
 
      $(function(){


  		$("#btn1").click(function() {
  			
  			var id1 = $("#mid").val();
  			
  			$.ajax({
  	            url : "../../JionIdChecker",
  	            type : "POST",
  	            data : {id1:id1},
  	            success : function (data) {
  	            	
  	               if(data == 1){
  	                  
  	            	 var pw1 = $("#mpassword").val();
  	     			
  	     			$.ajax({
  	     				url : "/minPJ02/Login",
  	     				type : "POST",
  	     				data : {id1:id1, pw1:pw1}, //{파라미터 명:파라미터 값}
  	     				success : function(data) {
  	       					if(data == 1){
  	      		               location.href="/minPJ02/index/index.jsp";	
  	     					}else if(data == 2){
  	     						alert("비밀번호가 틀렸습니다.");
  	     					}
  	     				},
  	     				error : function(request, status, error) {
  	     					alert("code:"+request.status);
  	     					alert("에러");
  	     					
  	     				}				
  	     				
  	     			})   			
  	    		
         	   
  	               }else if(data == 2){
  	            	 alert("아이디를 입력해주세요")
  	               }else {

  	            	alert("존재하지 하지 않는 아이디입니다")
  	               }
  	            },
  	            
  	            error : function(request, status, error) {
  	               alert("에러");
  	               alert("code:" + request.status);
  	            }
  	         });   
  			
  			
  			

  							
  		})
/*   		$("#btn1").click(function() {
  			
  			var id1 = $("#mid").val();
  			var pw1 = $("#mpassword").val();
  			
  			$.ajax({
  				url : "/minPJ02/Login",
  				type : "POST",
  				data : {id1:id1, pw1:pw1}, //{파라미터 명:파라미터 값}
  				success : function(data) {
    					if(data == 1){
   		               location.href="/minPJ02/index/index.jsp";	
  					}else if(data == 2){
  						alert("비밀번호가 틀렷습니다.");
  					}else if(data == -1){
  						alert("아이디가 틀렷습니다.");
  					} 
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