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

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>






<c:forEach var="event" items="${event}">
<ul>
<li> <a href="getEventById.do?id=${event.id}"><strong>${event.description}</strong></a></li>
<li> <strong>${event.name}</strong></li>
<li> <strong>${event.eventDate}</strong></li>
<li> <strong>${event.address}</strong></li>

</ul>
</c:forEach>





<div>

<h2> create a new event</h2>
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










<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>