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
		<label for="createDate">Event Date:</label> 
		<input type="date" name="createDate" value="" /> 
		<br> 
		<label for="description">Enter a Description:</label> 
		<input type="text" name="description" value="" /> 
		<br> 
		<label for="nid">Neighborhood</label> 
		<input type="number" name="nid" value="" /> 
		<br> 
		
		
		
		
		
		<input type="submit" class="btn btn-success"value="Post">
	</form>
  </div>

 <div class="column middle">
<c:forEach var="post" items="${post}">
<ul>
<li> <a href="getPostById.do?id=${post.id}"><strong>${post.description}</strong></a></li>
<li> <strong>${post.image}</strong></li>
<li> <strong>${post.createDate}</strong></li>
<li> <strong>${post.user.firstName}</strong></li>
<li> <strong>${post.comments}</strong></li>

				<form action="deletePost.do" method="POST">
				<label for="id"></label> 
				<input type="hidden" name="id" value="${post.id}" />
				<input type="submit" class="btn btn-danger"value="Delete" />
			</form>
</ul>
</c:forEach>





</body>
</html>