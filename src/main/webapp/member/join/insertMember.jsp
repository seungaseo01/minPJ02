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

        
            <form action="#" id="content01" method="post" >

                <table class="table col-sm-12">

                    <tr>
                        <td colspan="2">
                            <h2>회원가입</h2>
                        </td>

                    </tr>

<!-- 아이디 입력 -->
                    <tr>
                        <td style="width: 320px;">
                            <label for="mid">아이디 </label>
                        </td>
                        <td>
                             <input type="text" id="mid" name="mid"  placeholder="아이디를 입력해주세요"> <br>
                             <span id="error_box_id" style="font-size: 4px;"></span> 
                        </td>
                    </tr>

<!-- 비밀번호 입력 -->
                    <tr>
                        <td>
                            <label for="mpassword">비밀번호</label>
                        </td>
                        <td>
                            <input type="password" id="mpassword" name="mpassword" placeholder="비밀번호를 입력해주세요" > <br>    
                            <span id="error_box_pwd" style="font-size: 4px;">8~16자 영문 대소문자, 숫자 및 특수문자 두 가지 이상을 혼합하여 사용하세요.</span>
                        </td>
                    </tr>
                            

<!-- 비밀번호 확인 --> 
                    <tr>
                        <td>
                            <label for="user_pw_ck">비밀번호 확인</label>
                        </td>
                        <td>
                            <input type="password" id="user_pw_ck" name="user_pw_ck"  placeholder="비밀번호를 재입력해주세요"> <br>
							<span id="error_box_pwdck" style="font-size: 4px;"></span> 
                        </td>
                    </tr>
                            

<!-- 이름 입력 -->
                    <tr>
                        <td>
                            <label for="mname">이름</label>
                        </td>
                        <td>
                            <input type="text" id="mname" name="mname"> 
                        </td>
                    </tr>
                    
 
<!-- 연락처 입력 -->
                    <tr>
                        <td>
                            <label >연락처</label>
                        </td>
                        <td>
                             <select id="mem_phone" name="mem_phone">
                                  <option>010</option>
                                  <option>011</option>
                                  <option>016</option>
                              </select>
                              &nbsp; ㅡ &nbsp;
                              <input type="text" id="mem_phone1" name="mem_phone1" autocomplete="off" class="num" maxlength="4" style="width:60px ">
                              &nbsp; ㅡ &nbsp;
                              <input type="text" id="mem_phone2" name="mem_phone2" autocomplete="off" class="num" maxlength="4" style="width:60px ">
                        </td>
                    </tr>
                    

<!-- 생년월일 입력 -->
                    <tr>
                        <td>
                            <label >생년월일</label>
                        </td>
                        <td>
                             <input type="date" id="mbirth" name="mbirth"> 
                        </td>
                    </tr>
                    

<!-- 이메일 입력 -->                                    
                    <tr>
                        <td>
                            <label for="memail">이메일</label>
                        </td>
                        <td>
							<input type="text" name="memail01" id="memail01" style="width:100px"> @
							<input type="text" name="memail02" id="memail02" style="width:100px;" readonly value="naver.com">
							<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail">
								 <option value="1">직접입력</option>
								 <option value="naver.com" selected>naver.com</option>
								 <option value="hanmail.net">hanmail.net</option>
								 <option value="hotmail.com">hotmail.com</option>
								 <option value="nate.com">nate.com</option>
								 <option value="yahoo.co.kr">yahoo.co.kr</option>
								 <option value="empas.com">empas.com</option>
								 <option value="dreamwiz.com">dreamwiz.com</option>
								 <option value="freechal.com">freechal.com</option>
								 <option value="lycos.co.kr">lycos.co.kr</option>
								 <option value="korea.com">korea.com</option>
								 <option value="gmail.com">gmail.com</option>
								 <option value="hanmir.com">hanmir.com</option>
								 <option value="paran.com">paran.com</option>
							</select>
                        </td>
                    </tr>


<!-- 성별 입력 -->                    
                    <tr>
                        <td>
                            <label for="mgender">성별</label>
                        </td>
                        <td>
                            남 <input type="radio" id="mgender" name="mgender" value="남성"> 
                            여 <input type="radio" id="mgender" name="mgender" value="여성">
                        </td>        
                    </tr>
                     
     

                    <tr id="joinCp">
                        <td colspan="2"><input id="btn3"  class="btn btn-outline-light text-dark ml-right" type="button" value="가입하기"></td>    
                    </tr>    

                </table>    
              </form> 

        </div> 
        
        
  </div>  
    <jsp:include page="../../index/moduleZip/footer.jsp"></jsp:include>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

 <script>
 
      $(function(){


 //아이디 값 중복 확인   
 
 
       $("#mid").on("keyup", function() {
         
         var id = $("#mid").val();
         
         $.ajax({
            url : "../../JionIdChecker",
            type : "POST",
            data : {id1:id},
            success : function (data) {
               if(data == 1){
                  $("#error_box_id").html("이미 사용 중인 아이디입니다.");
                  return false;
               }else if(data == 2){
                  $("#error_box_id").html("아이디를 입력해주세요");
               }else {
                  $("#error_box_id").html("사용 가능한 아이디입니다.");
               }
            },
            
            error : function(request, status, error) {
               alert("에러");
               alert("code:" + request.status);
            }
         });   
      });   
 
	
//비밀번호	 조건확인
		
	      $("#mpassword").on("keyup", function() {
	          
	          var pwd = $("#mpassword").val();
	          
	          if(pwd.length < 8 || pwd.length > 17){
	             $("#error_box_pwd").html("8~16자 영문 대소문자, 숫자 및 특수문자 두 가지 이상을 혼합하여 사용하세요.");
	          }else if(pwd.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)){
	             $("#error_box_pwd").html("사용 가능한 비밀번호입니다.")
	          }
	          

	          
	       });
		
		
		
 //mpassword 입력확인
      	   $("#user_pw_ck").on("keyup", function() {

            var result_pw = $("#mpassword").val();

            var result_pw_ck = $("#user_pw_ck").val();

            if((result_pw != " " || result_pw_ck != " ") || (result_pw != " " && result_pw_ck != " ") ){

                if(result_pw != result_pw_ck){
   	             $("#error_box_pwdck").html("비밀번호를 확인해주세요")
                }else{           
   	             $("#error_box_pwdck").html("비밀번호가 일치합니다.")
                }
   
            }
            
        });

 
// 이메일 선택장
      	 $('#selectEmail').change(function(){
     		
     		if($(this).val()== '1'){ 
     			 $("#memail02").val('');                   
     			 $("#memail02").attr("readonly",false); 
     		}else{
     			 $("#memail02").val($(this).val());    
     			 $("#memail02").attr("readonly",true);
     		}
     });
      	 
  
// 회원가입 서블릿으로 넘어가기전 확인
         $("#btn3").on("click",function(){
     	  
             var mid = $("#mid").val();
             var mname = $("#mname").val();
             var mpassword = $("#mpassword").val();
             var user_pw_ck = $("#user_pw_ck").val();
             var mem_phone = $("#mem_phone").val();
             var mem_phone1 = $("#mem_phone1").val();
             var mem_phone2 = $("#mem_phone2").val();
             var mbirth = $("#mbirth").val();
             var memail01 = $("#memail01").val();
             var memail02 = $("#memail02").val();
             var mgender = $("#mgender").val();
             

	          if(mid == ""){
	        	  alert("아이디를 입력해주세요.")	
	        	  $("#mid").focus();
	          }else if(mpassword==""){
	             alert("비밀번호를 입력해주세요.");
	        	 $("#mpassword").focus();
	          }else if(mpassword.length < 8 || mpassword.length > 17){
	             alert("비밀번호는 8~16자사이로 입력해주세요.");
	        	 $("#mpassword").focus();
	          }else if(mpassword.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/) == false){
	             alert("영문 대소문자, 숫자 및 특수문자 두 가지 이상을 혼합하여 사용하세요.");
	        	 $("#mpassword").focus();
	          }else if(user_pw_ck == ""){
	        	  alert("비밀번호를 확인해주세요.")   
		       	  $("#user_pw_ck").focus();
	          }else if(mpassword != user_pw_ck){
	        	  alert("비밀번호가 일치하지 않습니다.")        	  
		          $("#user_pw_ck").focus();
	          }else if(mname == ""){
	        	  alert("이름을 입력해주세요.") 
	        	  $("#mname").focus();
	          }else if(mbirth == ""){
	        	  alert("생년월일을 입력해주세요.")	  
	        	  $("#mbirth").focus();
	          }else if(memail01 == ""){
	        	  alert("메일을 입력해주세요.")	    
	        	  $("#memail01").focus();
	          }else{
	              $.ajax({
	                  url : "/minPJ02/MemberInsert",
	                  type : "POST",
	                  data : {mid:mid, 
	                     mname:mname, 
	                     mpassword:mpassword, 
	                     mem_phone:mem_phone, 
	                     mem_phone1:mem_phone1, 
	                     mem_phone2:mem_phone2, 
	                     mbirth:mbirth, 
	                     memail01:memail01, 
	                     memail02:memail02, 
	                     mgender:mgender}, //{파라미터 명:파라미터 값}
	                  success : function(data) {
	                       if(data == 1){
	                          alert("회원가입이 완료되었습니다.");
	                           location.href="/minPJ02/index/index.jsp";            
	                     }else if(data == -1){
	                        alert("회원가입을 실패했습니다.");   
	                     }
	                  },
	                  error : function(request, status, error) {
	                     alert("code:"+request.status);
	                     alert("정보를 모두 기입해주세요");
	                     
	                  }	                  
	          	})
             }  
          
      })
      	 
 	 
      	 
 
    })
 
    </script>
</html>