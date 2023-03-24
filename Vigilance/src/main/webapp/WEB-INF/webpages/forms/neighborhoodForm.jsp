<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>View Reports</title>
<link rel="stylesheet" href="./stylesheet.css">
</head>

<jsp:include page="/WEB-INF/bootstrap/navbar.jsp" />
<body>

	<table class="table table-striped table-hover">
			<c:choose>
				<c:when test="${empty event}"><th>No Events Found</th></c:when>
				<c:otherwise>
		<thead>

			<th>Events for your Neighborhood</th>
			<th>Event Date</th>
		
		</thead>
		<tbody>

					<c:forEach var="event" items="${event}">
						<tr>

							<td><a href="getEventById.do?id=${event.id}"><strong>${event.name}</strong></a>
								<br> ${event.description} <br></td>
							<td>${event.eventDate}</td>
							<td></td>
						</tr>
					</c:forEach>


				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
	<table class="table table-striped table-hover">
			<c:choose>
				<c:when test="${empty post}"><th>No Post Found</th></c:when>
				<c:otherwise>
		<thead>

			<th>Post for your Neighborhood</th>

		</thead>
		<tbody>
					<c:forEach var="post" items="${post}">
						<tr>

							<td><a href="getPostById.do?id=${post.id}"><strong>${post.user.firstName}</strong></a>
								<br> ${post.createDate} <br> ${post.description} <br>

							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>


		</tbody>
	</table>
	<table class="table table-striped table-hover">
			<c:choose>
				<c:when test="${empty report}"><th>No Report Found</th></c:when>
				<c:otherwise>
		<thead>
			<th>Reports for your Neighborhood</th>


	
		</thead>
		<tbody>
					<c:forEach var="report" items="${report}">
						<tr>

							<td><a href="getReportById.do?id=${report.id}"><strong>${report.user.firstName}</strong></a>
								<br> ${report.reportDate} <br> ${report.description} <br>

							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>



		</tbody>
	</table>




	<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>