<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
</head>
<body>
<form action="add" method = get>
<div class ="header">
  	<div class="logo">
  		<h1>virtual Momma</h1>
  		<div class="slogan">immortalizing the taste!</div>
  	</div>
 </div>
 
 <div class ="RecipeForm">
 Recipe Name: <input type = "text"/>
 <br>
 Ingredient: <input type = "text"/>
 Quantity: <input type = "text"/>
 <select>
 	<option value ="kg">kg</option>
 	<option value ="gm">gm</option>
 	<option value ="spoom">spoon</option>
 	<option value ="litre">litre</option>
 	<option value ="pieces">pieces</option>
 </select>
 <input type="button" name="Add to List" value = "Add to list"/>
 <br>
 Description:
 <br>
 <textarea rows="15" cols="60"></textarea>
 
 <br>
 <input type="button" name="Add" value="Add">
 <input type="button" name="Share" value="Share">
 <select>
 	<option value ="public">public</option>
 	<option value ="friend">friend</option>
 </select>
 
 <a href="#">Attach image</a>
 
 </div>
 
 </form>
 
 
 
</body>
</html>