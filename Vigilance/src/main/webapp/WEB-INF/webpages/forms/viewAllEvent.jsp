<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>View Reports</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>

	<table class="table table-striped table-hover">
		<thead>
			
			<th>Event</th>
			<th>Event Date</th>
			<!-- header -->
			<!--header  -->
		</thead>
		<tbody>
			<c:forEach var="event" items="${event}">
				<tr>
					<c:if test="${not empty event}">
						
						<td>
						<a href="getEventById.do?id=${event.id}"><strong>${event.name}</strong></a>
						<br>
						${event.description}
						<br>
						In the ${event.address.neighborhood.name} Neighborhood
						</td>
						<td>${event.eventDate}</td>
						<td></td>
					</c:if>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
<button onclick="window.location.href='addEvent.do';">New Event</button>

	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>