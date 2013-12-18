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
<title>Implementing css and javascript</title>

<link rel="stylesheet" href="css/style.css" type="text/css"></link>
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
  			<table border = "1" height = "10" width = "100">
	
				<tr>
					<th>Choose Recipes</th>
				</tr>
				
				<c:forEach items="${recipeImageList}" var="imageName">
    				<td> ${recipeImageList.image}</td>
				</c:forEach>
				
	
				
			</table>
  			
  			
  		</div>
  		
  		<div class="rsignup">
  			<input type="text" name ="Full Name" value="Full Name" class="logout_refine" 
  			onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'Full Name'; this.style.color = 
			'#BBB';}"/>
  			<br>
  			<input type="text" name ="email" value="email" 
			class="logout_refine"  onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'email'; 
			this.style.color = '#BBB';}"/>
  			<br>
  			<input type="password" name ="password" value="password" 
			class="logout_refine" onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'password'; 
			this.style.color = '#BBB';}"/>
  			<br>
  			<input type="radio" name="sex" value="male" class="remaining"/>Male
			<input type="radio" name="sex" value="female" class="remaining"/>Female
			<br>
			<div class ="remaining">By clicking Sign up, you are indicating that you have read and 
			agree to our <a href="#">Terms of Service</a> and <a href ="#">Privacy Policy</a>
			<input type="submit" name="submit" value="Sign Up" class 
			="signupButton"/></div>
			
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