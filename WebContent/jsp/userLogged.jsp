<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
<link rel="stylesheet" href="css/newsfeed.css" type="text/css"></link>
</head>
<body>
<form action="logged" method ="get">
<div class ="header">
  	<div class="logo">
  		<h1>virtual Momma</h1>
  		<div class="slogan">immortalizing the taste!</div>
  	</div>
  	
 </div>
  <div class="logout">
  		<input type="button" name="logout" value="logout" class="logout"/>  		
  	</div> 
  	
  	
  	
 <div class="bodybox">
 <div class="welcome">Welcome ${currentSessionUser.fName},</div> 
 <!-- <div><img src="H:/kepler/VirtualMomma/WebContent/requiredImages/N.PNG" class = "notification"/></div> -->
 
 	<div class="outernewsfeed">
 		<div class="innernewsfeed">
 			<input type="hidden" name="newsfeed" value="${currentSessionUser.userid}"/>
 			
	 			<c:forEach items="${map}" var ="map">

	 					<%-- <p><c:out value="${map.username}"></c:out></p>&nbsp;&nbsp;&nbsp;shared recipe&nbsp;&nbsp;&nbsp; <p><c:out value="${map.recipename}"></c:out>&nbsp;&nbsp;&nbsp; with you.</p> --%>
	 					<p>${map.username} shared <a href="/VirtualMomma/view?imageid=${map.imageid}">${map.recipename}</a> with you.</p>
	 					<a href ="/VirtualMomma/view?imageid=${map.imageid}"><img src ="image/${map.imagename}"/></a>
	 					 <br/>
	 					<p><a href="/VirtualMomma/favorite?recipeid=${map.recipeid}&amp;friendid=${map.friendid}&amp;userid=${map.userid}">Add to favourite</a></p>
	 					<br/>
	 					
	 			</c:forEach>
	 			
	 			<c:forEach items="${invitation}" var ="invitation">
	 				<p>${invitation.username} invited you for <em>${invitation.invitationType}</em> on <em>${invitation.invitationForDate}</em>. It's time to have fun  with your favorite recipe <em>${invitation.recipeNameChoosen}.</em>  </p>
	 			</c:forEach>
	 			
	 			
	 			
 		</div>
 		
 		<div class="menu_panel">
	 		<input type = "submit" name="AddRecipe" value="Add recipe" class="userloggedButton"/>
	 		<input type = "submit" name="Invite" value="Invite" class="userloggedButton"/>
	 		<input type = "submit" name="favorite" value="Favorites" class="userloggedButton"/>
 		</div>
 		
 		
 	
 	</div>
 	 
 	
 	
 	
 </div>
 </form>
</body>
</html>