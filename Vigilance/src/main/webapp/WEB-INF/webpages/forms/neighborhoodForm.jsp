<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Neighborhood Event</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>
<body>
 <p>Looks like we don't have a neighborhood for your address</p>
 <p>Please fill out the following fields to continue.</p>
<form action="newneighborhood.do" method="POST">
  Name<input type="text" name="name" /><br>
  Image(Optional)<input type="text" name="imageUrl" /><br>
  Description <input type="text" name="description" /><br>
 <button type="submit" class="btn btn-primary">Submit</button>
</form> 





<c:forEach var="hood" items="${hood}">
<ul>

<li> <strong>${hood.id}</strong></li>
<li> <strong>${hood.description}</strong></li>
<li> <strong>${hood.name}</strong></li>
<a href="viewAllAddress.do?id=${hood.id}"> View all address</a>
<a href="viewPostByNeighborhood.do?id=${hood.id}"> View all post</a>




</ul>
</c:forEach>





















<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>