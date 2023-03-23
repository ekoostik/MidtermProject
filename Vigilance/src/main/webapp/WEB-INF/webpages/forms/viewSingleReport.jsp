<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../bootstrap/bootstrapHeader.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/stylesheet.css">
</head>

<jsp:include page="../../bootstrap/navbar.jsp" />
<body>

	<h3>Report Information</h3>


	<c:if test="${not empty report}">
		<table class="table table-bordered">
			<c:if test="${not empty report.id}">
				<tr>
					<th scope="col">Report Number</th>
					<td>${report.id}</td>
				</tr>
			</c:if>
			<c:if test="${not empty report.user.firstName}">
				<tr>
					<th>Reported By:</th>
					<td>${report.user.firstName}${report.user.lastName}</td>
				</tr>
			</c:if>
			<c:if test="${not empty report.reportDate}">
				<tr>
					<th>Report Date:</th>
					<td>${report.reportDate}</td>
				</tr>
			</c:if>
			<c:if test="${not empty report.contactAuthority}">
				<tr>
					<th>Police Were Contacted:</th>
					<td><c:choose>
							<c:when test="${report.contactAuthority}">yes</c:when>
							<c:otherwise>no</c:otherwise>
						</c:choose></td>
				</tr>
			</c:if>
			<c:if test="${not empty report.description}">
				<tr>
					<th>Description</th>
					<td>${report.description} 
					</td>
				</tr>
			</c:if>

		</table>
		<c:if test="${not empty report.animals}">
			<h3>Animals Involved</h3>
			<c:forEach var="animal" items="${report.animals}">
			<li>Species Involved: ${animal.species }</li>
			<li>Full Description: ${animal.description}</li>
			<li>Spotting Date: ${animal.spottingTime}</li>
			</c:forEach>
		</c:if>
	</c:if>
	<form action="updateReport.do" method="GET">
		<input type="hidden" name="id" value="${report.id}"> <input
			type="submit" value="Update">
	</form>

	<jsp:include page="../../bootstrap/bootstrapFooter.jsp" />
</body>
</html>