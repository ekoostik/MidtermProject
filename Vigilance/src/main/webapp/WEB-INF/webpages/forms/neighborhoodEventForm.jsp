<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Neighborhood Event</title>
<link rel="stylesheet" href="./stylesheet.css">
</head>

<jsp:include page="/WEB-INF/bootstrap/navbar.jsp" />
<body>




<div>

<h2> Create a new event</h2>
<form action="addNevent.do" method="POST">
	<label for="name">Event Name</label>
	<input type="text" name="name" value=""/>
	<br>
	<label for="description">Description</label>
	<input type="text" name="name" value=""/>
	<br>
	<label for="eventDate">Event Date</label>
	<input type="date" name="name" value=""/>
	<br>
	<label for="createDate">Create Date</label>
	<input type="date" name="name" value=""/>
	<br>
	<label for="neighborhoodId">Neighborhood</label>
	<input type="text" name="name" value=""/>
	<br>
	<label for="address">Address</label>
	<input type="text" name="name" value=""/>
	<br>
	<input type="submit" class="btn btn-success"value="Add Event">
</form>

</div>










<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>