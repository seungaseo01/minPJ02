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
<div class="wrapper" >
    <jsp:include page="../../index/moduleZip/header.jsp"></jsp:include>
    
  <div class="content">   	
 	<div id="content"  class="container">

        
            <form action="/minPJ02/BoardInsert" id="content01" method="post" >

                <table class="table col-sm-12">

                    <tr>
                        <td colspan="2">
                            <h2>게시글쓰기</h2>
                        </td>

                    </tr>
	
					<tr>
						<td><label for="btitle">제목 : </label></td>
						<td><input type="text" id="btitle" name="btitle" class="form-control"> <br></td>
					</tr>
				
					<tr>
						<td><label for="bwriter">작성자 : </label></td>						
						<td><input type="text" id="bwriter" name="bwriter" class="form-control" value="${sessionScope.userId}"  readonly> <br></td>						
					</tr>
			
					<tr>
						<td>
							<label for="bpassword">비밀글 </label>
							<input type="checkbox" id="bpassword" name="bpw" value="1">
						</td>
						<td>
							<input type="text" id="bpassword" name="bpassword" class="form-control" placeholder="숫자 4자리입력" ><br>
						</td>
					</tr>	
				
					<tr>
						<td colspan="2"><textarea class="form-control" rows="5" id="comment" name="bcontent"  placeholder="내용을 입력하세요" wrap="hard"></textarea> <br></td>
					</tr>
				
					<tr>
						<td colspan="2"><input type="submit" class="btn btn-outline-light text-dark ml-right float-right con_bnt_in" value="입력하기"><br></td>
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
 
 $(function () {
	    $('.con_bnt_in').click(function () {
	        if (!confirm('게시글을 작성하시겠습니까?')) {
	            return false;
	        }else{
	        	alert("게시글이 작성되었습니다.")
	        }
	    });
	});
 
    </script>
</html>