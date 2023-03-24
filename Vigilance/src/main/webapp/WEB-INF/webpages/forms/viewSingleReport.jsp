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

<c:if test="${loggedinuser.id == report.user.id}">
							<form action="reportDeleted.do" method="POST">
							<label for="id"></label>
							 <input type="hidden" name="id"
								value="${report.id}" /> 
								<input type="submit"
								class="btn btn-danger" value="Delete" />
								 <a class="btn btn-warning" href="updateReport.do?id=${report.id}" role="button">Revise</a>

						</form>
</c:if>

	
	<jsp:include page="/WEB-INF/bootstrap/bootstrapFooter.jsp" />
</body>
</html>