<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
}

/* Create three unequal columns that floats next to each other */
.column {
  float: left;
  padding: 10px;
}

/* Left and right column */
.column.side {
  width: 25%;
}

/* Middle column */
.column.middle {
  width: 50%;
  border-style: solid;
  border-color: black;
  
}
/* Clear floats after the columns */
.row::after {
  content: "";
  display: table;
  clear: both;
}

</style>
</head>
<body>

<div class="row">
  <div class="column side">
    <h2>Make a Post</h2>
    <form action="addPost.do" method="POST">
		
		<label for="description">Enter a Description:</label> 
		<input type="text" name="description" value="" /> 
		<br> 
		<label for="hoodId">Neighborhood</label> 
		<input type="number" name="hoodId" value="" /> 
		<br> 
		<input name="userId" type="number" value="${user.id}"></input>
		<br> 
		
		
		
		
		
		<input type="submit" class="btn btn-success"value="Post">
	</form>
  </div>





</body>
</html>