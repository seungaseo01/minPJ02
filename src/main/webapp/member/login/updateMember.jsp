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

        
            <form action="#" id="content01" method="post" >

                <table class="table col-sm-12">
               <c:forEach var="member" items="${list}">
                    <tr>
                        <td colspan="2">
                            <h2>회원정보 수정</h2>
                        </td>
                    </tr>
<!-- 아이디 입력 -->
                    <tr>
                        <td>
                            <label for="mid">아이디 </label>
                        </td>
                        <td>
                             <input type="text" id="mid" name="mid" value="${member.mid}" readonly="readonly">
                        </td>
                    </tr>


<!-- 비밀번호 입력 -->                   
                    <tr>
                        <td>
                            <label for="mpassword">비밀번호</label>
                        </td>
                        <td>
                            <input type="password" id="mpassword" name="mpassword" value="${member.mpassword}">    
                        </td>
                    </tr>

<!-- 비밀번호 확인 -->
                     <tr>
                        <td>
                            <label for="user_pw_ck">비밀번호 확인</label>
                        </td>
                        <td>
                            <input type="password" id="user_pw_ck" name="user_pw_ck"  placeholder="비밀번호를 재입력해주세요">
                            <input id="btn2" type="button" value="비밀번호 확인"> 
                        </td>
                    </tr>

<!-- 이름 입력 -->                    
                    <tr>
                        <td>
                            <label for="mname">이름</label>
                        </td>
                        <td>
                            <input type="text" id="mname" name="mname" value="${member.mname}"> 
                        </td>
                    </tr>
                    

<!-- 연락처 입력 -->
                    <tr>
                        <td>
                            <label >연락처</label>
                        </td>
                  		<td>
                  
                         <c:if test="${fn:substring(member.mtel, 0, 3) eq '010'}">
                             <select name="mem_phone" id="mem_phone">
                                  <option selected="selected">010</option>
                                  <option>011</option>
                                  <option>016</option>
                              </select>
                          </c:if>    
                  
                         <c:if test="${fn:substring(member.mtel, 0, 3) eq '011'}">
                             <select name="mem_phone" id="mem_phone">
                                  <option>010</option>
                                  <option selected="selected">011</option>
                                  <option>016</option>
                              </select>
                          </c:if>    
                  
                         <c:if test="${fn:substring(member.mtel, 0, 3) eq '016'}">
                             <select name="mem_phone" id="mem_phone">
                                  <option>010</option>
                                  <option>011</option>
                                  <option selected="selected">016</option>
                              </select>
                          </c:if>    
                          
                          
                          
                              &nbsp; ㅡ &nbsp;
                              <input type="text" id="mem_phone1" name="mem_phone1" autocomplete="off" class="num"  value="${fn:substring(member.mtel, 4, 8)}" style="width:60px ">
                              &nbsp; ㅡ &nbsp;
                              <input type="text" id="mem_phone2" name="mem_phone2" autocomplete="off" class="num" value="${fn:substring(member.mtel, 9, 13)}" style="width:60px ">
                  
                  
                  		</td>
          
                    </tr>
                    
 
<!-- 생년월일 입력 -->
                    <tr>
                        <td>
                            <label >생년월일</label>
                        </td>
                        <td>
                             <input type="date" id="mbirth" name="mbirth" value="${member.mbirth}"> 
                        </td>
                    </tr>
   
<!-- 이메일 입력 -->                               
                    <tr>
                        <td>
                            <label for="memail">이메일</label>
                        </td>
                         <td>
                            <input type="email" id="memail" name="memail" value="${member.memail}"> 
                        </td>
<%--                         <td>
							<input type="text" name="memail01" id="memail01" style="width:100px" value="${member.memail}"> @
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
                        </td> --%>
                    </tr>


<!-- 성별 입력 -->                    
                    <tr>                    
                       <td>
                          <label for="mgender">성별</label>
                        </td>
                        
                        <td>
                           <c:if test="${member.mgender eq '남성'}">
                            남 <input type="radio" id="mgender" name="mgender" value="남성" checked="checked"> 
                            여 <input type="radio" id="mgender" name="mgender" value="여성">
                       </c:if>    

                         <c:if test="${member.mgender eq '여성'}">
                            남 <input type="radio" id="mgender" name="mgender" value="남성"> 
                            여 <input type="radio" id="mgender" name="mgender" value="여성" checked="checked">                      
                       </c:if>
                       
                        </td>

                    </tr>
   

                    <tr id="joinCp">
                        <td colspan="2"><input id="btn3" class="btn btn-outline-light text-dark ml-right float-right" type="submit" value="수정하기"></td>    
                    </tr>    
               </c:forEach>
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

        $("#truePw").hide();
        $("#falsePwWarn").hide();

        
//mpassword 입력확인
        $("#btn2").click(function(){
   
           var result_pw = $("#mpassword").val();

            var result_pw_ck = $("#user_pw_ck").val();

            if((result_pw != " " || result_pw_ck != " ") || (result_pw != " " && result_pw_ck != " ") ){

                if(result_pw != result_pw_ck){
                    $("#truePw").hide();
                    $("#falsePwWarn").show();   
                    $("#requiredPw").hide();   
                }else{           
                    $("#truePw").show();
                    $("#falsePwWarn").hide();
                    $("#requiredPw").hide();
                }
   
            }else{
                $("#requiredPw").show();
            }
            
        });
        
//MemberUpdate 서블릿으로 정보전송후 확인창 까지
        $("#btn3").on("click",function(){
  
               var mid = $("#mid").val();
               var mname = $("#mname").val();
               var mpassword = $("#mpassword").val();
               var mem_phone = $("#mem_phone").val();
               var mem_phone1 = $("#mem_phone1").val();
               var mem_phone2 = $("#mem_phone2").val();
               var mbirth = $("#mbirth").val();
               var memail = $("#memail").val();
               var mgender = $("#mgender").val();

             $.ajax({
                url : "/minPJ02/MemberUpdate",
                type : "POST",
                data : {mid:mid, 
                   mname:mname, 
                   mpassword:mpassword, 
                   mem_phone:mem_phone, 
                   mem_phone1:mem_phone1, 
                   mem_phone2:mem_phone2, 
                   mbirth:mbirth, 
                   memail:memail, 
                   mgender:mgender}, //{파라미터 명:파라미터 값}
                success : function(data) {
                     if(data == 1){
                        alert("회원정보수정이 완료되었습니다.");
                         location.href="/minPJ02/MemberSelect";            
                   }else if(data == -1){
                      alert("회원정보수정을 실패했습니다.");   
                   }
                },
                error : function(request, status, error) {
                   alert("code:"+request.status);
                   alert("에러");
                   
                }
                
                
             })
          
            
        })


 
    })
 
    </script>




</html>