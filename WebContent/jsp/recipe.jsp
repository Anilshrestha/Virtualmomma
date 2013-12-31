<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Recipe/Ingredients</title>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>

</head>
<body>
<form action="AddRecipeIngredient" method ="get">
<div class ="header">
  	<div class="logo">
  		<h1>virtual Momma</h1>
  		<div class="slogan">immortalizing the taste!</div>
  	</div>
 </div>
 welcome "${currentSessionUser.fName}"
 <div class ="RecipeForm">

Recipe Name:<input type ="text" name ="recipeName"/>
<input type="hidden" name ="id" value="${currentSessionUser.userid}"/>

<br/>
Ingredient: <input type = "text" name="ingredientName"/>
Quantity: <input type = "text" name="quantity"/>

<select name="category">
 	<option value ="kg">kg</option>
 	<option value ="gm">gm</option>
 	<option value ="spoon">spoon</option>
 	<option value ="liter">liter</option>
 	<option value ="pieces">pieces</option>
 </select>
 <input type="submit" name="AddIngredient" value="Add Ingredient"/> &nbsp;&nbsp;${successmsg}
 
 <br/>
Description:
 <br/>
 <textarea rows="15" cols="60" name="description"></textarea>
 <br/>
 Recipe status:
<select name ="status">
 	<option value ="public">public</option>
 	<option value ="friend">friend</option>
 </select>
 
 <br/>
 <input type="submit" name="Add" value="Add"/>
 
 <input type="submit" name="Share" value="Share"/>
 
 <h2> ${successmsg}</h2>
 <h3>${successsharedmsg}</h3>
 

</div> 
</form>
</body>
</html>