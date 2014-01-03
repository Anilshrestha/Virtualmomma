<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
<link rel="stylesheet" type="text/css" media="all" href="jsp/jsDatePick_ltr.min.css"></link>
<script type="text/javascript" src="jsp/jsDatePick.min.1.3.js"></script>
<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"inputField",
			dateFormat:"%Y-%m-%d"
			/*selectedDate:{				This is an example of what the full configuration offers.
				day:5,						For full documentation about these settings please see the full version of the code.
				month:9,
				year:2006
			},
			yearsRange:[1978,2020],
			limitToToday:false,
			cellColorScheme:"beige",
			dateFormat:"%m-%d-%Y",
			imgPath:"img/",
			weekStartDay:1*/
		});
	};
</script>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
<form action="invite" method = get>
	<div class ="header">
  		<div class="logo">
  			<h1>virtual Momma</h1>
  			<div class="slogan">immortalizing the taste!</div>
  		</div>
 	 </div>
 	 
 	 <div class="InvitationForm">
 	 	Invitation for
 	 	<select name="invitationType">
 	 		<option value ="Dinner">Dinner</option>
 	 		<option value ="Lunch">Lunch</option>
 	 	</select>
 	 </div>	
 	 	<br>
 	 <div class="chooseRecipe">
 	 	Recipe
 	 	<select name="recipeName">
 	 		<!-- <option value ="Yomari">Yomari</option>
 	 		<option value ="momo">momo</option> -->
 	 		<c:forEach var ="recipeName" items="${availableRecipe}">
 	 			<option>${recipeName.recipeName}</option>
 	 		</c:forEach>
 	 	</select>
 	 	
 	 	Invitation Date:<input type="text" name ="invitationDate" id="inputField"/>	
 	 	<input type="hidden" name ="id" value="${currentSessionUser.userid}"/>
 	  </div>
 	  
 	  <div>
 	  	<br/>
 	 	
 	 	<table border="1" height="5" width="200">
 	 	<c:forEach var = "friends" items="${userFriends}">
 	 		<tr>
 	 			<td>
 	 				${friends.fName}
 	 				<input type="hidden" name ="friendid" value="${friends.userid}"/>
 	 			</td>
 	 			<td>
 	 				<input type="checkbox" name ="checkbox"/>
 	 			</td>
 	 		</tr>
 	 	</c:forEach>
 	 	
 	 	</table>
 	  </div>
 	  
	 <input type = "submit" name="invite" value="invite"> 	 
 	  
 	 
 	
 	


 </form>
 
 
 
</body>
</html>