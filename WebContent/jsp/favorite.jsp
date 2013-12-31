<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favorite Recipes</title>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
</head>
<body>
<form action="Favorite" method="get">
<div class ="header">
  	<div class="logo">
  		<h1>virtual Momma</h1>
  		<div class="slogan">immortalizing the taste!</div>
  	</div>
 </div>
 <div>
 <table width="200" border="1" class="favoriterecipe">
	 <c:forEach var="recipe" items="${recipes}">
	 <tr><td>
	 	<a href="/VirtualMomma/view?imageid=${recipe.recipeId}" class="link">${recipe.recipeName}</a>
	 	</td></tr>
	 </c:forEach>
</table>
 </div>


</form>
</body>
</html>