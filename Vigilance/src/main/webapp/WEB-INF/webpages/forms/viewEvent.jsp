<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./stylesheet.css">
</head>

<jsp:include page="/WEB-INF/bootstrap/navbar.jsp" />
<body>

	<h3>Event Information</h3>


	<c:if test="${not empty event}">
		<table class="table table-bordered">
			
			<c:if test="${not empty event.name}">
				<tr>
					<th>Event:</th>
					<td>${event.name}</td>
				</tr>
			</c:if>
			<c:if test="${not empty event.eventDate}">
				<tr>
					<th>Date:</th>
					<td>${event.eventDate}</td>
				</tr>
			</c:if>
			<c:if test="${not empty event.description}">
				<tr>
					<th>Description</th>
					<td>${event.description} 
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty event.address.neighborhood.name}">
				<tr>
					<th>Neighborhood</th>
					<td>${event.address.neighborhood.name} 
					</td>
				</tr>
			</c:if>

		</table>
		
	</c:if>

	<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>