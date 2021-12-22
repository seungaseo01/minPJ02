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
<style type="text/css">
tr{
text-align: center;
}
.mdelete{
width: 60px;
} 
</style>
</head>

<body>
<div class="wrapper">

    <jsp:include page="../index/moduleZip/header.jsp"></jsp:include>
    
    <div class="content">   
 	<div id="content"  class="container">

		<table class="table col-sm-12">	
<!-- 검색창 -->			
			<tr>
				<td colspan="7">
				<div class="justify-content-md-center" >
					<div class="form-group col-md-6 offset-md-2 form-inline in ">
					<form action="/minPJ02/MemberSearch" class="col-md-12" method="post">
						 <select class="form-control" name="selectwt" style="height: 35px;">
                                  <option>아이디</option>
                                  <option>권한</option>
                         </select>
						<input type="text" class="form-control col-12 " name="msearch" size="30">
						<input class="btn btn-outline-secondary  float-right form-control " type="submit" value="검색하기">
					</form>
					</div>
					</div>
				</td>	
			</tr>

<!-- 사용자 리스트 -->				
			<tr>
            	<td id="mnum">번호</td>	
				<td>아이디</td>	
				<td>권한</td>	
				<td>이름</td>			
				<td>연락처</td>			
				<td>등록일</td>			
<!-- 				<td class="mdelete">삭제하기</td>	 -->		
			</tr>
			<c:forEach var="member" items="${list}">
				<tr>
					<td class="mnum"><input type="checkbox" id="chk" value="${member.mnum}"></td>					
					<td class="mid"><c:out value="${member.mid}"/></td>
					<td class="admin"><c:out value="${member.admin}"/></td>
					<td class="mname"><c:out value="${member.mname}"/></td>
					<td class="mtel"><c:out value="${member.mtel}"/></td>
					<td class="mregdate"><c:out value="${member.mregdate}"/></td>

				</tr>				
			</c:forEach>
 				<tr>
					<td colspan="6">
						<button type="button" id="del_btn" class="btn btn-outline-secondary  float-right form-control " style="width: 100px;">삭제하기</button>
					</td>

				</tr> 
		</table>					
        </div> 
        		        
	</div>	
    <jsp:include page="../index/moduleZip/footer.jsp"></jsp:include>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script>

$("#del_btn").click(function() {
    
    var chkArr = [];
    $("input[id='chk']:checked").each(function(i) {
       chkArr.push($(this).val());
    });
    
    if(chkArr == ""){
       alert('선택된 항목이 없습니다. 삭제할 항목을 선택해 주세요.');
       return false;
    }else {
       if(!confirm('정말 삭제하시겠습니까?')){
          return false;
       }else {
          $.ajax({
             url : "/minPJ02/MemberDelete",
             type : "POST",
             data : {chkArr:chkArr},
             traditional : true,
             success : function(data) {
                alert('삭제되었습니다.');
                location.reload();
             },
             
             error : function(request, status, error) {
                alert("에러");
                alert("code:" + request.status);
             }
             
          });
       }
       
    }
    
    
    
 });
</script>

</html>