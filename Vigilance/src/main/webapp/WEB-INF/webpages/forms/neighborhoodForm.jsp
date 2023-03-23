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
			
			<th>Events for your Neighborhood</th>
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
						
						</td>
						<td>${event.eventDate}</td>
						<td></td>
					</c:if>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table class="table table-striped table-hover">
		<thead>
			
			<th>Post for your Neighborhood</th>
			
			
			<!-- header -->
			<!--header  -->
		</thead>
		<tbody>
			<c:forEach var="post" items="${post}">
				<tr>
					<c:if test="${not empty post}">
						
						<td>
						<a href="getEventById.do?id=${post.id}"><strong>${post.user.firstName}</strong></a>
						<br>
						${post.createDate}
						<br>
						${post.description}
						<br>
			
						</td>
					
					</c:if>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<table class="table table-striped table-hover">
		<thead>
			<th>Reports for your Neighborhood</th>
			
			
			<!-- header -->
			<!--header  -->
		</thead>
		<tbody>
			<c:forEach var="report" items="${report}">
				<tr>
					<c:if test="${not empty report}">
						
						<td>
						<a href="getEventById.do?id=${report.id}"><strong>${report.user.firstName}</strong></a>
						<br>
						${report.reportDate}
						<br>
						${report.description}
						<br>
			
						</td>
					
					</c:if>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

	

	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>