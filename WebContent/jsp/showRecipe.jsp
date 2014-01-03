<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Recipe</title>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
</head>
<body>
<form action="ViewRecipe" method ="get">
<div class ="header">
  	<div class="logo">
  		<h1>virtual Momma</h1>
  		<div class="slogan">immortalizing the taste!</div>
  	</div>
 </div>
 <div>
	 <h1>Ingredients:</h1><br/>
	 <table>
	 
	 <c:forEach var ="ing" items ="${ingredientList}" varStatus="counter">
	 <tr>	<td class="abc">
	 	${counter.count}) ${ing.ingredientname} 
	 	${ing.quantity}
	 	${ing.unit}
	 </td></tr>	
	 </c:forEach>
	 
	 </table>
 </div>
 
 <div>
	<h1>Method:</h1><br/>
	<table>
	
		
		<c:forEach  var = "recipes" items="${recipe}" varStatus="counter">
		
				${recipes.description}
					
		</c:forEach>
	</table>
</div>	
</form>


</body>
</html>