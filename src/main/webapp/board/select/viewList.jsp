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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<title>Insert title here</title>
<style type="text/css">


.searchbox{
display: flex;
justify-content: center;
}

.in{
width: 100%;
margin: 0;
}
</style>
</head>

<body>



<div  class="wrapper" >

    <jsp:include page="../../index/moduleZip/header.jsp"></jsp:include>
    
    <div class="content">   
 	<div id="content" class="container">


		<table class="table col-sm-12">
		
<!-- 검색창 -->			
			<tr>
				<td colspan="5">
				<div class="justify-content-md-center searchbox">
					<div class="form-group col-md-6 offset-md-2 form-inline in ">
					<form action="BoardSearch" class="col-md-12" method="post">
					
					
					
					
					
						 <select class="form-control" name="selectwt" style="height: 35px;">
                                  <option>작성자</option>
                                  <option>제목</option>
                         </select>
                         
                  
                   
                   
                   
                   
						<input type="text" class="form-control col-12 " name="bsearch" size="30">
						<input class="btn btn-outline-secondary  float-right form-control " type="submit" value="검색하기">
					</form>
					</div>
					</div>
				</td>	
			</tr>

<!-- 게시물 리스트 -->				
			<tr>
            	<td id="num">번호</td>	
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</td>	
				<td>작성자</td>	
				<td>&nbsp;&nbsp;작성일</td>	
				<td>조회수</td>			
			</tr>
			<c:forEach var="board" items="${list}">
				<tr>
					<td class="bnum"><c:out value="${board.bnum}"/></td>
					
					<td class="btitle">	
					

						<c:if test="${board.bpassword==null}">												
							<a href="/minPJ02/BoardSelectView?bnum=${board.bnum}">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<c:out value="${board.btitle}"/></a>								
							[<c:out value="${board.count}"/>]							
						</c:if>
				
						<c:if test="${board.bpassword!=null}">	
						
						
							<c:set var="admin" value="${sessionScope.admin}" />
							<input type="hidden" value="${admin}">
								
							<c:choose>
								<c:when test="${admin == 1}">
									<a href="/minPJ02/BoardSelectView?bnum=${board.bnum}" >
									<img alt="" src="/minPJ02/icon/lock.png">
									<c:out value="${board.btitle}"/></a>
									[<c:out value="${board.count}"/>]	
								</c:when>
	
								<c:otherwise>
																								
									<a href="/minPJ02/board/insert/BoardPWCheck.jsp?bnum=${board.bnum}" >
									<img alt="" src="/minPJ02/icon/lock.png">
									<c:out value="${board.btitle}"/></a>
									[<c:out value="${board.count}"/>]	
												
								</c:otherwise>
							</c:choose>						
							
						</c:if>
						
					</td>
					
					<td class="bcontent"><c:out value="${board.bwriter}"/></td>
					<td class="con_date"><c:out value="${fn:substring(board.bregdate, 0, 11)}"/></td>
					<td class="viewcnt"><c:out value="${board.viewcnt}"/></td>
				</tr>
				
			</c:forEach>
			
<!-- 게시글 작성 버튼-->             
                <tr>
					<td colspan="5" class="">
					    <a id="write" class="btn btn-outline-light text-dark ml-right float-right " href="#">게시글 작성</a>
					</td>	
				</tr>
				
<!-- 게시글 작성 권한 확인 -->  				
				<c:set var="id" value="${sessionScope.userId}" />
			   <c:choose>
			   
			      <c:when test="${id != null}">
			         <script type="text/javascript">
			            $(function() {
			               
			               $("#write").click(function() {
			                  location.href = "/minPJ02/board/insert/insertBoard.jsp"
			               })
			               
			            });
			         </script>
			      
			      </c:when>
			      
			      <c:otherwise>
			         <script type="text/javascript">
			         $(function() {
			            
			            $("#write").click(function() {
			               alert("로그인 후 게시물을 등록하실 수 있습니다.")
		              		 location.href = "/minPJ02/member/login/loginForm.jsp"
		           	 })
			            
			         });
			         </script>
			      </c:otherwise>
			   			   
			   </c:choose>
		
        </table>    
        </div> 
        

		        
	</div>	
    <jsp:include page="../../index/moduleZip/footer.jsp"></jsp:include>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 --><!-- Latest compiled and minified CSS -->




</body>





</html>