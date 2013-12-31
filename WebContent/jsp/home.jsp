<%@page language="java"  
contentType="text/html;charset=ISO-8859-1" %> 
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 
ransitional//EN" "http://www.w3.org/
  TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Virtual Momma</title>

<link rel="stylesheet" href="css/style.css" type="text/css"></link>
<script type="text/javascript" src="../js/home.js"></script>
</head>
<body>

<form action ="index" method="get">
  
  <div class ="header">
  	<div class="logo">
  		<h1>virtual Momma</h1>
  		<div class="slogan">immortalizing the taste!</div>
  	</div>
  	
  	
  	<div class="login">
  		<input type="text" name ="email" value="email" class="inputbox" onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'email'; this.style.color = '#BBB';}"/>
  		<input type="password" name ="password" value="password" class="inputbox" onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'password'; this.style.color = '#BBB';}"/>
  		<input type="submit" name="submitLogin" value="login" class="submitButton"/>
  		<br>
  		
  		<div>
  			<input type="checkbox" name="checkbox"/>Remember me
  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<a href="facebook.com" class="link">forgotpassword?</a>
  		</div>
  		 
  	</div>
  </div>
  
  	<div id="recipe_listing">
  	<div class="signup">
  		<div class="xyz">
  			
	
		<table border =1 width ="927" height="490">
		<tr>
				<td>					
				<c:forEach items="${imageList}" var ="image" varStatus="imageCounter" begin="0" end="2">
					<c:forEach items="${recipeList}" var="recipe" varStatus="recipeCounter">
							<c:if test="${imageCounter.count eq recipeCounter.count }">
								<br/>
								<a href ="/VirtualMomma/view?imageid=${image.imageid}"><img src ="image/${image.imagename}"/></a>			
								<br/>
								RecipeName:<a href="/VirtualMomma/view?imageid=${image.imageid}" class="link"><b><c:out value="${recipe.recipeName}"></c:out></b></a>
							</c:if>
							
								
					</c:forEach>
					<c:forEach items="${userList}" var="user" varStatus="userCounter">
												 
						<c:if test="${imageCounter.count eq userCounter.count }">
							<br/>
							By:<c:out value="${user.fName}"></c:out>
							<br/>
						</c:if>
					</c:forEach>
									
				</c:forEach>
				</td>
				
				<td>					
				<c:forEach items="${imageList}" var ="image" varStatus="imageCounter" begin="3" end="5">
					<c:forEach items="${recipeList}" var="recipe" varStatus="recipeCounter" begin="3" end="5">
							<c:if test="${imageCounter.count eq recipeCounter.count }">
								<br/>
									<a href ="/VirtualMomma/view?imageid=${image.imageid}"><img src ="image/${image.imagename}"/></a>			
								<br/>
								RecipeName:<a href="/VirtualMomma/view?imageid=${image.imageid}" class="link"><b><c:out value="${recipe.recipeName}"></c:out></b></a>
							</c:if>
							
								
					</c:forEach>
					<c:forEach items="${userList}" var="user" varStatus="userCounter" begin="3" end="5">
												 
						<c:if test="${imageCounter.count eq userCounter.count }">
							<br/>
							By:<c:out value="${user.fName}"></c:out>
							<br/>
						</c:if>
					</c:forEach>
									
				</c:forEach>
				</td>
				
				<td>					
				<c:forEach items="${imageList}" var ="image" varStatus="imageCounter" begin="6" end="8">
					<c:forEach items="${recipeList}" var="recipe" varStatus="recipeCounter" begin="6" end="8">
							<c:if test="${imageCounter.count eq recipeCounter.count }">
								<br/>
									<a href ="/VirtualMomma/view?imageid=${image.imageid}"><img src ="image/${image.imagename}"/></a>			
								<br/>
								RecipeName:<a href="/VirtualMomma/view?imageid=${image.imageid}" class="link"><b><c:out value="${recipe.recipeName}"></c:out></b></a>
							</c:if>
							
								
					</c:forEach>
					<c:forEach items="${userList}" var="user" varStatus="userCounter" begin="6" end="8">
												 
						<c:if test="${imageCounter.count eq userCounter.count }">
							<br/>
							By:<c:out value="${user.fName}"></c:out>
							<br/>
						</c:if>
					</c:forEach>
									
				</c:forEach>
				</td>
				
				<td>					
				<c:forEach items="${imageList}" var ="image" varStatus="imageCounter" begin="9" end="11">
					<c:forEach items="${recipeList}" var="recipe" varStatus="recipeCounter" begin="9" end="11">
							<c:if test="${imageCounter.count eq recipeCounter.count }">
								<br/>
									<a href ="/VirtualMomma/view?imageid=${image.imageid}"><img src ="image/${image.imagename}"/></a>			
								<br/>
								RecipeName:<a href="/VirtualMomma/view?imageid=${image.imageid}" class="link"><b><c:out value="${recipe.recipeName}"></c:out></b></a>
							</c:if>
							
								
					</c:forEach>
					<c:forEach items="${userList}" var="user" varStatus="userCounter" begin="9" end="11">
												 
						<c:if test="${imageCounter.count eq userCounter.count }">
							<br/>
							By:<c:out value="${user.fName}"></c:out>
							<br/>
						</c:if>
					</c:forEach>
									
				</c:forEach>
				</td>
				
				<td>					
				<c:forEach items="${imageList}" var ="image" varStatus="imageCounter" begin="12" end="14">
					<c:forEach items="${recipeList}" var="recipe" varStatus="recipeCounter" begin="12" end="14">
							<c:if test="${imageCounter.count eq recipeCounter.count }">
								<br/>
									<a href ="/VirtualMomma/view?imageid=${image.imageid}"><img src ="image/${image.imagename}"/></a>			
								<br/>
								RecipeName:<a href="/VirtualMomma/view?imageid=${image.imageid}" class="link"><b><c:out value="${recipe.recipeName}"></c:out></b></a>
							</c:if>
							
								
					</c:forEach>
					<c:forEach items="${userList}" var="user" varStatus="userCounter" begin="12" end="14">
												 
						<c:if test="${imageCounter.count eq userCounter.count }">
							<br/>
							By:<c:out value="${user.fName}"></c:out>
							<br/>
						</c:if>
					</c:forEach>
									
				</c:forEach>
				</td>
				
				
										
    	<tr>
    			
		</table>
		
  		</div>
  		
  		<div class="rsignup">
  			<input type="text" name ="FName" value="First Name" class="logout_refine" 
  			onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'Full Name'; this.style.color = 
			'#BBB';}"/>
			<input type="text" name ="LName" value="Last Name" class="logout_refine" 
  			onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'Full Name'; this.style.color = 
			'#BBB';}"/>
  			<br/>
  			<input type="text" name ="useremail" value="email" class="logout_refine" 
  			onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'email'; this.style.color = 
			'#BBB';}"/>
			<br/>
			<input type="text" name ="userpassword" value="password" class="logout_refine" 
  			onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'password'; this.style.color = 
			'#BBB';}"/>
			<br/>
			<div class ="remaining">By clicking Sign up, you are indicating that you have read and 
			agree to our <a href="#">Terms of Service</a> and <a href ="#">Privacy Policy</a>
			<input type="submit" name="signup" value="Sign Up" class ="signupButton"/></div>
			
			<div class="lsignup">
			<div id="quotes">
			    <div class="textItem">
			        "If you knew how to cook, maybe I would eat." 
			        <div class="author">- Jace muttered</div>
			    </div>
		    <div class="textItem">
		        "I cook with wine, sometimes I even add it to the food." 
				<div class="author">- W.C. Fields</div>
		    </div>  
		    <div class="textItem">
		        "...no one is born a great cook, one learns by doing."
				<div class="author">-Julia Child</div>
		    </div>
		    <div class="textItem">"if god had intended us to follow recipes,
		     He wouldn't<br>have given us grandmothers."
		     <div class="author">-Linda Henley</div>
		    </div>
  			</div>
			
			</div>
  		 </div>
  	</div>
  	</div>
  	
  	<div class="footer">
  		&copy;2013 virtualmomma
  	</div>
  
</form>
</body>