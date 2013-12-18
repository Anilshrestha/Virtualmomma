<%@page language="java"  
contentType="text/html;charset=ISO-8859-1" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 
ransitional//EN" "http://www.w3.org/
  TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Implementing css and javascript</title>

<link rel="stylesheet" href="css/style.css" type="text/css"></link>
<script type="text/javascript" src="./jquery/jquery-1.8.0.min.js"></script>

<script>

$(document).ready(function() {

$('#quotes .textItem').hide();
	InOut($('#quotes .textItem:first'));

	function InOut(elem) {
	    elem.delay().slideUp(5000).delay(0).slideDown(5000, function() {
	        if (elem.next().length > 0) {
	            InOut($(this).next());
	        }
	        else {
	            InOut($(this).siblings(':first'));
	        }

	    });
	}

	$('#quotes .textItem').mouseover(function() {
	    $(this).stop(true, true);
	});
	$('#quotes .textItem').mouseout(function() {
	    if ($(this).is(":visible") == true) {
	        InOut($(this));
	    }
	});
	});

</script>

<script language="JavaScript" type="text/JavaScript">
	function validate(){
	  if(document.login.email.value.length==0){
	  alert("UserId can't be blank");
	  document.login.email.focus();
	   return false;
	  }else if(document.login.password.value.length==0){
	  alert("Password can't be blank");
	  document.login.password.focus();
	  return false;
	  }else if(document.login.password.value.length<6){
	  alert("Password length can't be less than 6 char");
	  document.login.password.focus();
	  return false;
	  }
	}
</script>
</head>
<body>

<form enctype="multipart/form-data" onSubmit="return validate(this)" action ="index" method="get" name=login>
  <%-- <table border = "green solid 1px">
  <tr align="right" valign="top">
  <td>User Name:</td>
  <td><input type="text" name ="email" class="inputbox"/></td>
  <td>Password:</td>
  <td><input type="password" name ="password" class="inputbox"/></td>
  </tr>
  
  <tr align="left" valign="top">
  <td></td>
  <td><input type="submit" name="submit" 
  value="login" class="submitButton"/>
  <input type="submit" name="submit" 
  value="logout" class="submitButton"/>
  </td>
  
  </tr>
  </table>--%>
  <div class ="header">
  	<div class="logo">
  		<h1>virtual Momma</h1>
  		<div class="slogan">immortalizing the taste!</div>
  	</div>
  	
  	
  	<div class="login">
  		<input type="text" name ="email" value="email" class="inputbox" onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'email'; this.style.color = '#BBB';}"/>
  		<input type="password" name ="password" value="password" class="inputbox" onFocus="this.value=''" onblur="if(this.value == ''){ this.value = 'password'; this.style.color = '#BBB';}"/>
  		<input type="submit" name="submit" value="login" class="submitButton"/>
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