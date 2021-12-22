<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.nav{
    position: sticky;
    top: 0px;
    opacity: 0.8;
}
</style>
</head>
<body>
<c:set var="admin" value="${sessionScope.admin}" />
<input type="hidden" value="${admin}">
<div class="container " id="header">
    <div class="row">
        <div class="col-sm-12">
        	
			<div  class="nav">
				<a href="/minPJ02/index/index.jsp" class="menuKey" tabindex="_blank">HOME</a>
		
				<a href="" class="menuKey">BRAND</a>
		
				<a href="" class="menuKey">SHOP</a>
		
				<a href="/minPJ02/BoardViewList " class="menuKey">BOARD</a>
			
				<a href="" class="menuKey"><img alt="" src="/minPJ02/icon/search.gif"></a>
					
				<a href="" class="menuKey"><img alt="" src="/minPJ02/icon/shopping-bag.png"></a>   
		
		    </div>
        	
        </div>
        
        <div class="col-sm-3  mine">

	        <div>

				<c:if test="${admin == 1}">
				   <a href="/minPJ02/MemberList" class="MyKey">members</a>								      				
				</c:if>
			
			</div>        
        </div>
        
        <div class="col-sm-6 logo">
        
        </div>
        
        <div class="col-sm-3 mine">
        
        <div>
	
		<c:set var="id" value="${sessionScope.userId}" />
		<c:choose>			   
		<c:when test="${id != null}">	
		
			<c:choose>
			<c:when test="${admin == 1}">
				<c:out value="${id}"/> 님&nbsp;
				<a href="/minPJ02/LogOut" class="MyKey">로그아웃</a>&nbsp;
				<a href="/minPJ02/MemberSelect" class="MyKey" id="mypage">My</a>					      				
				      							      				
			</c:when>

			<c:otherwise>
				<c:out value="${id}"/> 님&nbsp;
				<a href="/minPJ02/LogOut" class="MyKey">로그아웃</a>&nbsp;
				<a href="/minPJ02/MemberSelect" class="MyKey" id="mypage">My</a>
						      			
			</c:otherwise>
			</c:choose>	
		
			      
		</c:when>
			      
		<c:otherwise>
			<a href="/minPJ02/member/login/loginForm.jsp" class="MyKey" >Login</a>&nbsp;
           	<a href="/minPJ02/member/join/insertMember.jsp" class="MyKey">Join us</a>&nbsp;
           	<a href="#" class="MyKey" id="mypage">My</a>
           	
			<script type="text/javascript">
			    $(function() {
			        $("#mypage").click(function() {
			            alert("로그인 후 마이페이지를 이용하실 수 있습니다.")
		              	location.href = "/minPJ02/member/login/loginForm.jsp"
		           	 })		            
			     });
			 </script>
		</c:otherwise>
		</c:choose>
				
		</div>
        </div>
        
        
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</body>
</html>